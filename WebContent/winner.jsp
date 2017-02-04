<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.sql.*"%>
<!-- Author: Somesh This JSP displays the winner student -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data</title>
</head>
<body>
	<h1>Thank You for filling out the Survey</h1>
	<h1>You are a raffle ticket winner of two movie tickets</h1>

	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g",
				"schadda", "ozechy");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt
				.executeQuery("Select s.studentid from student s");
	%>

	<h4>Your Mean: ${data.mean}</h4>
	<h4>Your Standard Deviation:${data.standardDeviation}</h4>

	<h1>You could access the following student information</h1>
	<ul>
		<%
			while (rs.next()) {
				String sid = rs.getString("studentid");
		%>
		<li><s:url action="next" var="urlTag">
				<s:param name="sid"><%=sid%></s:param>
			</s:url> <a href="<s:property value="#urlTag" />"><%=sid%></a></li>
		<%
			}
		%>
	</ul>
</body>
</html>