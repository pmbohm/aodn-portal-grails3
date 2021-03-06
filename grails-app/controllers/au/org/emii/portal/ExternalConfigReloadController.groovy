package au.org.emii.portal

class ExternalConfigReloadController {

    //static final Logger log = LoggerFactory.getLogger(this)

    //def grailsApplication

    def index() {
        def config = grailsApplication.config
        def locations = config.grails.config.locations

        locations.each { location ->
            String configFileName = location.replaceFirst(~/^file:/, '')
            File configFile = new File(configFileName)

            if (configFile.exists()) {
                log.info "Reloading config from file '${configFileName}'..."
                config.merge(new ConfigSlurper().parse(configFile.text))
            } else {
                log.debug "File for config location '${location}' doesn't exist."
            }
        }
        render(status: 200, text: 'OK')
    }

    def beforeInterceptor = {
        if (!["127.0.0.1", "0:0:0:0:0:0:0:1"].contains(request.remoteAddr)) {
            render(status: 401, text: 'Unauthorized')
            return false
        }
    }
}
