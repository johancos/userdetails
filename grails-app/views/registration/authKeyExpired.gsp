<!doctype html>
<html>
<head>
    <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
    <meta name="section" content="home"/>
    <title><g:message code="registration.authKeyExpired.title" /></title>
</head>
<body>
<div class="row-fluid">
    <h1><g:message code="registration.authKeyExpired.title" /></h1>
    <div class="row-fluid">
        <p>
            <g:message code="registration.authKeyExpired.description" args="${[grailsApplication.config.supportEmail]}" />
        </p>
   </div>
</div>
</body>
</html>
