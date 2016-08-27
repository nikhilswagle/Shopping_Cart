<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="productList" align="center">
	
	<div id="errMessage" align="center" style="display:none"></div>
	
	<form:form action="addToCart.htm" modelAttribute="productDetails" method="post">
		
		<div class="row">
			<div class="col-md-4">
			    <a href="/images/products/${productDetails.id}/image.jpg" class="thumbnail"> 
			      <img src="/images/products/${productDetails.id}/image.jpg" alt="${productDetails.name}" style="width:150px;height:150px">
			    </a>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						UPC <form:label path="id" class="label label-default">${productDetails.id}</form:label>
						<input type="hidden" name="id" value="${productDetails.id}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						Name <form:label path="name" class="label label-primary">${productDetails.name}</form:label>
						<input type="hidden" name="name" value="${productDetails.name}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						Category <form:label path="category.name" class="label label-info">${productDetails.category.name}</form:label> 
						<input type="hidden" name="category.name" value="${productDetails.category.name}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						Unit Price <form:label path="unitPrice" class="label label-info">${productDetails.unitPrice}</form:label>
						<input type="hidden" name="unitPrice" value="${productDetails.unitPrice}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						Left In Stock <form:label path="inStockQty" class="badge">${productDetails.inStockQty}</form:label>
						<input type="hidden" name="inStockQty" value="${productDetails.inStockQty}" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						Quantity <form:input path="qtyOrdered" type="number" name="productDetails.qtyOrdered" min="1" max="${productDetails.inStockQty}"></form:input>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<button type="submit" value="ADD TO CART" class="btn btn-primary">ADD TO CART</button>
			</div>
		</div>
		
	</form:form>	
</div>