

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Book</title>
    </head>
    <body>
        <ul class="nav nav-pills">
            <li><g:link class="list" action="list">Book List</g:link></li>
            <li><g:link class="create" action="create">New Book</g:link></li>
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
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${book.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${book.title}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Author:</td>
                            
                            <td valign="top" class="value"><g:link controller="author" action="show" id="${book?.author?.id}">${book?.author}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Release Date:</td>
                            
                            <td valign="top" class="value">${book.releaseDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Price:</td>
                            
                            <td valign="top" class="value">${book.price}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">In Stock:</td>
                            
                            <td valign="top" class="value">${book.inStock}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${book.lastUpdated}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${book?.id}" />
                    <span class="button"><g:actionSubmit class="edit btn btn-info" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete btn btn-danger" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
