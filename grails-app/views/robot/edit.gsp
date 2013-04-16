<%@ page import="org.grails.example.nested.Robot" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'robot.label', default: 'Robot')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<ul class="nav nav-pills">
  <li><g:link class="list" action="list">Robot List</g:link></li>
  <li><g:link class="create" action="create">New Robot</g:link></li>
</ul>

<div id="edit-robot" class="content scaffold-edit" role="main">
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${robotInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${robotInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${robotInstance?.id}"/>
    <g:hiddenField name="version" value="${robotInstance?.version}"/>
    <fieldset class="form">
      <g:render template="form"/>
    </fieldset>
    <fieldset class="buttons">
      <g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
      <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </fieldset>
  </g:form>
</div>
</body>
</html>
