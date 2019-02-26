package au.org.emii.portal

class LandingController {

    def index = {

        render(
            view: "index",
            model:[
                resourceVersionNumber: grailsApplication.metadata.'app.version',
                portalConf: grailsApplication.config.portal,
            ]
        )
    }

}
