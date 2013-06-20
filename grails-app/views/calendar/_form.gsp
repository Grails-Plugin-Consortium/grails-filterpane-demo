<%@ page import="org.grails.example.Calendar" %>



<div class="fieldcontain ${hasErrors(bean: calendarInstance, field: 'dateTime', 'error')} ">
	<label for="dateTime">
		<g:message code="calendar.dateTime.label" default="Date Time" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: calendarInstance, field: 'date', 'error')} ">
	<label for="date">
		<g:message code="calendar.date.label" default="Date" />
		
	</label>
	<g:datePicker name="date" precision="day"  value="${calendarInstance?.date}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: calendarInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="calendar.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${calendarInstance?.name}"/>
</div>

