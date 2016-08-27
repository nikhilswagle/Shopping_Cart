
<div id="productList" align="center" ng-controller="shoppingcart.item.list.controller">
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
	<%--
	<form:form modelAttribute="itemSelection">
		<table class="productsTable">
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
	--%>
	<div id="errMessage" align="center" style="display:none">
	</div>
	<div id="productDiv" align="center" ng-show="showProducts">
		<%--<table id="productTab">
			<tr bgcolor="BCBCBC" align="center">
				<th>UPC</th>
				<th>Name</th>
				<th>Category</th>
				<th>Unit Price</th>
				<th>Quantity Left In Stock</th>
				<th>Quantity To Be Ordered</th>
			</tr>
			<tr ng-repeat="product in productDataList">
				<td>{{product.id}}</td> 
				<td>{{product.name}}</td>
				<td>{{product.category.name}}</td>
				<td>{{product.unitPrice}}</td>
				<td>{{product.inStockQty}}</td>
				<td>{{product.qtyOrdered}}</td>
			</tr>
		</table>--%>
		<div class="row" ng-repeat="productRow in chunkedProductDataList">
			<div class="col-md-4" ng-repeat="product in productRow">
			    <a href="/shopping-cart/viewProductDetails.htm?productId={{product.id}}" class="thumbnail"> 
			      <img src="/images/products/{{product.id}}/image.jpg" alt="{{product.name}}" style="width:150px;height:150px">
			      <p>{{product.name}}</p>
			    </a>
			</div>
		</div>
	</div>
	
</div>