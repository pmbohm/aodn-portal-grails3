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

    def facets = {
        render(
                view: "index",
                model:[
                        facet
                        resourceVersionNumber: grailsApplication.metadata.'app.version',
                        portalConf: grailsApplication.config.portal,
                ]
        )
    }

}
