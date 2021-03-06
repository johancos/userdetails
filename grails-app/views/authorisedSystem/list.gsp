<%@ page import="au.org.ala.userdetails.AuthorisedSystem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}">
		<g:set var="entityName" value="${message(code: 'authorisedSystem.label', default: 'AuthorisedSystem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <g:render template="/layouts/header" />

		<a href="#list-authorisedSystem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a href="${createLink(controller:'admin', action:'index')}"><i class="icon-wrench"></i>&nbsp;<g:message code="authorisedSystem.administration" /></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-authorisedSystem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="row-fluid">
                <div class="span8">
                    <div class="form-horizontal pull-right" style="margin-bottom: 10px">
                        <g:textField name="q" value="${params.q}" /> <button type="button" class="btn" id="btnSearch"><g:message code="authorisedSystem.search" />Search</button>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span8">
                    <table class="table table-bordered table-striped table-condensed">
                    <thead>
                        <tr>
                            <g:sortableColumn property="host" title="${message(code: 'authorisedSystem.host.label', default: 'Host')}" />
                            <th><g:message code="authorisedSystem.hostname" /></th>
                            <th><g:message code="authorisedSystem.description" /></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${authorisedSystemInstanceList}" status="i" var="authorisedSystemInstance">
                        <tr>
                            <td><g:link action="show" id="${authorisedSystemInstance.id}">${fieldValue(bean: authorisedSystemInstance, field: "host")}</g:link></td>
                            <td><div class="hostname" host="${authorisedSystemInstance.host}"><img src="${resource(dir:'images', file:'spinner.gif')}"/></div></td>
                            <td>${authorisedSystemInstance.description}</td>
                            <td>
                                <a href="${createLink(action:'edit', id:authorisedSystemInstance.id)}" class="btn btn-small"><i class="icon-edit"></i></a>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                    <div class="pagination">
                        <g:paginate total="${authorisedSystemInstanceTotal}" params="${params}" />
                    </div>
                </div>
                <div class="span4 well">
                    <g:message code="authorisedSystem.this_is_a_list_of_ip_addresses" />
                </div>
            </div>
		</div>
	</body>
    <r:script>

    function doSearch() {
        var query = $("#q").val();
        window.location = "${createLink(action:'list')}?q=" + query
    }

    $(document).ready(function() {

        $("#q").keydown(function(e) {
            if (e.which == 13) {
                e.preventDefault();
                doSearch();
            }
        }).focus();

        $("#btnSearch").click(function(e) {
            e.preventDefault();
            doSearch();
        });

        $(".hostname").each(function() {
            var host = $(this).attr("host");
            var target = $(this); // create a copy of current scope
            if (host) {
                $.ajax("${createLink(action:'ajaxResolveHostName')}?host=" + host).done(function(results) {
                    var iconClass= results.reachable ? "icon-ok" : "icon-warning-sign";
                    var tooltip = results.reachable ? "Host is reachable" : "Host is not currently reachable";
                    target.html(results.hostname + "&nbsp;<i title='" + tooltip + "' class='" +  iconClass + "'></i>");
                });
            }
        });

    });

    </r:script>
</html>
