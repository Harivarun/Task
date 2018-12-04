<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ValidationServlet">
		<h3>Application Form</h3>
		<Table border="3px" cellpadding="5px">



			<tr>
				<td>First name:</td>
				<td><input name="fname" type="text" value="${Data.fname }" /></td>
			</tr>
			<tr>
				<td>Last name:</td>
				<td><input name="lname" type="text" value="${Data.lname }" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input name="email" type="text" value="${Data.email }" /></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input name="phone" type="text" value="${Data.phone }" /></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="radio" value="Male" name="gender"
					checked="checked" />Male <input type="radio" value="Female"
					name="gender" />Female</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</Table>
	</form>

	<!-- First name exception popup -->
	<%
		if (null != request.getAttribute("firstname")) {
	%>
	<script language="javascript">
		alert("First Name should be grater than four letters")
	</script>
	<%
		request.setAttribute("firstname", "");
		}
	%>

	<!-- Last name exception popup -->
	<%
		if (null != request.getAttribute("lastname")) {
	%>
	<script language="javascript">
		alert("Last Name should be grater than four letters")
	</script>
	<%
		request.setAttribute("lastname", "");
		}
	%>

	<!-- Email exception popup -->
	<%
		if (null != request.getAttribute("email")) {
	%>
	<script language="javascript">
		alert("Email should be valid")
	</script>
	<%
		request.setAttribute("email", "");
		}
	%>

	<!-- phone number exception popup -->
	<%
		if (null != request.getAttribute("phone")) {
	%>
	<script language="javascript">
		alert("Phone Number should be valid")
	</script>
	<%
		request.setAttribute("phone", "");
		}
	%>
</body>
</html>