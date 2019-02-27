package au.org.emii.portal

import au.org.emii.portal.proxying.RequestProxyingController

class ProxyController extends RequestProxyingController {

    def index = {
        super._performProxyingIfAllowed(params)
    }
}
