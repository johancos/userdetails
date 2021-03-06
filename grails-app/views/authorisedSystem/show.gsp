
<%@ page import="au.org.ala.userdetails.AuthorisedSystem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}">
		<g:set var="entityName" value="${message(code: 'authorisedSystem.label', default: 'AuthorisedSystem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

    <g:render template="/layouts/header" />

		<a href="#show-authorisedSystem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-authorisedSystem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list authorisedSystem">
			
				<g:if test="${authorisedSystemInstance?.host}">
				<li class="fieldcontain">
					<span id="host-label" class="property-label"><g:message code="authorisedSystem.host.label" default="Host" /></span>
                    <span class="property-value" aria-labelledby="host-label"><g:fieldValue bean="${authorisedSystemInstance}" field="host"/></span>
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="authorisedSystem.description.label" default="Description" /></span>
					<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${authorisedSystemInstance}" field="description"/></span>
				</li>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${authorisedSystemInstance?.id}" />
					<g:link class="edit" action="edit" id="${authorisedSystemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
