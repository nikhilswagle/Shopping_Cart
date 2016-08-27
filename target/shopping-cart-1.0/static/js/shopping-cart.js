var shoppingCartApp = angular.module('shoppingCartApp', []);

shoppingCartApp.factory('itemDataFactory', function(){
	//var productData = {productData:''};
	return {productData:{}};
});

shoppingCartApp.service('cartService', function(){
	//var productData = {productData:''};
	return cartCount;
});

shoppingCartApp.controller('shoppingcart.category.controller', ['$scope', '$rootScope', 'itemDataFactory', function($scope, $rootScope, itemDataFactory){
	//$scope.productMap = {};
	$scope.showProducts = function(){
		alert($scope.categoryId);
		$.ajax({
			type:"GET",
			url:"/shopping-cart/retrieveProducts.htm?categoryId="+$scope.categoryId,
			cache:false,
			contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			dataType:"json",
			success: function(data, status, xhr) {
				//alert("Status : "+ status + "----------"+ JSON.stringify(data))
				
				// Update global var
				itemDataFactory.productData = data.productMap;
				
				// Iterate entire watch list for this scope to check if any of object has been updated
				$rootScope.$digest();				
				//alert(JSON.stringify(itemDataFactory.productData));
			},
			error: function(xhr, status) {
				alert("Error : "+ status + " : " + xhr.status);
			}
		});
	};
	/*
	$scope.$watchCollection(
			'productMap', 
			function(newVal, oldVal){
	    		itemDataFactory.productData = $scope.productMap;
				alert(JSON.stringify(itemDataFactory.productData));
			}, true);*/

}]);

shoppingCartApp.controller('shoppingcart.item.list.controller', ['$scope', 'itemDataFactory', function($scope, itemDataFactory){
	$scope.productDataList = [];
	$scope.chunkedProductDataList = [];
	$scope.showProducts = false;
	$scope.$watchCollection(
			function(){ return itemDataFactory.productData; }, 
			function(newVal, oldVal){
				//Reset productDataMap
				$scope.productDataList = [];
				$scope.chunkedProductDataList = [];
				
				// Then push new products
				$.each(newVal, function(key, productObj){
					$scope.productDataList.push(productObj);
				});
				
				// Chunk the products into 3 columns
				$scope.chunkedProductDataList = chunk($scope.productDataList, 3)
				
				// Check length to determine whether to show the product table or not
				if($scope.productDataList.length > 0){
					$scope.showProducts = true
				}
				else{
					$scope.showProducts = false;
				}
	    		//alert(JSON.stringify($scope.productDataMap));
			});
}]);

/*shoppingCartApp.controller('shoppingcart.selected.product.controller', ['$scope', function($scope){
	//$scope.product=new Object();
	//$scope.product.id="";
	//$scope.product.name="";
	//$scope.product.unitPrice=0.00;
	//$scope.product.inStockQty=0;
	//$scope.product.qtyOrdered=0;
	$scope.addToCart = function(){
		alert($scope.product.id+", "+$scope.product.name+", "+$scope.product.unitPrice+", "+$scope.product.inStockQty+", "+$scope.product.qtyOrdered);
		$.ajax({
			type:"POST",
			url:"/shopping-cart/addToCart.htm",
			cache:false,
			contentType:"json",
			dataType:"text/html",
			data: JSON.stringify($scope.product),
			success: function(data, status, xhr) {
				alert("Status : "+ status+", Data : "+data);
			},
			error: function(xhr, status) {
				alert("Error : "+ status + " : " + xhr.status);
			}
		});
	}
}])*/


shoppingCartApp.controller('shoppingcart.cart.controller', ['$scope', function($scope){
	
	$scope.productId={};
	$scope.productName={};
	$scope.productQtyOrdered={};
	
	$scope.updateCartItem = function(productId){
		alert(productId+", "+$scope.productId[productId]+", "+$scope.productName[productId]+", "+$scope.productQtyOrdered[productId]);
		var product = {"id":productId, "name":$scope.productName[productId], "qtyOrdered":$scope.productQtyOrdered[productId]}
		$.ajax({
			type:"POST",
			url:"/shopping-cart/updateCart.htm",
			cache:false,
			contentType:"application/json;charset=UTF-8",
			dataType:"json",
			data: JSON.stringify(product),
			success: function(data, status, xhr) {
				alert("Status : "+ status+", Data : "+JSON.stringify(data));
			},
			error: function(xhr, status) {
				alert("Error : "+ status + " : " + xhr.status);
			}
		});
	}
	
	$scope.removeCartItem = function(productId){
		alert(productId+", "+$scope.productId[productId]+", "+$scope.productName[productId]+", "+$scope.productQtyOrdered[productId]);
		var product = {"id":productId, "qtyOrdered":0}
		$.ajax({
			type:"POST",
			url:"/shopping-cart/updateCart.htm",
			cache:false,
			contentType:"application/json;charset=UTF-8",
			dataType:"json",
			data: JSON.stringify(product),
			success: function(data, status, xhr) {
				alert("Status : "+ status+", Data : "+JSON.stringify(data));
				// Remove the cart item html and hide the div
				$("#cartItem_"+productId).html("");
				$("#cartItem_"+productId).hide();
			},
			error: function(xhr, status) {
				alert("Error : "+ status + " : " + xhr.status);
			}
		});
	}
}])

// Split the array into fixed number of columns
function chunk(arr, size) {
	var newArr = [];
	for (var i=0; i<arr.length; i+=size) {
		newArr.push(arr.slice(i, i+size));
	}
	return newArr;
}

// Ajax call to retrieve products
function updateCart(product){
	var productMap = {};
	
	
	return productMap;
}
