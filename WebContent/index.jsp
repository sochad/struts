<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./jquery-ui.css" />
<script src="jquery.js"></script>
<script src="jquery-ui.js"></script>
<style>
body {
	background-color: #96BBCB;
}

h1 {
	color: #000080;
	text-shadow: 2px 2px 4px #000000;
}

.intro {
	background-color: red;
	color: blue;
}

#img {
	position: fixed;
	bottom: 0;
	right: 0;
}

#myDialog {
	white-space: normal;
}
</style>

<script type="text/javascript">
	$( function() {
			$( "#tabs" ).tabs();
    		$( "#bottomlogo" ).tooltip();
		} );

		var now = new Date(); // current date and time
		var hour = now.getHours(); // current hour (0-23)
		var name;

		if ( hour < 12 ) // determine whether it is morning
		document.write( "<h1>Good Morning, " ); else
		{
			hour = hour - 12; // convert from 24-hour clock to PM time
		// determine whether it is afternoon or evening
			if ( hour < 6 )
				document.write( "<h1>Good Afternoon, " );
			else
			document.write( "<h1>Good Evening, " );
		} // end else

		if ( document.cookie ){
		// convert escape characters in the cookie string to their
		 // English notation
		var myCookie = unescape( document.cookie );

		 // split the cookie into tokens using = as delimiter
		 var cookieTokens = myCookie.split( "=" );

		 // set name to the part of the cookie that follows the = sign
		 name = cookieTokens[ 1 ];
		 } // end if
		 else
		 {
		 // if there was no cookie, ask the user to input a name
		 	name = window.prompt( "Please enter your name", "Somesh" );

		 // escape special characters in the name string
		 // and add name to the cookie
		 	var d = new Date();
			d.setTime(d.getTime() + (1*24*60*60*1000));
			var expires = "expires=" + d.toGMTString();
			document.cookie = "name=" + escape( name ) + ";" + expires;
		} // end else


		document.writeln(
		name + ", welcome to SWE 642 Coursework!!</h1>" );
		 document.writeln( "<a href = 'javascript:wrongPerson()'> " +
		 "Click here if you are not " + name + "</a>" );

		 // reset the document's cookie if wrong person
		function wrongPerson()
		 {
		 // reset the cookie
		 document.cookie= "name=null;" +
		 " expires=Thu, 01-Jan-95 00:00:01 GMT";

		 // reload the page to get a new name after removing the cookie
		 location.reload();
		 } // end function wrongPerson

function cleardiv(){
			document.getElementById('invalidzip').innerHTML = '';
		}
		
		function accessJson() {
			var zip = document.getElementById('zip').value;
		    var xhr = new XMLHttpRequest();
		    var flag =true;

		    var request = 'data.json';
			xhr.open('GET',request);
			xhr.send(null);

		    xhr.onreadystatechange = function () {
				var DONE = 4; // readyState 4 means the request is done.
				var OK = 200; // status 200 is a successful return.
				if (xhr.readyState === DONE) {
					if (xhr.status === OK) {
						var data = JSON.parse(xhr.responseText);
				 		for(let i = 0, l = data['zipcodes'].length; i < l; i++) {
							var obj = data['zipcodes'][i];
							if(obj['zip']==zip){
								document.getElementById('state').value = obj['state'];
								document.getElementById('city').value = obj['city'];
								document.getElementById('invalidzip').innerHTML = '';
								flag = false;
							}
						}
						if(flag){
							document.getElementById('state').value = '';
							document.getElementById('city').value = '';
							document.getElementById('invalidzip').innerHTML = 'Invalid Zip';
						}
					}
					else {
				  		alert('Error: ' + xhr.status); // An error occurred during the request.
					}
				}
			};   
		}
		
		function minmaxavg(){
			var data = document.getElementById("data").value;
			arr = data.split(',');
			var reg = new RegExp('^[1-9][0-9]?$|^100$');
			if(arr.length<10){
				jQuery("#myDialogText").html("Please enter atleast 10 integers");
				$( "#myDialog" ).dialog();
			}
			else{
				for (var i = 0; i < arr.length; i++) {
					if(!reg.test(arr[i])){
						jQuery("#myDialogText").html("Please enter numbers between 1-100");
						$( "#myDialog" ).dialog();
					}
				}
			}
		}
			
		function formValidation() {
			var errorstring = '';
			var flag = true;
			if(!alphabet(errorstring)){
				flag = false;
				errorstring += "Please enter only alphabets in name in firstname.<br>";
			}
			if(!alphabet1(errorstring)){
				flag = false;
				errorstring += "Please enter only alphabets in name in lastname.<br>";
			}
			if(!alphanumeric(errorstring)){
				flag = false;
				errorstring += "The Street address should only be alphanumeric.<br>";
			}
			if (!checkradio(errorstring)) {
				errorstring += "Atleast check one radio button.<br>";
				flag = false;
			}
			if (!checkCheckBox(errorstring)) {
				errorstring += "Please check atleast 2 checkboxes.<br>";
				flag = false;
			}
			if (!emailValidation(errorstring)) {
				errorstring += "Please enter a valid email.<br>";
				flag = false;
			}
			if(!flag)
				jQuery("#myDialogText").html(errorstring);
				$( "#myDialog" ).dialog();
			return flag;
		}

		function alphabet(){
			var alpha = new RegExp('^[a-zA-Z]+$');
			var inputtext = document.getElementById("firstName").value;
			
			if(alpha.test(inputtext)){
				return true;
			}
			else{
				document.getElementById("firstName").value='';
				return false;
			}
		}
		function alphabet1() {
			var alpha = new RegExp('^[a-zA-Z]+$');
			var inputtext2 = document.getElementById("lastName").value;

			if(alpha.test(inputtext2)){
				return true;
			}
			else{
				document.getElementById("lastName").value='';
				return false;
			}
		}
		function alphanumeric(errorstring) {
			var street = document.getElementById("address").value;
			var alphanum = new RegExp('^[0-9a-zA-Z\\s]+$');
			if(alphanum.test(street)){
				return true;
			}else{
				document.getElementById("address").value='';
				return false;
			}
		}
		function checkradio(errorstring) {
			var chx = document.getElementsByName("interest");
			for (var i=0; i<chx.length; i++) {
				if (chx[i].type == 'radio' && chx[i].checked) {
			  		return true;
				} 
			}
			return false;
		}
		function checkCheckBox(errorstring){
		    var checkboxes=document.getElementsByName("university");
		    var okay=0;
		    for(var i=0,l=checkboxes.length;i<l;i++)
		        if(checkboxes[i].checked)
		            okay++;
		
		    if(okay<2){
		    	return false;
		    }else{
		    	return true;
		    }
		}
		function emailValidation(errorstring){
			var emailExp = new RegExp('^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$');

			inputtext = document.getElementById('email').value;
			if(inputtext.match(emailExp)){
				return true;
			}else{
				document.getElementById('email').value='';
				return false;
			}
		}
		 
	</script>
</head>
<body>
	<font face="verdana">
		<div id="tabs">
			<ul>
				<li><a href=".\assignment1.html">Homepage + Assignment 1</a></li>
				<li><a href=".\assignment2.html">Assignment 2</a></li>
				<li><a href="#survey">Survey + Assignment3</a></li>
			</ul>
			<div id="survey">
				<table>
					<thead>
						<h1>CS Deptartment Survey</h1>
					</thead>
					<h4>
						<a href="index.jsp"><img src="GMUblack.png" alt="logo" /></a> <font
							face="verdana"> <s:form action="login"
								autocomplete="on" onsubmit="return formValidation()" theme="simple">

								<tr>
									<td>Student Id: <br /> <s:textfield
											name="student.studentId" id="studentId"/>
									</td>

									<td>First name: <br /> <s:textfield
											name="student.firstName" id="firstName"/>
									</td>

									<td>Last name: <br /> <s:textfield
											name="student.lastName" id="lastName"/>
									</td>
								</tr>
								<tr>
									<td>Street address:<br /> <s:textfield
											name="student.address" id="address"/></td>

									<td>Zip:<br /> <s:textfield onfocusout="accessJson()"
											name="student.zip" id="zip"/></td>


									<td>City:<br /> <s:textfield name="city" id="city" /></td>

									<td><div id="invalidzip"></div></td>
								</tr>
								<tr>
									<td>State:<br /> <s:textfield name="student.state" id="state"/></td>

									<td>Telephone Number:<br /> <s:textfield
											name="student.phone" /></td>

									<td>Email: <br /> <s:textfield
											placeholder="john.doe@gmail.com" name="student.email" id="email" /></td>
								</tr>
								<tr>
									<td>URL: <br /> <s:textfield
											placeholder="https://www.google.com/" name="student.url" id="url" /></td>

									<td>Date of survey: <br />
											  <s:date name="student.surveyDate" var="formattedVal" format="YYYY-MM-DD"/>
    										<s:textfield name="student.surveyDate" placeholder="YYYY-MM-DD" value="%{#formattedVal}" key="labelkey" />
											</td>

									<td>High School Graduation Date:<br /> <s:select
											list="#{'1':'January', '2':'February', '3':'March', '4':'April', '5':'May', '6':'June', 
														'7':'July', '8':'August', '9':'September', '10':'October', '11':'November', '12':'December'}"
											id="graduation" /> <s:textfield type="number" id="year"
											name="year" /></td>
								</tr>
								<tr>
									<td>What did you like most about the campus: <br /> <input
										type="checkbox" id="university" name="university"
										value="students" />Students<br /> <input type="checkbox"
										id="university" name="university" value="location" />Location<br />
										<input type="checkbox" id="university" name="university"
										value="campus" />Campus<br /> <input type="checkbox"
										id="university" name="university" value="atmosphere" />Atmosphere<br />
										<input type="checkbox" id="university" name="university"
										value="dorm" />Dorm rooms <br /> <input type="checkbox"
										id="university" name="university" value="sports" />sports<br />
									</td>

									<td>What gave rise to your interst in this university: <br />

										<input type="radio" id="interest" name="interest"
										value="friends" />Friends<br /> <input type="radio"
										id="interest" name="interest" value="television" />Television<br />
										<input type="radio" id="interest" name="interest"
										value="internet" />Internet<br /> <input type="radio"
										id="interest" name="interest" value="other" />other<br />
									</td>

									<td>Recommending GMU to others: <br /> <select id="reco">
											<option value="Very Likely">Very Likely</option>
											<option value="Likely">Likely</option>
											<option value="Unlikely">Unlikely</option>
									</select>
									</td>
								</tr>
								<tr>

									<td>Additional Comments:<br /> <textarea rows="4"
											cols="50"></textarea>
									</td>

									<td>Data:<br /> <s:textfield type="text"
											name="student.data" onfocusout="minmaxavg()" id="data" />
									</td>
								</tr>
								<tr>
									<td><s:submit type="submit" value="Submit" /></td>
									<td><input type="reset" name="reset" onclick="cleardiv()"
										value="Reset"></td>
								</tr>

							</s:form>
					</h4>
				</table>
				<div id="myDialog">
					<div id="myDialogText"></div>
				</div>
	</font>
	<table border="3" cellpadding="3">
		<tr style="align-content: center; padding: all;">
			<td>Major</td>
			<td>Computer Science</td>
		</tr>
		<tr style="align-content: center; padding: all;">
			<td>G Number</td>
			<td>G00963429</td>
		</tr>
		<tr style="align-content: center; padding: all;">
			<td>Email</td>
			<td>schadda@gmu.edu</td>
		</tr>
	</table>
	<div id="img">
		<a href="https://www2.gmu.edu/"> <img id="bottomlogo"
			title="Please visit http://www.gmu.edu for more information"
			src="./GMURGB.bmp" />
		</a>
	</div>
	</div>
	</div>
	</font>
</body>
</html>
