<%@ page import="org.grails.example.Calendar" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'calendar.label', default: 'Calendar')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-calendar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<ul class="nav nav-pills">
  <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
</ul>


<div class="body">
  <h1>Show Book</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table class="table table-bordered">
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"> <span id="date-label" class="property-label"><g:message code="calendar.date.label" default="Date"/></span>

         </td>

        <td valign="top" class="value"> <span class="property-value" aria-labelledby="date-label"><g:formatDate date="${calendarInstance?.date}"/></span></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"> <span id="name-label" class="property-label"><g:message code="calendar.name.label" default="Name"/></span></td>

        <td valign="top" class="value"><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${calendarInstance}" field="name"/></span></td>

      </tr>
      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${calendarInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit btn btn-info" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete btn btn-danger" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
