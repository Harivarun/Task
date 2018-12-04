<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="2">
		<tr bgcolor="#faefad">
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Gender</th>
		</tr>

		<c:forEach var="map" items="${sessionScope.APP}">
			<tr>
				<td><c:out value="${map.value.fname }" /></td>
				<td><c:out value="${map.value.lname }" /></td>
				<td><c:out value="${map.value.email }" /></td>
				<td><c:out value="${map.value.phone }" /></td>
				<td><c:out value="${map.value.gender }" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>