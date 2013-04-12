package org.grails.example

import grails.converters.*

class DocsController {

    def index = {
		[ dataTypes: getDataTypesMapping(), tags:getTagsMapping() ]
    }
	
	def datatypes = {
		def map = [ dataTypes : getDataTypesMapping() ]
		render map as JSON
	}
	
	def tags = {
		def map = [ tags : getTagsMapping() ]
		render map as JSON
	}

	private def getDataTypesMapping() {
		return [
			[title:'Text', subtitle:'String, char', operators: [
				[op:'ILike', text:'Contains', intl:'fp.op.ILike'],
				[op:'Not ILike', text:'Does Not Contain', intl:'fp.op.NotILike'],
				[op:'Like', text:'Contains (Case Sensitive)', intl:'fp.op.Like'],
				[op:'Not Like', text:'Does Not Contain (Case Sensitive)', intl:'fp.op.NotLike'],
				[op:'=', text:'Equal To', intl:'fp.op.Equal'],
				[op:'&lt;&gt;', text:'Not Equal To', intl:'fp.op.NotEqual'],
				[op:'Is Null', text:'Is Null', intl:'fp.op.IsNull'],
				[op:'Is Not Null', text:'Is Not Null', intl:'fp.op.IsNotNull']
				]],
			[title:'Numeric', subtitle:'Integer, Long, Short, Float, Double, BigDecimal, BigInteger', operators:[
				[op:'=', text:'Equal To', intl:'fp.op.Equal'],
				[op:'&lt;&gt;', text:'Not Equal To', intl:'fp.op.NotEqual'],
				[op:'&lt;', text:'Less Than', intl:'fp.op.LessThan'],
				[op:'&lt;=', text:'Less Than or Equal To', intl:'fp.op.LessThanEquals'],
				[op:'&gt;', text:'Greater Than', intl:'fp.op.GreaterThan'],
				[op:'&gt;=', text:'Greater Than or Equal To', intl:'fp.op.GreaterThanEquals'],
				[op:'Between', text:'Between', intl:'fp.op.Between'],
				[op:'Is Null', text:'Is Null', intl:'fp.op.IsNull'],
				[op:'Is Not Null', text:'Is Not Null', intl:'fp.op.IsNotNull']]],
			[title:'Date', subtitle:'Date, Timestamp', operators:[
				[op:'=', text:'Equal To', intl:'fp.op.Equal'],
				[op:'&lt;&gt;', text:'Not Equal To', intl:'fp.op.NotEqual'],
				[op:'&lt;', text:'Less Than', intl:'fp.op.LessThan'],
				[op:'&lt;=', text:'Less Than or Equal To', intl:'fp.op.LessThanEquals'],
				[op:'&gt;', text:'Greater Than', intl:'fp.op.GreaterThan'],
				[op:'&gt;=', text:'Greater Than or Equal To', intl:'fp.op.GreaterThanEquals'],
				[op:'Between', text:'Between', intl:'fp.op.Between'],
				[op:'Is Null', text:'Is Null', intl:'fp.op.IsNull'],
				[op:'Is Not Null', text:'Is Not Null', intl:'fp.op.IsNotNull']]],
			[title:'Boolean', subtitle:'', operators:[
				[op:'=', text:'Equal To', intl:'fp.op.Equal'],
				[op:'&lt;&gt;', text:'Not Equal To', intl:'fp.op.NotEqual'],
				[op:'Is Null', text:'Is Null', intl:'fp.op.IsNull'],
				[op:'Is Not Null', text:'Is Not Null', intl:'fp.op.IsNotNull']]],
			[title:'Enum (since 0.6)', subtitle:'', operators:[
				[op:'=', text:'Equal To', intl:'fp.op.Equal'],
				[op:'&lt;&gt;', text:'Not Equal To', intl:'fp.op.NotEqual']]]
		]
	}

	private def getTagsMapping() {
		return [
			[name:'currentCriteria',
			 description:'This tag renders an unordered list of the currently applied filter criteria, along with links to remove individual filter criteria.',
			 attributes:[
				 [name:'domainBean',req:true,defVal:'None',desc:'The domain bean being filtered. May be a String (e.g. "Book") or a class instance (e.g. $&#123;Book})'],
				 [name:'id', req:false,defVal:'filterPaneCurrentCriteria',desc:'The id of the unordered list'],
				 [name:'fullAssociationPathFieldNames',req:false,defVal:'true',desc:'Set to false to use a shortened version of associated property names (e.g. Publisher\'s Name).  When true, the full association path\'s name is rendered (e.g. Author\'s Publisher\'s Name).'],
				 [name:'title', req:false, defVal:'None', desc:'The title attribute for the unordered list.'],
				 [name:'class', req:false, defVal:'None', desc:'The CSS class(es) to apply to the list.'],
				 [name:'style', req:false, defVal:'None', desc:'The style attribute for the list.'],
				 [name:'dateFormat', req:false, defVal:'yyyy-MM-dd HH:mm:ss', desc:'The format to apply when displaying date criteria.'],
				 [name:'action', req:false, defVal:'filter', desc:"The controller action to submit to when removing criteria. Set this to the same as your filterPane tag's action attribute."],
				 [name:'removeImgDir', req:false, defVal:'None', desc:'The directory the remove image file is located in.'],
				 [name:'removeImgFile', req:false, defVal:'None', desc:'The image filename to be used for the remove link. Note that if either removeImgDir or removeImgFile are missing, the text "(X)" will be used for the remove link.'],
				 [name:'quoteValues', req:false, defVal:'True', desc:'(Since 2.0.1) If true, values will be quoted when displayed.'],
				 [name:'filterPropertyValues', req:false, defVal:'None', desc:"""(Since 2.0.1) Identical syntax to the filterpane tag's property of the same name. Use this to set a display property of enum properties. Ex: <pre class="brush: groovy">filterPropertyValues="\${[bookType:[displayProperty:'display']]}"</pre>"""]
			 ]
			],
			[name:'filterButton',
			 description:'This tag renders an HTML link that shows the filter pane when clicked. When one or more filters are applied, this button will have the filter-applied css class.',
			 attributes:[
				 [name:'id', req:false, defVal:'filterpane', desc:'The id of the filterpane this button should open.'],
				 [name:'filterPaneId', req:false, defVal:'filterPane', desc:'This should match the id of your filterPane tag so the button can make it visible.'],
				 [name:'text', req:false, defVal:'Filter', desc:'The text that is displayed on the button.'],
				 [name:'appliedText', req:false, defVal:'Change Filter', desc:'The text displayed on the button when one or more filters are applied.'],
				 [name:'textKey', req:false, defVal:'fp.tag.filterButton.text', desc:'The message bundle key that contains the text of this button. (i18n)'],
				 [name:'appliedTextKey', req:false, defVal:'fp.tag.filterButton.appliedText', desc:'The message bundle key that contains the applied text of this button. (i18n)'],
				 [name:'class', req:false, defVal:'None', desc:'The class attribute passes through to the rendered anchor tag.'],
				 [name:'style', req:false, defVal:'None', desc:'The style attribute passes through to the rendered anchor tag.']
			 ]
			],
			[name:'filterPane',
			 description:'This tag generates the filter pane itself.  The pane renders inside of a div tag, and displays the filter form.',
			 attributes:[
				 [name:'domain', req:true, defVal:'None', desc:'The name of the Grails domain class to be filtered. This can either be a string (e.g. "Book"), or an actual class instance (e.g. "${Book}")'],
				 [name:'title', req:false, defVal:'Filter', desc:'The title text that is displayed at the top of the filter pane.'],
				 [name:'titleKey', req:false, defVal:'None', desc:'A message bundle key for looking up title text. (i18n)'],
				 [name:'fullAssociationPathFieldNames',req:false,defVal:'true',desc:'Set to false to use a shortened version of associated property names (e.g. Publisher\'s Name).  When true, the full association path\'s name is rendered (e.g. Author\'s Publisher\'s Name).'],
				 [name:'id', req:false, defVal:'filterpane', desc:'The id of the container div that holds the filter pane.'],
				 [name:'dialog', req:false, defVal:'true', desc:'When false, the filter pane div is rendered inline like a regular div.  When true, it is absolutely positioned near the top of the page.'],
				 [name:'visible', req:false, defVal:'false', desc:'Determines whether the filter pane container is initially visible.'],
				 [name:'class', req:false, defVal:'None', desc:'The class attribute to add to the container div that holds the filter pane.'],
				 [name:'style', req:false, defVal:'None', desc:'The style attribute to add to the container div that holds the filter pane.'],
				 [name:'formName', req:false, defVal:'filterForm', desc:'The name of the filter form element. Useful if you will use custom javascript on the form.'],
				 [name:'explicitProperties', req:false, defVal:'None', desc:'If specified then no default properties are included, only those specified in the given list.'],
				 [name:'associatedProperties', req:false, defVal:'None', desc:'Use this if you wish to filter any properties of associated domain objects (e.g. author.lastName). The value may either be a comma-delimited string, or a List of strings.'],
				 [name:'additionalProperties', req:false, defVal:'None', desc:'By default, identifier, version, and lastUpdated properties are not available to filter by. Use this attribute to allow them to be filtered. The value may either be a comma-delimited string, or a List of strings. Valid values are "id", "identifier", "version", and "lastUpdated"'],
				 [name:'excludeProperties', req:false, defVal:'None', desc:'By default all persistent properties of the domain object are filterable. If you wish to exclude any properties from filtering, specify them in this attribute. The value may either be a comma-delimited string, or a List of strings.'],
				 [name:'action', req:false, defVal:'filter', desc:'The controller action to call when the filter is applied.'],
				 [name:'filterPropertyValues', req:false, defVal:'None', desc:getFilterPropertyValuesDescription()],
				 [name:'customForm', req:false, defVal:'None', desc:getCustomFormDescription()],
				 [name:'controller', req:false, defVal:'None', desc:'If specified, the given controller is used in generating the form action URL.'],
				 [name:'showSortPanel', req:false, defVal:'true', desc:'Determines whether or not the sort UI is rendered in the filter pane.'],
				 [name:'shoButtons', req:false, defVal:'true', desc:'Determines whether the Cancel, Clear, and Filter buttons are rendered.'],
				 [name:'showTitle', req:false, defVal:'true', desc:'Determines whether the filter pane dialog\'s title is rendered.'],
				 [name:'sortValueMessagePrefix', req:false, defVal:'null', desc:'If specified, this is passed to the g:select tag as the valueMessagePrefix attribute.']
			 ]
			],
			[name:'includes',
			 description:'The includes tag includes the necessary stylesheet and javascript file for the plugin.  Use the optional attributes if you want to include the javascript at the bottom of your page rather than in the head.',
			 attributes:[
			 	 [name:'css', req:false, defVal:'true', desc:'If true, generates the stylesheet include link tag.'],
				 [name:'js', req:false, defVal:'true', desc:'If true, generates the script tag.']
			 ]
			],
			[name:'isFiltered',
			 description:'This is a logical tag that will render its body if any filters are applied. ',
			 attributes:[]
			],
			[name:'isNotFiltered',
			 description:'This is a logical tag that will render its body if no filters are applied. ',
			 attributes:[]
			],
			[name:'paginate',
			 description:'This is a convenience tag that may be used in place of the grails paginate tag. It encapsulates adding the appropriate parameters to the grails paginate tag for the developer.',
			 attributes:[
				 [name:'domainBean', req:true, defVal:'None', desc:"If total's value is null, this tag is used to perform a count for the user and pass that to the Grails paginate tag. If not specified and total's value is null, 0 will be used as the total count."],
				 [name:'total', req:true, defVal:'None', desc:'A numeric total to be used when calculating pages. This is the same total that is passed to the Grails paginate tag.']
			 ]
			],
			
		]
	}

	private def getFilterPropertyValuesDescription() {
		def desc = """A map of property values to pass through to each property's
 form control. For example, since Date properties render a date picker
control, you could pass the following to limit the years in the date picker:
<pre class="brush: groovy">
filterPropertyValues="\${[someDateProperty:[years:2015..1999]]}"
</pre>
or get the values from the database:
<pre class="brush: groovy">
filterPropertyValues="\${['author.lastName':[values:Author.executeQuery('select t.lastName from Author t')], 'readPriority.name':[values:ReadPriority.list()]]}"
</pre>
		"""
	}

	private def getCustomFormDescription() {
		"""If true or "true", the tag will not render the surrounding form or the
"Apply" button on it. This is left to the developer. This attribute is useful if
you want to embed the filterpane form in an existing form. (since 0.6.4)
See the example below:
<pre class="brush: xml">
&lt;form id="author-form" name="author-form" method="post">
	 &lt;filterpane:filterPane id="author-filter-pane" domainBean="com.zeddware.grails.plugins.filterpane.Author"
            associatedProperties="books.title, books.bookType"
            titleKey="fp.tag.filterPane.titleText" customForm="true"
	    formName="author-form"/>
	&lt;g:actionSubmit value="Apply Filter From Outside Filter Pane" action="filterCustomForm" />
&lt;/form>
</pre>
"""
	}
}
