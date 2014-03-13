<%@ page import="org.grails.example.Magazine" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Magazine List</title>
  <r:require module="filterpane" />
</head>

<body>
<ul class="nav nav-pills">
  <li class="active"><g:link class="list" action="list">Magazine List</g:link></li>
  <li><g:link class="create" action="create">New Magazine</g:link></li>
</ul>

<div class="body">
  <h1>Magazine List</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <filterpane:currentCriteria domainBean="Magazine" dateFormat="${[title: 'MM/dd/yyyy', releaseDate: 'MMM dd, yyyy']}"
                              removeImgDir="images" removeImgFile="bullet_delete.png" fullAssociationPathFieldNames="no"
                              filterPropertyValues="${[bookType: [displayProperty: 'display']]}"/>
  <div class="list">
    <table class="table table-bordered">
      <thead>
      <tr>

        <g:sortableColumn property="id" title="Id" params="${filterParams}"/>
        <g:sortableColumn property="title" title="Title" params="${filterParams}"/>
        <g:sortableColumn property="authors" title="Authors" params="${filterParams}"/>
        <g:sortableColumn property="bookType" title="Magazine Type" params="${filterParams}"/>
        <g:sortableColumn property="readPriority" title="Read Priority" params="${filterParams}"/>
        <g:sortableColumn property="releaseDate" title="Release Date" params="${filterParams}"/>
        <g:sortableColumn property="price" title="Price" params="${filterParams}"/>
        <g:sortableColumn property="pricePlusTax" title="Price Plus Tax" params="${filterParams}"/>
        <g:sortableColumn property="inStock" title="In Stock" params="${filterParams}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${magazineList}" status="i" var="magazine">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${magazine.id}">${magazine.id?.encodeAsHTML()}</g:link></td>
          <td>${magazine.title?.encodeAsHTML()}</td>
          <td><g:each in="${magazine.authors}" var="author"><span class="label label-info">${author.toString()}</span>&nbsp;</g:each></td>
          <td>${magazine.bookType.encodeAsHTML()}</td>
          <td>${magazine.readPriority?.encodeAsHTML()}</td>
          <td><g:formatDate date="${magazine.releaseDate}" format="MM/dd/yyyy"/></td>
          <td>${magazine.price?.encodeAsHTML()}</td>
          <td>${magazine.pricePlusTax?.encodeAsHTML()}</td>
          <td>${magazine.inStock?.encodeAsHTML()}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <filterpane:paginate total="${magazineCount}" domainBean="org.grails.example.Magazine"/>
    <filterpane:filterButton text="Filter Me" appliedText="Change Filter"/>
    <filterpane:isNotFiltered>Pure and Unfiltered!</filterpane:isNotFiltered>
    <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
  </div>
  <filterpane:filterPane domain="org.grails.example.Magazine"
                         additionalProperties="identifier"
                         associatedProperties="authors.lastName,authors.firstName,authors.age,authors.favoriteGenre,authors.publisher.lastName,bookmarks.page,authors.id"
                         excludeProperties="cost"
                         filterPropertyValues="${[releaseDate: [years: 2015..1950, precision: 'month'], bookType: [displayProperty: 'display'], 'authors.favoriteGenre': [displayProperty: 'display']]}"
                         titleKey="fp.tag.filterPane.titleText"
                         dialog="true"
                         visible="n"
                         showSortPanel="n"
                         showTitle="n"
                         fullAssociationPathFieldNames="false"/>
</div>
</body>
</html>
