<%@ page import="org.grails.example.Book" %>



<div class="fieldcontain ${hasErrors(bean: book, field: 'title', 'error')} ">
  <label for="title">
    <g:message code="book.title.label" default="Title"/>

  </label>
  <g:textField name="title" value="${book?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'coAuthor', 'error')} ">
  <label for="coAuthor">
    <g:message code="book.coAuthor.label" default="Co Author"/>

  </label>
  <g:select id="coAuthor" name="coAuthor.id" from="${org.grails.example.Author.list()}" optionKey="id" value="${book?.coAuthor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'bookType', 'error')} ">
  <label for="bookType">
    <g:message code="book.bookType.label" default="Book Type"/>

  </label>
  <g:select name="bookType" from="${org.grails.example.BookType?.values()}" keys="${org.grails.example.BookType.values()*.name()}" value="${book?.bookType?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'releaseDate', 'error')} ">
  <label for="releaseDate">
    <g:message code="book.releaseDate.label" default="Release Date"/>

  </label>
  <g:datePicker name="releaseDate" precision="day" value="${book?.releaseDate}" default="none" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'price', 'error')} ">
  <label for="price">
    <g:message code="book.price.label" default="Price"/>

  </label>
  <g:field name="price" value="${fieldValue(bean: book, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'pricePlusTax', 'error')} ">
  <label for="pricePlusTax">
    <g:message code="book.pricePlusTax.label" default="Price Plus Tax"/>

  </label>
  <g:field name="pricePlusTax" value="${fieldValue(bean: book, field: 'pricePlusTax')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'currency', 'error')} ">
  <label for="currency">
    <g:message code="book.currency.label" default="Currency"/>

  </label>
  %{--<g:currencySelect name="currency" value="${book?.currency}" noSelection="['': '']"/>--}%
    Currency Edit is disabled due to issue (needs fix)<br>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'inStock', 'error')} ">
  <label for="inStock">
    <g:message code="book.inStock.label" default="In Stock"/>

  </label>
  <g:checkBox name="inStock" value="${book?.inStock}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'readPriority', 'error')} ">
  <label for="readPriority">
    <g:message code="book.readPriority.label" default="Read Priority"/>

  </label>
  <g:select name="readPriority" from="${book.constraints.readPriority.inList}" value="${book?.readPriority}" valueMessagePrefix="book.readPriority" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'cost', 'error')} required">
  <label for="cost">
    <g:message code="book.cost.label" default="Cost"/>
    <span class="required-indicator">*</span>
  </label>
  <g:field name="cost" value="${fieldValue(bean: book, field: 'cost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'authors', 'error')} ">
  <label for="authors">
    <g:message code="book.authors.label" default="Authors"/>

  </label>
  <g:select name="authors" from="${org.grails.example.Author.list()}" multiple="multiple" optionKey="id" size="5" value="${book?.authors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: book, field: 'bookmarks', 'error')} ">
  <label for="bookmarks">
    <g:message code="book.bookmarks.label" default="Bookmarks"/>

  </label>

  <ul class="one-to-many">
    <g:each in="${book?.bookmarks ?}" var="b">
      <li><g:link controller="bookmark" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
      <g:link controller="bookmark" action="create" params="['book.id': book?.id]">${message(code: 'default.add.label', args: [message(code: 'bookmark.label', default: 'Bookmark')])}</g:link>
    </li>
  </ul>

</div>

