<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="navbar" align="center">
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="login.htm">shopping-cart.com</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Laptops <span class="caret"></span></a>
		   		<ul class="dropdown-menu">
		        	<li><a href="#">Dell</a></li>
		          	<li><a href="#">HP</a></li>
		         	<li><a href="#">Lenovo</a></li>
		        </ul>
		   	</li>
		   	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Electronics <span class="caret"></span></a>
		   		<ul class="dropdown-menu">
		        	<li><a href="#">Digital Camera</a></li>
		          	<li><a href="#">Printers</a></li>
		        </ul>
		   	</li>
		   	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cell Phones <span class="caret"></span></a>
		   		<ul class="dropdown-menu">
		        	<li><a href="#">Android</a></li>
		          	<li><a href="#">Apple</a></li>
		         	<li><a href="#">Windows</a></li>
		        </ul>
		   	</li>
		</ul>
		<c:if test="${not empty sessionScope.customer.firstName}">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${sessionScope.customer.firstName}</a></li>
			</ul>
		</c:if>
	</nav>
</div>