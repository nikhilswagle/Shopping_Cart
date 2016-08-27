<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<!DOCTYPE html>
<html ng-app="shoppingCartApp">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
		<!-- Application specific CSS -->
		<link href="<c:url value='/static/css/shopping-cart.css'/>" rel="stylesheet"  type="text/css"/>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
		<!-- Angular JS -->
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
		
		<!-- Application specific java script file -->
		<script type="text/javascript" src="<c:url value='/static/js/shopping-cart.js'/>"></script>
			
		<title><tiles:insertAttribute name="title"/></title>
	</head>
	<body>
		<!--	
		<div align="center">
		
			<table id="baseLayout">
				<tr height="100">
					<td colspan="2" align="center" width="900"><tiles:insertAttribute name="header"/></td>
				</tr>
				<tr height="500">
					<td align="center" width="200"><tiles:insertAttribute name="sidebar"/></td>
					<td align="center" width="700"><tiles:insertAttribute name="content"/></td>
				</tr>
				<tr height="100">
					<td colspan="2" align="center" width="900"><tiles:insertAttribute name="footer"/></td>
				</tr>
			</table>
		</div>
		-->
		<div id="baseLayout">
			<div class="container">
				<div class="row">			
					<div class="col-md-12">
						<tiles:insertAttribute name="header"/></td>
					</div>
				</div>
			<!--</div>
			<div class="container">-->
				<div class="row">
					<div class="col-md-12">
						<tiles:insertAttribute name="navbar"/></td>
					</div>
				</div>				
			<!--</div>
			<div class="container">-->
				<div class="row">			
					<div class="col-md-2">
						<tiles:insertAttribute name="sidebar"/>
					</div>
					<div class="col-md-10">
						<tiles:insertAttribute name="content"/>
					</div>
				</div>
			<!--</div>
			<div class="container">-->
				<div class="panel panel-default">
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-12">
								<tiles:insertAttribute name="footer"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>