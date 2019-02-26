<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="content-script-type" content="text/javascript" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${portalConf.siteHeader}</title>

   <buildInfo:comment />

    <g:render template="/public_theme_includes"></g:render>
    <g:render template="/landing_theme_includes"></g:render>

    <script type="text/javascript">
        %{--<portal:motdPopup />  todo fix --}%

        $(document).ready(function() {
            // Supporting only Firefox and Chrome users
            browserCheck();

            $window = $(window);

            $('section[data-uitype="background"]').each(function() {
                var element = $(this);
                $(window).scroll(function() {
                    var yPos = -($window.scrollTop() / element.data('speed'));
                    element.css({backgroundPosition: '50% ' + yPos + 'px'});
                });
            });
        });

    </script>
</head>

<body>

<nav class="">
    <g:render template="/header/mainPortalHeader" model="['showLinks': false, 'portalConf': portalConf]"></g:render>
</nav>

<!-- first section - Home -->
<section id="home" data-uitype="background" data-speed="4">
    <div class="container">
        <div class="row">

            <div class="col-md-5 ">
sdasdasd
              %{--<g:render template="/searchTree"></g:render>--}%
            </div>
            <div class="col-md-7 text-left">
                <div class="text-vcenter">
                    <div class="homeContent">
                        <h1>AODN Portal</h1>

                        <p>"The gateway to Australian marine and climate science data"</p>

                        <div><a href="search" class="btn btn-primary btn-lg">Get Ocean Data Now</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<section id="information" data-uitype="fade">
    <div class="container">
        <div class="row">

            <div class="col-md-5 text-left">
                <div class="footerText">
                    <div class="panel-body">
                        <p>
                            The <strong>AODN Portal</strong> provides access to all available Australian marine and climate science data and provides the primary access to IMOS data including access to the IMOS metadata.
                        </p>

                        <p>
                            IMOS is a national collaborative research infrastructure, supported by
                            Australian Government. It is operated by a consortium of institutions as
                            an unincorporated joint venture, with the <a target="_blank" class="external" title="UTAS home page" href="http://www.utas.edu.au/">University of Tasmania</a> as Lead Agent.
                        </p>

                        <p><a title="Email us for help in using this site" class="external" href="mailto:${portalConf.contactEmail}?subject=Portal enquiry - ">Contact</a> <b>|</b>
                            <a title="Data usage acknowledgement" target="_blank" class="external" href="${grailsApplication.config.help.url}user-guide-introduction/aodn-portal/data-use-acknowledgement">Acknowledgement</a> <b>|</b>
                            <a title="Disclaimer information" target="_blank" class="external" href="${grailsApplication.config.help.url}user-guide-introduction/aodn-portal/disclaimer">Disclaimer</a> <b>|</b>
                            <a title="Australian Ocean Data Network" target="_blank" class="external" href="http://imos.org.au/aodn.html">AODN</a> <b>|</b>
                            <a title="Integrated Marine Observing System" target="_blank" class="external" href="http://www.imos.org.au/">IMOS</a> <b>|</b>
                            <a title="AODN Portal User Guide" target="_blank" class="external" href="${grailsApplication.config.help.url}contributing-data">Contributing</a></p>

                        <div class="buildInfo"><buildInfo:summary /></div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 ">
                <div class="panel-body">
                    <a href="http://oceancurrent.imos.org.au/" class="btn btn-secondary btn-lg">IMOS OceanCurrent</a>
                    <p></p>
                    <p><strong>The latest ocean information around Australia</strong></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel-body socialLinks">
                    <a href="http://www.utas.edu.au/" title="UTAS home page" target="_blank">
                        <img src="https://static.emii.org.au/images/logo/utas/UTAS_2017_200.png" alt="UTAS logo" width="130"/>
                    </a>
                    <img src="https://static.emii.org.au/images/logo/NCRIS_2017_110.png" alt="NCRIS logo" width="130"/>

                    <div>
                        <a class="noUnderline" href="https://twitter.com/IMOS_AUS" target="_blank">
                            <img src="${resource(
                                dir: 'images', file: 'Twitter_logo_black.png'
                            )}" title="Follow us on twitter" alt="Follow us on twitter" />
                        </a>
                        <a class="noUnderline" href="https://www.facebook.com/IntegratedMarineObservingSystem" target="_blank">
                            <img src="${resource(
                                dir: 'images', file: 'FB-logo-gray.png'
                            )}" title="Find us on Facebook" alt="Find us on Facebook" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<g:render template="/google_analytics"></g:render>
<g:render template="/hotjar"></g:render>
<g:render template="/motd"></g:render>
</body>
</html>
