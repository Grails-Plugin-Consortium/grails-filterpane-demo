<%@ page import="org.grails.example.Calendar" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'calendar.label', default: 'Calendar')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:javascript src="fp.js" />
</head>

<body>

<ul class="nav nav-pills">
  <li class="active"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
</ul>

<div id="list-calendar" class="content scaffold-list" role="main">
  <h1>Calendar List</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <filterpane:currentCriteria domainBean="Calendar" dateFormat="${[localDate: 'MM/dd/yyyy', date: 'MM/dd/yyyy']}"
                              removeImgDir="images" removeImgFile="bullet_delete.png" fullAssociationPathFieldNames="no"/>
  <div class="list">
  <table class="table table-striped table-bordered">
    <thead>
    <tr>

      <g:sortableColumn property="dateTime" title="${message(code: 'calendar.dateTime.label', default: 'Date Time')}" params="${filterParams}"/>

      <g:sortableColumn property="localDate" title="${message(code: 'calendar.localDate.label', default: 'Local Date')}" params="${filterParams}"/>

      <g:sortableColumn property="date" title="${message(code: 'calendar.date.label', default: 'Date')}" params="${filterParams}"/>

      <g:sortableColumn property="name" title="${message(code: 'calendar.name.label', default: 'Name')}" params="${filterParams}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${calendarInstanceList}" status="i" var="calendarInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show" id="${calendarInstance.id}">${fieldValue(bean: calendarInstance, field: "dateTime")}</g:link></td>

        <td>${fieldValue(bean: calendarInstance, field: "localDate")}</td>

        <td><g:formatDate date="${calendarInstance.date}"/></td>

        <td>${fieldValue(bean: calendarInstance, field: "name")}</td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>

<div class="paginateButtons">
  <filterpane:paginate total="${calendarInstanceTotal}" domainBean="org.grails.example.Calendar"/>
  <filterpane:filterButton text="Filter Me" appliedText="Change Filter"/>
  <filterpane:isNotFiltered>Pure and Unfiltered!</filterpane:isNotFiltered>
  <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
</div>
<filterpane:filterPane domain="org.grails.example.Calendar"
                       additionalProperties="identifier"
                       associatedProperties=""
                       excludeProperties="dateTime"
                       titleKey="fp.tag.filterPane.titleText"
                       dialog="true"
                       visible="n"
                       showSortPanel="n"
                       showTitle="n"
                       fullAssociationPathFieldNames="false"/>
</body>
</html>
