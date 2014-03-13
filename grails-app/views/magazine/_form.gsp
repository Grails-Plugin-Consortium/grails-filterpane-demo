<%@ page import="org.grails.example.Magazine" %>



<div class="fieldcontain ${hasErrors(bean: magazine, field: 'title', 'error')} ">
  <label for="title">
    <g:message code="magazine.title.label" default="Title"/>

  </label>
  <g:textField name="title" value="${magazine?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'coAuthor', 'error')} ">
  <label for="coAuthor">
    <g:message code="magazine.coAuthor.label" default="Co Author"/>

  </label>
  <g:select id="coAuthor" name="coAuthor.id" from="${org.grails.example.Author.list()}" optionKey="id" value="${magazine?.coAuthor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'bookType', 'error')} ">
  <label for="bookType">
    <g:message code="magazine.bookType.label" default="Magazine Type"/>

  </label>
  <g:select name="bookType" from="${org.grails.example.BookType?.values()}" keys="${org.grails.example.BookType.values()*.name()}" value="${magazine?.bookType?.name()}" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'releaseDate', 'error')} ">
  <label for="releaseDate">
    <g:message code="magazine.releaseDate.label" default="Release Date"/>

  </label>
  <g:datePicker name="releaseDate" precision="day" value="${magazine?.releaseDate}" default="none" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'price', 'error')} ">
  <label for="price">
    <g:message code="magazine.price.label" default="Price"/>

  </label>
  <g:field name="price" value="${fieldValue(bean: magazine, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'pricePlusTax', 'error')} ">
  <label for="pricePlusTax">
    <g:message code="magazine.pricePlusTax.label" default="Price Plus Tax"/>

  </label>
  <g:field type="text" name="pricePlusTax" value="${fieldValue(bean: magazine, field: 'pricePlusTax')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'currency', 'error')} ">
  <label for="currency">
    <g:message code="magazine.currency.label" default="Currency"/>

  </label>
  %{--<g:currencySelect name="currency" value="${magazine?.currency}" noSelection="['': '']"/>--}%
  Currency Edit is disabled due to issue (needs fix)<br>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'inStock', 'error')} ">
  <label for="inStock">
    <g:message code="magazine.inStock.label" default="In Stock"/>

  </label>
  <g:checkBox name="inStock" value="${magazine?.inStock}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'readPriority', 'error')} ">
  <label for="readPriority">
    <g:message code="magazine.readPriority.label" default="Read Priority"/>

  </label>
  <g:select name="readPriority" from="${magazine.constraints.readPriority.inList}" value="${magazine?.readPriority}" valueMessagePrefix="magazine.readPriority" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'cost', 'error')} required">
  <label for="cost">
    <g:message code="magazine.cost.label" default="Cost"/>
    <span class="required-indicator">*</span>
  </label>
  <g:field name="cost" value="${fieldValue(bean: magazine, field: 'cost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'authors', 'error')} ">
  <label for="authors">
    <g:message code="magazine.authors.label" default="Authors"/>

  </label>
  <g:select name="authors" from="${org.grails.example.Author.list()}" multiple="multiple" optionKey="id" size="5" value="${magazine?.authors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: magazine, field: 'bookmarks', 'error')} ">
  <label for="bookmarks">
    <g:message code="magazine.bookmarks.label" default="Bookmarks"/>

  </label>

  <ul class="one-to-many">
    <g:each in="${magazine?.bookmarks ?}" var="b">
      <li><g:link controller="bookmark" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
      <g:link controller="bookmark" action="create" params="['magazine.id': magazine?.id]">${message(code: 'default.add.label', args: [message(code: 'bookmark.label', default: 'Bookmark')])}</g:link>
    </li>
  </ul>

</div>

