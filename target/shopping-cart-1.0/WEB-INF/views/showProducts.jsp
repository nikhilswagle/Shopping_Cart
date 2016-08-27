<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Products</title>
</head>
<body>
	<div align="left">
		<h4>Welcome ${sessionScope.customer.firstName}</h4>
	</div>	
	<div align="center">
		<h1>Shopping Cart Application</h1>
	</div>
	<div align="center">
		<%-- <form:form method="get" action="addToCart.htm" modelAttribute="productList">
			<table>
				<tr bgcolor="BCBCBC" align="center">
						<th>UPC</th>
						<th>Name</th>
						<th>Category</th>
						<th>Unit Price</th>
						<th>Quantity Left In Stock</th>
						<th>Quantity To Be Ordered</th>
				</tr>
				<c:forEach items="${productList.products}" var="product" varStatus="row">
					<tr align="center">						
						<td>${product.id}</td> 
						<td>${product.name}</td>
						<td>${product.category.name}</td>
						<td>${product.unitPrice}</td>
						<td>${product.inStockQty}</td>
						<td><input name="qtyOrdered" type="number" min="0" max="${product.inStockQty}"/></td>
					</tr>
				</c:forEach>
				<tr>
					<td align="center" colspan="5"><input type="submit" value="Add To Cart"/></td>
				</tr>
			</table>
		</form:form> --%>
		<form:form modelAttribute="itemSelection">
			<table>
				<tr bgcolor="BCBCBC" align="center">
						<th>UPC</th>
						<th>Name</th>
						<th>Category</th>
						<th>Unit Price</th>
						<th>Quantity Left In Stock</th>
						<th>Quantity To Be Ordered</th>
				</tr>
				<c:forEach items="${sessionScope.productMap.productMap}" var="productMap" varStatus="row">
					<tr align="center">						
						<td>${productMap.value.id}</td> 
						<td>${productMap.value.name}</td>
						<td>${productMap.value.category.name}</td>
						<td>${productMap.value.unitPrice}</td>
						<td>${productMap.value.inStockQty}</td>
						<td><input name="itemsSelected['${productMap.key}']" 
									type="number" min="0" max="${productMap.value.inStockQty}"
									value="${productMap.value.qtyOrdered}"/></td>
					</tr>
				</c:forEach>
				<tr>
					<td align="right" colspan="3"><input type="submit" formaction="addToCart.htm" formmethod="post" value="Add To Cart"/></td>
					<td align="left" colspan="3"><input type="submit" formaction="showCart.htm" formmethod="get" value="Show Cart"/></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>