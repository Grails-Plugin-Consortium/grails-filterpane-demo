<div class="buttons">
    <span class="button">
        <input type="button"
               class="btn btn-warning"
               value="${cancelText}" 
               onclick="return grailsFilterPane.hideElement('${containerId}');" />
    </span>
    <span class="button">
        <input type="button"
               class="btn btn-info"
               value="${clearText}" 
               onclick="return grailsFilterPane.clearFilterPane('${formName}');" />
    </span>
    <span class="button">
    	<g:actionSubmit class="btn btn-success" value="${applyText}" action="${action}" />
    </span>
</div>