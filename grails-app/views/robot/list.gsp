<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Robot List</title>
  <r:require module="filterpane" />
</head>

<body>
<ul class="nav nav-pills">
  <li class="active"><g:link class="list" action="list">Robot List</g:link></li>
  <li><g:link class="create" action="create">New Robot</g:link></li>
</ul>

<div class="body">
  <h1>Robot List</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <filterpane:currentCriteria domainBean="org.grails.example.nested.Robot" dateFormat="${[title: 'MM/dd/yyyy', releaseDate: 'MMM dd, yyyy']}"
                              removeImgDir="images" removeImgFile="bullet_delete.png" fullAssociationPathFieldNames="no"
                              filterPropertyValues="${[robotType: [displayProperty: 'display']]}"/>
  <div class="list">
    <table class="table table-bordered">
      <thead>
      <tr>
        <g:sortableColumn property="id" title="Id" params="${filterParams}"/>
        <g:sortableColumn property="name" title="Name" params="${filterParams}"/>
        <th>Parts & Functions</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${robotList}" status="i" var="robot">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${robot.id}">${robot.id?.encodeAsHTML()}</g:link></td>
          <td>${robot.name?.encodeAsHTML()}</td>
          <td>
            <g:each in="${robot.parts}" var="part">
              <p>
          <b>Part:</B>&nbsp;<span class="label label-warning"><i class="icon icon-wrench"></i>&nbsp;${part.name}</span><br/>
              <b>Functions</b>:&nbsp;<g:each in="${part.functions}" var="function">
              <span class="label label-info"><i class="icon-cog icon-white"></i>&nbsp;${function.name}</span>
            </g:each>
            </g:each>
          </p>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <filterpane:paginate total="${robotCount}" domainBean="org.grails.example.nested.Robot"/>
    <filterpane:filterButton text="Filter Me" appliedText="Change Filter"/>
    <filterpane:isNotFiltered>Pure and Unfiltered!</filterpane:isNotFiltered>
    <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
  </div>
  <filterpane:filterPane domain="org.grails.example.nested.Robot"
                         additionalProperties="identifier"
                         associatedProperties="parts.functions.name, parts.name"
                         titleKey="fp.tag.filterPane.titleText"
                         dialog="false"
                         visible="true"
                         showSortPanel="true"
                         showTitle="n"
                         listDistinct="true"
                         uniqueCountColumn="id"
                         fullAssociationPathFieldNames="false"/>
</div>
</body>
</html>
