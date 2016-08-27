<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style>
		.error {
			color: #ff0000;
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Shopping Cart Login</title>
</head>
<body>
		
	<div align="center">
	
		<h1>Shopping Cart Application</h1>
		
		<form:form action="displayCategories.htm" method="get" modelAttribute="customer">
			<table>
				<tr>
					<td colspan="2" align="center">
						<form:errors cssClass="error"/>
					</td>
				</tr>
				<tr>
					<td>Username</td>
					<td><form:input path="username" maxlength="20"/></td>
					<td><form:errors path="username" cssClass="error"/></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><form:password path="password" maxlength="20"/></td>
					<td><form:errors path="password" cssClass="error"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="submit" value="Submit"/>
						<input type="reset" name="reset" value="Reset"/>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>