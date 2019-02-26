<div id="header"class="headerHeightOverlord" >
    <div id="header-bg-image"></div>
    <div id="logoContainer">
        <a href="${createLink(uri: '', absolute: true)}"><img src="${portalConf.logo}" alt="main logo" width="180" />
        </a>
    </div>
    <div id="headerContainer" >
        <h1 id="headerTitle">${portalConf.siteHeader}</h1>
    </div>
    <g:if test="${portalConf.secondaryLogo}">
    <div id="secondaryLogoContainer">
        <img src="${portalConf.secondaryLogo}" alt="secondary logo" width="120" />
    </div>
    </g:if>

    <div id="toplinks">
        <g:each in="${grailsApplication.config.portal.header.externalLinks}" var="link">
            <a class="external mainlinks" target="_blank" href="${link.href}" title="${link.tooltipText}">${link.linkText}</a>
        </g:each>
    </div>
</div>
<g:if test="${showLinks}">
    <div id="viewPortLinks">
        <g:each var="viewPortLink" status="i"
            in="${[['tabIndex': 'TAB_INDEX_SEARCH', 'description': 'Select a Data Collection'],
                   ['tabIndex': 'TAB_INDEX_VISUALISE', 'description': 'Create a Subset'],
                   ['tabIndex': 'TAB_INDEX_DOWNLOAD', 'description': 'Download']]}" >
            <g:render template="/header/viewPortLink"
                model="['stepIndex': i, 'tabIndex': viewPortLink.tabIndex, 'description': viewPortLink.description]" />
        </g:each>
        <div style="clear:both"></div>
    </div>
</g:if>

