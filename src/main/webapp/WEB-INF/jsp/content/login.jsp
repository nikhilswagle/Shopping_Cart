<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>

<div id="message">${message}</div>
		
<div align="center">
	<form:form action="validateLogin.htm" method="post" modelAttribute="customer">
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
