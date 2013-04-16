<html>
<head>
  <title>Welcome to Grails</title>
  <meta name="layout" content="main"/>
</head>

<body>

<div class="jumbotron">
  <h1>Grails Filterpane!</h1>

  <p class="lead">This is a test application to demo and document the Grails Filtepane plugin.</p>
  <p>
    <a href="${createLink(controller: 'book', action: 'list')}" class="btn btn-large btn-success">View Book Example</a>&nbsp;&nbsp;
    <a href="${createLink(controller: 'robot', action: 'list')}" class="btn btn-large btn-success">View Nested Example</a>&nbsp;&nbsp;
    <a href="http://grails-plugin-consortium.github.io/grails-filterpane/docs/index.html" target="_new" class="btn btn-large btn-primary">View Documentation</a>
  </p>

</div>

</body>
</html>
