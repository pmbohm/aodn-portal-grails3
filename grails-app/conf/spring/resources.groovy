import net.sf.json.JSONNull



// Place your Spring DSL code here
beans = {

/*    hostVerifier(au.org.emii.portal.HostVerifier) { bean ->
        grailsApplication = ref('grailsApplication')
    }

    portalConf(au.org.emii.portal.portalConf) { bean ->
        grailsApplication = ref('grailsApplication')
    }*/

    grails.converters.JSON.registerObjectMarshaller(JSONNull, { return "" })


}
