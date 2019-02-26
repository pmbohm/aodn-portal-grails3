<g:render template="/core_theme_includes"></g:render>

<asset:stylesheet src="general.css"/>
<asset:stylesheet src="font-awesome-4.3.0/css/font-awesome.min.css"/>

<g:if test="${grailsApplication.config.portal.localThemeCss}">
    <asset:stylesheet src="${grailsApplication.config.portal.localThemeCss}"/>
</g:if>

<link href='https://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'>
