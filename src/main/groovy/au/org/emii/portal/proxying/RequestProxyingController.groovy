package au.org.emii.portal.proxying

import au.com.bytecode.opencsv.CSVReader
import au.org.emii.portal.HttpUtils

//import au.com.bytecode.opencsv.CSVReader

import javax.servlet.http.Cookie

import static au.org.emii.portal.HttpUtils.buildAttachmentHeaderValueWithFilename

abstract class RequestProxyingController extends HostVerifyingController {

   //def grailsApplication

    def index = {

        _performProxyingIfAllowed()
    }

    def _performProxyingIfAllowed = { paramProcessor = null, streamProcessor = null, fieldName = null ->

        log.debug "proxying url: ${params.url}"

        def url = params.url

        ifAllowed(url) {
            _performProxying(paramProcessor, streamProcessor, fieldName, url)
        }
    }

    def _performProxying = { paramProcessor = null, streamProcessor = null, fieldName = null, probeUrl = null ->

        if (probeUrl && fieldName) {

            def resultStream = new ByteArrayOutputStream()
            def probeStreamProcessor = probeStreamProcessor(fieldName)

            try {
                _executeProbeRequest(probeUrl, probeStreamProcessor, resultStream)
            }
            catch (Exception e) {
                log.error "Could not download list of urls ", e
                render text: "An error occurred before downloading could begin", contentType: "text/html", encoding: "UTF-8", status: HttpUtils.Status.HTTP_500_INTERNAL_SERVER_ERROR
                return
            }
        }
        _addDownloadTokenCookie()
        _setDownloadFilename(response, params)

        try {
            _makeRequest(request, response, params, paramProcessor, streamProcessor)
        }
        catch (IOException e) {
            def msg = String.format("Could not reach %s %s", probeUrl, e.message)
            log.error msg
            _addDownloadFailedCookie()
            render text: msg, contentType: "text/html", encoding: "UTF-8", status: HttpUtils.Status.HTTP_503_GATEWAY_TIMEOUT
            return
        }
    }

    def _addDownloadTokenCookie = {
        if (params.downloadToken) {
            response.addCookie(_newDownloadTokenCookie(params.downloadToken))
        }
    }

    def _addDownloadFailedCookie = {
        if (params.downloadToken) {
            response.addCookie(new Cookie("downloadFailed", "true"))
        }
    }

    def _newDownloadTokenCookie = { downloadToken ->
        new Cookie("downloadToken${downloadToken}", downloadToken)
    }

    def _makeRequest = { request, response, params, paramProcessor, streamProcessor ->
        def processedParams = paramProcessor ? paramProcessor(params) : params
        def proxiedRequest = new ProxiedRequest(request, response, processedParams, grailsApplication)
        proxiedRequest.proxy(streamProcessor)
    }

    def _setDownloadFilename(response, params) {

        def downloadFilename = params.remove('downloadFilename')
        if (downloadFilename) {
            log.debug "Download filename is '${downloadFilename}'. Forcing download."
            response.setHeader("Content-disposition", buildAttachmentHeaderValueWithFilename(downloadFilename))
        }
    }

    def probeStreamProcessor(fieldName) {

        return { inputStream, outputStream ->

            log.debug "probe streamProcessor"

            def outputWriter = new OutputStreamWriter(outputStream)
            def csvReader = new CSVReader(new InputStreamReader(inputStream))
            def firstRow = csvReader.readNext() as List

            def fieldIndex = firstRow.findIndexOf { it == fieldName }

            if (fieldIndex == -1) {
                log.error "Could not find index of '$fieldName' in $firstRow"
            }

            outputWriter.flush()
        }
    }

    void _executeProbeRequest(url, streamProcessor, resultStream) {

        def request = new ExternalRequest(resultStream, url.toURL())
        request.executeRequest streamProcessor
    }
}
