<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Product Categories</title>
</head>
<body>
	<div align="left">
		<h4>Welcome ${sessionScope.customer.firstName}</h4>
	</div>	
	<div align="center">
		<h1>Shopping Cart Application</h1>
	</div>
	<div align="center">
		<%-- <form:form method="get" action="retrieveProducts.htm" modelAttribute="category">
			<table>
				<tr>
					<td><h4>Category</h4></td>
					<td>
						<form:select path="id" multiple="false">
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
		<form:form method="get" action="retrieveProducts.htm" modelAttribute="category">
			<table>
				<tr>
					<td><h4>Category</h4></td>
					<td>
						<form:select path="id" multiple="false">
							<c:forEach items="${sessionScope.categoryList.categories}" var="category" varStatus="row">						
								<form:option id="${category.id}" 
											 label="${category.name}" 
											 value="${category.id}"/>
							</c:forEach>
							<%-- <form:options items="${categoryList.categories}"/> --%>
						</form:select>
					</td>
					<td><input type="submit" value="GO"/></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>