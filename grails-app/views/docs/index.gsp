<%@ page import="org.grails.example.Book" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="layout" content="main"/>
  <title>FilterPane Plugin Documentation</title>
  <link type="text/css" rel="stylesheet" href="${resource(dir: 'css/grails', file: 'jquery-ui-1.8.10.custom.css')}"/>
  <g:javascript src="syntaxhighlighter/shCore.js"/>
  <g:javascript src="syntaxhighlighter/shBrushGroovy.js"/>
  <g:javascript src="syntaxhighlighter/shBrushXml.js"/>
  <link type="text/css" rel="stylesheet" href="${resource(dir: 'css/syntaxhighlighter', file: "shCore.css")}"/>
  <link type="text/css" rel="stylesheet" href="${resource(dir: 'css/syntaxhighlighter', file: "shThemeDefault.css")}"/>
  <r:script>
    $(document).ready(function () {
      $('#tagAccordion').accordion({autoHeight:false, collapsible:true, active:false});
      $('#tabs').tabs({});
      SyntaxHighlighter.config.clipboardSwf = '${resource(dir: 'js/syntaxhighlighter', file: 'clipboard.swf')}';
      SyntaxHighlighter.all();
    });
  </r:script>
</head>

<body>

<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a data-toggle="tab" href="#tabs-usage">Usage</a></li>
  <li><a data-toggle="tab" href="#tabs-tags">Tags</a></li>
  <li><a data-toggle="tab" href="#tabs-intl">Internationalization (i18n)</a></li>
  <li><a data-toggle="tab" href="#tabs-datatypes">Data Types & Operators</a></li>
  <li><a data-toggle="tab" href="#tabs-styleoveeride">Style Overrides</a></li>
</ul>

<div id="myTabContent" class="tab-content">

<div id="tabs-usage" class="tab-pane fade active in">
  <p>The FilterPane plugin is typically used in an application's list pages. To use the filters, make the following changes to your list.gsp pages. For a full list of tags and attributes, see the Reference section later in this document.</p>
  <br/>
  There are two main steps to using the plugin:
  <ol>
    <li>Modifying a list view</li>
    <li>Modifying the controller</li>
  </ol>

  <h2>Modifying the list view</h2>

  <p>1.  Add the includes to your page.</p>
  <pre class="brush: xml">
    &lt;filterpane:includes />
  </pre>

  <p>2.  Somewhere in your page (typically near the bottom of the body
  tag), add the filter pane. This has the result of rendering a
  container div in your page.</p>
  <pre class="brush: xml">
    &lt;filterpane:filterPane domainBean="MyDomainClass" />
  </pre>

  <p>3. Add a button to invoke the filter pane somewhere on your list page.
  (Inside the pagination div works well on applications built from
  scaffolding.) A custom tag is provided to help create this button.
  The title attribute is optional. If omitted, the value of the button
  will be "Filter".</p>
  <pre class="brush: xml">
    &lt;filterpane:filterButton text="Whatever You Wish" />
  </pre>

  <div class="message">
    If your application uses scriptaculous and you use the filterButton
    tag, the filter pane will fade in and out. Otherwise the filter pane
    simply appears and disappears.
  </div>

  <h3>Pagination</h3>

  <p>If you want to support pagination use something similar to the following:</p>
  <pre class="brush: xml">
    &lt;g:paginate total="${bookCount == null ? Book.count() : bookCount}" params="${filterParams}" />
  </pre>

  <p>Alternatively, this work is now encapsulated in the plugin's paginate
  tag as of version 0.6 of the plugin:</p>
  <pre class="brush: xml">
    &lt;filterpane:paginate total="$&#123;bookCount}" domainBean="Book" />
  </pre>

  <p>In the example above, bookCount is any variable you pass into the
  controller's render model that contains the total number of records
  returned in your filtered data. Its value can be obtained from the
  filter service's count method. <em>(See the controller section later in
  this document for more info.)</em></p>

  <div class="alert">Note that you should not use Groovy's Elvis operator to
  test for bookCount's existence, as an empty set (count of 0) will
  return false, thus causing Book.count() to be used. See
    <a href="http://groovy.codehaus.org/Groovy+Truth" target="_new">Groovy Truth</a>
    for more info.
  </div>

  <p>Also in the example above, filterParams is set in the model map of
  the render call in the controller. The value is a sub-map of the
  request params, and can be obtained by calling the
  "extractFilterParams" method on the included FilterUtils class.
  See the example below from the books example app.
  </p>

  <pre class="brush: groovy">
    render( view:'list',
    model:[ bookList: filterService.filter( params, Book ),
    bookCount: filterService.count( params, Book ),
    filterParams: com.zeddware.grails.plugins.filterpane.FilterUtils.extractFilterParams(params),
    params:params
    ]
    )
  </pre>

  <h3>List Sorting</h3>

  <p>If you want to support Grails's list sorting, you must add a the filter
  parameters to each Grails sortableColumn tag, as shown in the example
  below. It is not recommended to put the entire "params" map in here.
  Instead, it is recommended that you only include the FilterPane
  parameters, which is the same sub-map as is described in the Pagination
  section above.</p>

  <pre class="brush: xml">
    &lt;g:sortableColumn property="id" title="Id" params="$&#123;filterParams}" />
  </pre>

  <h2>Modifying the controller</h2>

  <p>1.  Inject the service into your controller</p>
  <pre class="brush: groovy">def filterService</pre>

  <p>2.  Create an action in your controller to filter.</p>
  <pre class="brush: groovy">
    def filter = {
    if(!params.max) params.max = 10
    render( view:'list',
    model:[ domainClassList: filterService.filter( params, DomainClass ),
    domainClassCount: filterService.count( params, DomainClass ),
    filterParams: com.zeddware.grails.plugins.filterpane.FilterUtils.extractFilterParams(params),
    params:params ] )
    }
  </pre>

  <p>Where…</p>
  <ul>
    <li><b>domainClassList</b> is the name of the return list model the list action uses</li>
    <li><b>DomainClass</b> is the name of the domain class you are filtering</li>
    <li><b>domainClassCount</b> is the name of a variable that contains the
    total number of filtered results. This parameter is optional, but is
    useful if you want to use Grails pagination (which most of the time
    you will).</li>
    <li><b>filterParams</b> is a sub-map of the request parameters obtained
    via the FilterUtils.extractFilterParams method.</li>
  </ul>

  <div class="message">Note that whatever you use for variable names in the model will have to
  match the corresponding attribute in the filterpane tag on your list
  page.  Also keep in mind that you don't have to name the controller
  action "filter".  This is just the default.</div>

</div>

<div id="tabs-tags" class="tab-pane fade">
  <div class="accordion" id="accordion2">
    <g:each var="tag" in="${tags}">
      <div class="accordion-group">
        <div class="accordion-heading">
          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#${tag.name}">
            ${tag.name}
          </a>
        </div>

        <div id="${tag.name}" class="accordion-body collapse">
          <div class="accordion-inner">
            <p>${tag.description}</p>
            <g:if test="${tag.attributes.size() > 0}">
              <h3>Attributes</h3>

              <div class="row-fluid">
                <table class="table table-bordered">
                  <thead>
                  <tr>
                    <th>Name</th>
                    <th>Required</th>
                    <th>Default Value</th>
                    <th>Description</th>
                  </tr>
                  </thead>
                  <tbody>
                  <g:each var="attr" in="${tag.attributes}" status="i">
                    <g:if test="${attr.desc.toString().contains('<pre')}">
                      <tr>
                        <td>${attr.name}</td>
                        <td>${attr.req ? 'Yes' : 'No'}</td>
                        <td>${attr.defVal}</td>
                        <td><a href="#modal${attr.name}" role="button" class="btn" data-toggle="modal">View Example</a></td>
                      </tr>

                      <div id="modal${attr.name}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                          <h3 id="myModalLabel">Example Usage</h3>
                        </div>
                        <div class="modal-body">
                          <p>${attr.desc}</p>
                        </div>
                        <div class="modal-footer">
                          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                      </div>


                    </g:if>
                    <g:else>
                      <tr>
                        <td>${attr.name}</td>
                        <td>${attr.req ? 'Yes' : 'No'}</td>
                        <td>${attr.defVal}</td>
                        <td width="50%">${attr.desc}</td>
                      </tr>
                    </g:else>
                  </g:each>
                  </tbody>
                </table>
              </div>
            </g:if>
          </div>
        </div>
      </div>
    </g:each>
  </div>
</div>

<div id="tabs-intl" class="tab-pane fade">
  The following keys are supported in message bundles for internationalizing the text in the plugin.
  <h3>Filter Operators</h3>
  <ul>
    <li>fp.op.ILike</li>
    <li>fp.op.NotILike</li>
    <li>fp.op.Like</li>
    <li>fp.op.NotLike</li>
    <li>fp.op.Equal</li>
    <li>fp.op.NotEqual</li>
    <li>fp.op.IsNull</li>
    <li>fp.op.IsNotNull</li>
    <li>fp.op.GreaterThan</li>
    <li>fp.op.GreaterThanEquals</li>
    <li>fp.op.LessThan</li>
    <li>fp.op.LessThanEquals</li>
    <li>fp.op.Between</li>
  </ul>

  <h3>Property Name Display</h3>

  <p>By default, each property's natural name is displayed . To override
  this, use keys of the form: fp.property.text.propertyName , where
  propertyname is the domain property name. For associated properties,
  use keys of the form: fp.property.text.associatedBean.propertyName .</p>

  <h3>Filter Button Tag</h3>

  <p>If no textKey or appliedTextKey attributes are given, the default keys are checked.</p>
  <ul>
    <li>fp.tag.filterButton.text</li>
    <li>fp.tag.filterButton.appliedText</li>
  </ul>

  <h3>Filter Pane Tag</h3>

  <p>The filterPane tag's keys are listed below, along with their default values for clarity.</p>
  <ul>
    <li>fp.tag.filterPane.titleText = Filter</li>
    <li>fp.tag.filterPane.property.boolean.true = Yes</li>
    <li>fp.tag.filterPane.property.boolean.false = No</li>
    <li>fp.tag.filterPane.property.betweenValueSeparatorText = and</li>
    <li>fp.tag.filterPane.sort.orderByText = Order by</li>
    <li>fp.tag.filterPane.sort.noSelection.text = Select a Property</li>
    <li>fp.tag.filterPane.sort.ascending = Ascending</li>
    <li>fp.tag.filterPane.sort.descending = Descending</li>
    <li>fp.tag.filterPane.button.cancel.text = Cancel</li>
    <li>fp.tag.filterPane.button.clear.text = Clear</li>
    <li>fp.tag.filterPane.button.apply.text = Apply</li>
  </ul>

  <div class="message">
    The full default message bundle can be found in the installed plugin's
    folder in the messages-filterpane.properties file.
  </div>

  <p>The plugin supports the
    <a href="http://www.grails.org/plugin/i18n-templates" target="_new">i18n Templates plugin</a>'s
  domain property format:</p>
  <pre class="brush: xml">
    &lt;domainClass>.&lt;property> &lArr; for each property
  </pre>

</div>

<div id="tabs-datatypes" class="tab-pane fade">
  <g:each var="dataType" in="${dataTypes}">
    <a class="dataType">${dataType.title}</a><br/>
    <g:if test="${dataType.subtitle.length() > 0}">
      <p>(${dataType.subtitle})</p>
    </g:if>
    <table class="docs dataTypes">
      <tr>
        <th class="dt-op">Operator</th>
        <th class="dt-txt">Default Display Text</th>
        <th class="dt-key">Internationalization Key</th>
      </tr>
      <g:each var="op" in="${dataType.operators}">
        <tr>
          <td class="dt-op">${op.op}</td>
          <td class="dt-txt">${op.text}</td>
          <td class="dt-key">${op.intl}</td>
        </tr>
      </g:each>
    </table>
  </g:each>
  <h3>Domain Constraint Modifications</h3>

  <div>If a property is not nullable (constraint nullable="false"), then the Is
  Null and Is Not Null operators will not be available for that property.</div>
</div>

<div id="tabs-styleoveeride" class="tab-pane fade">
  The views for filterpane are installed locally during plugin install into /grails-app/views/filterpane  <span class="label label-important">Modify at your own risk</span> as there are required variables
and other content required in the templates.  You can always grab the master from the plugin if you want to reset or mess up the data.
</div>

</div>


</body>
</html>
