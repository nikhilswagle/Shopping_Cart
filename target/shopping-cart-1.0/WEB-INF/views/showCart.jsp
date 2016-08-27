<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div align="left">
		<h4>Welcome ${sessionScope.customer.firstName}</h4>
	</div>
	<div align="center">
		<form:form>
			<table>
				<tr bgcolor="BCBCBC" align="center">
						<th>UPC</th>
						<th>Name</th>
						<th>Category</th>
						<th>Unit Price</th>
						<th>Quantity Left In Stock</th>
						<th>Quantity To Be Ordered</th>
				</tr>
				<c:forEach items="${sessionScope.cart.items}" var="items" varStatus="row">
					<tr align="center">						
						<td>${items.value.id}</td> 
						<td>${items.value.name}</td>
						<td>${items.value.category.name}</td>
						<td>${items.value.unitPrice}</td>
						<td>${items.value.inStockQty}</td>
						<td><input type="number" min="0" max="${items.value.inStockQty}"
									value="${items.value.qtyOrdered}"/></td>
					</tr>
				</c:forEach>
				<tr>
					<td align="right" colspan="2"><input type="submit" formaction="showProducts.htm" formmethod="get" value="<<Continue Shopping"/></td>
					<td align="center" colspan="2"><input type="submit" formaction="updateCart.htm" formmethod="post" value="Update Cart"/></td>
					<td align="left" colspan="2"><input type="submit" formaction="checkout.htm" formmethod="get" value="Proceed To Checkout>>"/></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>