<g:if test="${isFiltered == true}">
%{--<ul id="${id}" class="${styleClass}" style="${style}" title="${title}">--}%
  <div class="row-fluid" style="margin-bottom: 10px;">
    <g:each in="${criteria}" var="c">
      <span class="label label-info">
        ${c.fieldName}
        <g:message code="fp.op.${c.filterOp}" default="${c.filterOp}"/>
        <g:if test="${quoteValues == true}">
          "${c.filterValue}"
        </g:if>
        <g:else>
          ${c.filterValue}
        </g:else>
        <g:if test="${'between'.equalsIgnoreCase(c.filterOp)}">
          <g:if test="${quoteValues == true}">
            and "${c.filterValueTo}"
          </g:if>
          <g:else>
            and ${c.filterValueTo}
          </g:else>
        </g:if>
        <a href="${g.createLink(action: action, params: c.params)}" class="remove">
          %{--<g:if test="${removeImgFile != null}">--}%
          %{--<img src="${g.resource(dir: removeImgDir, file: removeImgFile)}" alt="(X)" title="${g.message(code: 'fp.currentCriteria.removeTitle', default: 'Remove')}"/>--}%
          %{--</g:if>--}%
          %{--<g:else>--}%
          %{--(X)--}%
          %{--</g:else>--}%
          <i class="icon icon-remove"></i>
        </a>
      </span>
    </g:each>
  </div>
%{--</ul>--}%
</g:if>