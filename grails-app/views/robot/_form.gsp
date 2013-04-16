<%@ page import="org.grails.example.nested.Robot" %>



<div class="fieldcontain ${hasErrors(bean: robotInstance, field: 'parts', 'error')} ">
  <label for="parts">
    <g:message code="robot.parts.label" default="Parts"/>

  </label>
  <g:select name="parts" from="${org.grails.example.nested.Part.list()}" multiple="multiple" optionKey="id" size="5" value="${robotInstance?.parts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: robotInstance, field: 'name', 'error')} ">
  <label for="name">
    <g:message code="robot.name.label" default="Name"/>

  </label>
  <g:textField name="name" value="${robotInstance?.name}"/>
</div>

