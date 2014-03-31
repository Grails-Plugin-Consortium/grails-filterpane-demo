<!DOCTYPE html>
<html lang="en">
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title><g:layoutTitle default="Grails"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
  <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
  <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
  <r:require modules="jquery, jquery-ui, application, bootstrap, bootstrap-responsive-css, application"/>
  <g:layoutHead/>
  <r:layoutResources/>
</head>

<body>
<div class="container">
  <div class="masthead">
    <h3 class="muted">Grails Filterpane</h3>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="container">
          <ul class="nav">
            <li><a href="${createLink(uri:'/')}">Home</a></li>
            <li><a href="${createLink(controller:'book', action:'list')}">Book Example</a></li>
            %{--<li><a href="${createLink(controller:'magazine', action:'list')}">Magazine Example</a></li>--}%
            <li><a href="${createLink(controller:'robot', action:'list')}">Nested Example</a></li>
            <li><a href="${createLink(controller:'calendar', action:'list')}">Joda Time Example</a></li>
          </ul>
        </div>
      </div>
    </div><!-- /.navbar -->
  </div>
  <g:layoutBody/>
</div>
<r:layoutResources/>
</body>
</html>
