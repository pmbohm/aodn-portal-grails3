package au.org.emii.portal

import grails.converters.JSON

class SearchController {

   //def grailsApplication
    //def portalConf

    static final def CONFIG_KEYS_TO_IGNORE = [ "log4j", "beans" ]

    def index = { // This is the main portal entry
        [
            resourceVersionNumber: grailsApplication.metadata.'app.version',
            portalConf: grailsApplication.config.portal
        ]
    }

    def uuid = {
        redirect(uri: "/search?uuid=" +  params.id + "&info=true")
    }

    def config = {

        // Workaround a problem converting to JSON (trying to convert the filtered
        // items results in an exception - the keys defined in CONFIG_KEYS_TO_IGNORE
        // contain closures, which don't play well when with JSON converters.
        def filteredConfig = grailsApplication.config.findAll {
            k, v ->
            !CONFIG_KEYS_TO_IGNORE.contains(k)
        }

        render(contentType: "text/json", text: filteredConfig as JSON)
    }

    def footerContent = {
        render text: grailsApplication.config.footerContent
    }
}
