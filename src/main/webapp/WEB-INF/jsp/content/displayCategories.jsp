<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>


<div id="categoryDiv" align="center" ng-controller="shoppingcart.category.controller">
	<%-- <form:form method="get" action="retrieveProducts.htm" modelAttribute="category">
		<table>
			<tr>
				<td><h4>Category</h4></td>
				<td>
					<form:select path="id" multiple="false" >
						<c:forEach items="${categoryList.categories}" var="category" varStatus="row">						
							<form:option id="${category.id}" 
										 label="${category.name}" 
										 value="${category.id}"/>
						</c:forEach>
						<form:options items="${categoryList.categories}"/>
					</form:select>
				</td>
				<td><input type="submit" value="GO"/></td>
			</tr>
		</table>
	</form:form> --%>
	<table>
		<tr>
			<td><h4>Category</h4></td>
			<td>
				<select id="categorySelect" ng-model="categoryId">
					<c:forEach items="${sessionScope.categoryList.categories}" var="category" varStatus="row">						
						<option id="${category.id}" 
									 label="${category.name}" 
									 value="${category.id}"/>
					</c:forEach>
					<%-- <form:options items="${categoryList.categories}"/> --%>
				</select>
			</td>
			<td><button value="GO" class="btn btn-primary" ng-click="showProducts()">GO</button></td>
		</tr>
	</table>
</div>

<div id="blankDiv" class="col-md-10">
&nbsp;
</div>

<%@ include file="/WEB-INF/jsp/content/showProducts.jsp" %>
	
