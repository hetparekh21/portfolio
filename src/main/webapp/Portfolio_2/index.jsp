<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.Base64"%>
<%
String a = request.getParameter("userId").toString();
application.setAttribute("encyUID", a);
byte[] decodedBytes = Base64.getDecoder().decode(a);
String decodedString = new String(decodedBytes);
application.setAttribute("UserId", decodedString);
%>
<%@ page import="servlet.data"%>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="${data.url }" user="${data.user }" password="${data.password }" />
<!DOCTYPE HTML>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id =${UserId} ;	</sql:query>
<title>${rs.rows[0].name_}'s Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Space+Mono"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>

</head>

<body>

	<div class="fh5co-loader"></div>

	<div id="page">
		<header id="fh5co-header" class="fh5co-cover js-fullheight"
			role="banner" style="background-image: url(images/cover_bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t js-fullheight">
							<div class="display-tc js-fullheight animate-box"
								data-animate-effect="fadeIn">
								<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id =${UserId} ;	</sql:query>
								<c:forEach var="data" items="${rs.rows}">
									<div class="profile-thumb"
										style="background: url(images/user-3.jpg);"></div>

									<h1>
										<span><c:out value="${data.name_}"></c:out></span>
									</h1>
									<h3>
										<span><c:out value="${data.positions}"></c:out></span>
									</h3>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<sql:query var="rs" dataSource="${db}">SELECT a.*, c.* from about a join contact_info c on a.user_id = c.user_id where a.user_id =${UserId} ;	</sql:query>

		<c:forEach var="data" items="${rs.rows}">

			<div id="fh5co-about" class="animate-box">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>About Me</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<ul class="info">
								<li><span class="first-block">Full Name:</span><span
									class="second-block"><c:out value="${data.name_}"></c:out></span></li>
								<li><span class="first-block">Phone:</span><span
									class="second-block"><c:out value="${data.phone}"></c:out></span></li>
								<li><span class="first-block">Email:</span><span
									class="second-block"><c:out value="${data.email}"></c:out></span></li>
								<li><span class="first-block">Website:</span><span
									class="second-block"><c:out value="${data.website}"></c:out></span></li>
								<li><span class="first-block">Address:</span><span
									class="second-block"><c:out value="${data.address}"></c:out></span></li>
							</ul>
						</div>
						<div class="col-md-8">
							<h2>Hello There!</h2>
							<p>
								<c:out value="${data.about_me_1}"></c:out>
							</p>
							<p>
								<c:out value="${data.about_me_2}"></c:out>
							</p>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>
		
<!-- ends -->
		<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>
		<%!int i = 1, j = 1;%>
		<c:forEach var="data" items="${rs.rows}">
			<%
			i += 1;
			%>
		</c:forEach>

		<div id="fh5co-skills" class="animate-box">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Skills</h2>
					</div>
				</div>
				<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>
				<div class="row row-pb-md">
					<c:forEach var="data" items="${rs.rows}">
						<div class="col-md-3 col-sm-6 col-xs-12 text-center">
							<div class="chart"
								data-percent="<c:out value="${data.level}"></c:out>">
								<span><strong><c:out value="${data.skill}"></c:out></strong>
									<c:out value="${data.level}"></c:out>%</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div id="fh5co-started" class="fh5co-bg-dark">
			<div class="overlay"></div>
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Hire Me!</h2>
						<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
							mollitia reprehenderit. Eos cumque dicta adipisci architecto
							culpa amet.</p>
						<p>
							<a href="#" class="btn btn-default btn-lg">Contact Us</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-consult">
			<div class="video fh5co-video"
				style="background-image: url(images/cover_bg_1.jpg);">
				<div class="overlay"></div>
			</div>
			<div class="choose animate-box">
				<h2>Contact</h2>
				<form action="../SendMessage" method="post">
					<input type="hidden" name="user_id"
						value="<c:out value="${UserId}"></c:out>"> 
						
						<%-- <input type="hidden" name="enc_user_id"
						value="<c:out value="${encyUID}"></c:out>"> --%>
						
						<input type="hidden" name="url" id="url"
								value="">
					<div class="row form-group">
						<div class="col-md-12">
							<input type="text" id="name" class="form-control" name="name"
								placeholder="Your Name">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-md-12">
							<input type="text" id="subject" class="form-control"
								name="subject" placeholder="Your Subject">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12">
							<input type="text" id="email" class="form-control" name="email"
								placeholder="Your email address">
						</div>
					</div>


					<div class="row form-group">
						<div class="col-md-12">
							<textarea name="message" id="message" cols="30" rows="10"
								class="form-control" placeholder="message"></textarea>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" value="Send Message" class="btn btn-primary">
					</div>

				</form>
			</div>
		</div>

		<div id="map" class="fh5co-map"></div>
	</div>

	<div id="fh5co-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p>
						&copy; 2022. All Rights Reserved. <br>Designed by Some One
				</div>
			</div>
		</div>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Easy PieChart -->
	<script src="js/jquery.easypiechart.min.js"></script>

	<!-- Main -->
	<script src="js/main.js"></script>
	
	
	<script>
window.onload = function getURL() {
	document.getElementById("url").value = window.location.href;
		}
	</script>
	

</body>
</html>

