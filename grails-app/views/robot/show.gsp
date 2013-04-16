

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Robot</title>
    </head>
    <body>
        <ul class="nav nav-pills">
            <li><g:link class="list" action="list">Robot List</g:link></li>
            <li><g:link class="create" action="create">New Robot</g:link></li>
        </ul>
        <div class="body">
            <h1>Show Robot</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${robotInstance.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${robotInstance.name}</td>
                            
                        </tr>

                    <tr class="prop">
                      <td valign="top" class="name">Parts:</td>

                      <td valign="top" class="value">
                        <g:each in="${robotInstance.parts}" var="part">
                          ${part.name}<br>
                        </g:each>

                      </td>

                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${robotInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit btn btn-info" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete btn btn-danger" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
