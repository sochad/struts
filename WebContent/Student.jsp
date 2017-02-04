<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
</head>
<body>
	<form>

		<fieldset disabled>
			<table>
				<tr>
					<td>Student Id: <br /> ${student.studentId}
					</td>

					<td>First name: <br /> ${student.firstName}

					</td>

					<td>Last name: <br /> ${student.lastName}

					</td>
				</tr>
				<tr>
					<td>Street address:<br /> ${student.address}
					</td>

					<td>Zip<br /> ${student.zip}
					</td>


					<td>City:<br /> ${student.city}
					</td>
				</tr>
				<tr>
					<td>State:<br /> ${student.state}
					</td>

					<td>Telephone Number:<br /> ${student.phone}

					</td>

					<td>Email: <br /> ${student.email}

					</td>
				</tr>
				<tr>
					<td>URL: <br /> ${student.url}

					</td>

					<td>Date of survey: <br /> ${student.surveyDate}

					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>