<%@ page import="org.grails.example.nested.Robot" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'robot.label', default: 'Robot')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<ul class="nav nav-pills">
  <li><g:link class="list" action="list">Robot List</g:link></li>
  <li><g:link class="create" action="create">New Robot</g:link></li>
</ul>

<div id="create-robot" class="content scaffold-create" role="main">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
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
  <g:form action="save">
    <fieldset class="form">
      <g:render template="form"/>
    </fieldset>
    <fieldset class="buttons">
      <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
  </g:form>
</div>
</body>
</html>
