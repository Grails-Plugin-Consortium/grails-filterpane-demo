<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Show Magazine</title>
</head>

<body>
<ul class="nav nav-pills">
  <li><g:link class="list" action="list">Magazine List</g:link></li>
  <li><g:link class="create" action="create">New Magazine</g:link></li>
</ul>

<div class="body">
  <h1>Show Magazine</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table class="table table-bordered">
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">Id:</td>

        <td valign="top" class="value">${magazine.id}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Title:</td>

        <td valign="top" class="value">${magazine.title}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Authors:</td>

        <td valign="top" class="value">
          <g:each in="${magazine.authors}" var="author">
            <g:link controller="author" action="show" id="${author?.id}">${author}</g:link>
          </g:each>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Release Date:</td>

        <td valign="top" class="value">${magazine.releaseDate}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Price:</td>

        <td valign="top" class="value">${magazine.price}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">In Stock:</td>

        <td valign="top" class="value">${magazine.inStock}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Last Updated:</td>

        <td valign="top" class="value">${magazine.lastUpdated}</td>

      </tr>

      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${magazine?.id}"/>
      <span class="button"><g:actionSubmit class="edit btn btn-info" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete btn btn-danger" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
