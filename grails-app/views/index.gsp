<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Gestión alquiler</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<content tag="nav">
   <!-- <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
            <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
            <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
            </li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
            </li>
            <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
            <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
            <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
            <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
            <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
        </ul>
    </li>
     <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
                </g:each>
        </ul>
    </li>
-->
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            Inquilinos <span class="caret"></span></a>
        <ul class="dropdown-menu">        
            <li><a class="list" href="${createLink(uri: '/inquilino')}">
                    <g:message code="default.list"/></a></li>
            <li><a class="create" href="${createLink(uri: '/inquilino/create')}">
                    <g:message code="default.create"/></a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            Propiedades <span class="caret"></span></a>
        <ul class="dropdown-menu">        
            <li><a class="list" href="${createLink(uri: '/propiedad')}">
                    <g:message code="default.list"/></a></li>
            <li><a class="create" href="${createLink(uri: '/propiedad/create')}">
                    <g:message code="default.create"/></a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            Alquiler <span class="caret"></span></a>
        <ul class="dropdown-menu">        
            <li><a class="list" href="${createLink(uri: '/alquiler')}">
                    <g:message code="default.list"/></a></li>
            <li><a class="create" href="${createLink(uri: '/alquiler/create')}">
                    <g:message code="default.create"/></a></li>
        </ul>
    </li>
</content>



<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Welcome to MTV</h1>

        <p>
          
        </p>

        <div id="controllers" role="navigation">
            <h2>Controllers disponibles:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                        </li>
                </g:each>
            </ul>
        </div>
    </section>
</div>

</body>
</html>
