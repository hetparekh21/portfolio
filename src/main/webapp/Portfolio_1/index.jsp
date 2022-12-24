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
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id =${UserId} ;	</sql:query>
<title>${rs.rows[0].name_}'s Profile</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
</head>

<style>
#hero {
	width: 100%;
	height: 100vh;
	/* background: url("../img/hero-bg.jpg") top center; */
	background-size: cover;
	background: rgb(4,11,20);
background: -moz-linear-gradient(125deg, rgba(4,11,20,1) 0%, rgba(19,41,69,1) 100%);
background: -webkit-linear-gradient(125deg, rgba(4,11,20,1) 0%, rgba(19,41,69,1) 100%);
background: linear-gradient(105deg, rgba(4,11,20,1) 0%, rgba(19,41,69,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#040b14",endColorstr="#132945",GradientType=1);
}
</style>

<body>




	<!-- ======= Mobile nav toggle button ======= -->
	<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

	<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id =${UserId} ;	</sql:query>

	<c:forEach var="data" items="${rs.rows}">

		<!-- ======= Header ======= -->
		<header id="header">
			<div class="d-flex flex-column">

				<div class="profile">
					<img src="assets/img/profile-img.jpg" alt=""
						class="img-fluid rounded-circle">
					<h1 class="text-light">
						<a href="index.html"> <c:out value="${data.name_}"></c:out>
						</a>
					</h1>
				</div>



				<nav id="navbar" class="nav-menu navbar">
					<ul>
						<li><a href="#hero" class="nav-link scrollto active"><i
								class="bx bx-home"></i> <span>Home</span></a></li>
						<li><a href="#about" class="nav-link scrollto"><i
								class="bx bx-user"></i> <span>About</span></a></li>
						<li><a href="#contact" class="nav-link scrollto"><i
								class="bx bx-envelope"></i> <span>Contact</span></a></li>
					</ul>
				</nav>
				<!-- .nav-menu -->
			</div>
		</header>
		<!-- End Header -->

		<!-- ======= Hero Section ======= -->
		<section id="hero"
			class="d-flex flex-column justify-content-center align-items-center">
			<div class="hero-container" data-aos="fade-in">
				<h1>
					<c:out value="${data.name_}"></c:out>
				</h1>
				<p>
					I'm <span class="typed"
						data-typed-items="<c:out value="${data.positions}"></c:out>"></span>
				</p>
			</div>
		</section>
		<!-- End Hero -->

	</c:forEach>

	<main id="main">

		<sql:query var="rs" dataSource="${db}">SELECT a.*, c.* from about a join contact_info c on a.user_id = c.user_id where a.user_id =${UserId} ;	</sql:query>

		<c:forEach var="data" items="${rs.rows}">


			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="section-title">
						<h2>About</h2>
						<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius
						consequatur ex aliquid fuga eum quidem. Sit sint consectetur
						velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit
						suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem
						hic quas.</p> -->
					</div>

					<div class="row">
						<div class="col-lg-4" data-aos="fade-right">
							<img src="assets/img/profile-img.jpg" class="img-fluid" alt="">
						</div>
						<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
							<h3>UI/UX Designer &amp; Web Developer.</h3>
							<!-- <p class="fst-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p> -->
							<div class="row">
								<div class="col-lg-6">
									<ul>
										<li><i class="bi bi-chevron-right"></i> <strong>Website:</strong>
											<span><a href=<c:out value="${data.website}"></c:out> target="_blank"><c:out value="${data.website}"></c:out></a></span></li>
										<li><i class="bi bi-chevron-right"></i> <strong>Phone:</strong>
											<span><c:out value="${data.phone}"></c:out></span></li>
									</ul>
								</div>
								<div class="col-lg-6">
									<ul>
										<li><i class="bi bi-chevron-right"></i> <strong>Email:</strong>
											<span><c:out value="${data.email}"></c:out></span></li>
									</ul>
								</div>
							</div>
							<p>
								<c:out value="${data.about_me_1}"></c:out>
							</p>
							<p>
								<c:out value="${data.about_me_2}"></c:out>
							</p>
						</div>
					</div>

				</div>
			</section>
		</c:forEach>
		<!-- End About Section -->


		<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>


		<!-- ======= Skills Section ======= -->
		<section id="skills" class="skills section-bg">
			<div class="container">

				<div class="section-title">
					<h2>Skills</h2>
					<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p> -->
				</div>

				<%!int i = 1, j = 1;%>
				<div class="row skills-content">
					<c:forEach var="data" items="${rs.rows}">
						<%
						i += 1;
						%>
					</c:forEach>
					<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>
					<c:forEach var="data" items="${rs.rows}">

						<%
						if (j++ <= i / 2) {
						%>
						<div class="col-lg-6" data-aos="fade-up">

							<div class="progress">
								<span class="skill"><c:out value="${data.skill}"></c:out>
									<i class="val"><c:out value="${data.level}"></c:out>%</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar"
										aria-valuenow="<c:out value="${data.level}"></c:out>"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

						</div>
						<%
						} else {
						%>
						<div class="col-lg-6" data-aos="fade-up">

							<div class="progress">
								<span class="skill"><c:out value="${data.skill}"></c:out>
									<i class="val"><c:out value="${data.level}"></c:out> %</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar"
										aria-valuenow="<c:out value="${data.level}"></c:out>"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

						</div>
						<%
						}
						%>
					</c:forEach>

				</div>

			</div>
		</section>
		<!-- End Skills Section -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container">

				<div class="section-title">
					<h2>Contact</h2>
					<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p> -->
				</div>

				<div class="row" data-aos="fade-in">
					<sql:query var="rs" dataSource="${db}">SELECT * FROM contact_info where user_id =${UserId} ;</sql:query>

					<c:forEach var="data" items="${rs.rows}">
						<div class="col-lg-5 d-flex align-items-stretch">
							<div class="info">
								<div class="address">
									<i class="bi bi-geo-alt"></i>
									<h4>Location:</h4>
									<p>
										<c:out value="${data.address}"></c:out>
									</p>
								</div>

								<a href="mailto:admin@gmail.com">
									<div class="email">
										<i class="bi bi-envelope"></i>
										<h4>Email:</h4>
										<p>
											<c:out value="${data.email}"></c:out>
										</p>
									</div>


								</a>

								<div class="phone">
									<i class="bi bi-phone"></i>
									<h4>Call:</h4>
									<p>
										<c:out value="${data.phone}"></c:out>
									</p>
								</div>
							</div>


						</div>
					</c:forEach>

					<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
						<form action="../SendMessage" method="post">
							<input type="hidden" name="user_id"
								value="<c:out value="${UserId}"></c:out>">

							<%-- <input type="hidden" name="enc_user_id"
								value="<c:out value="${encyUID}"></c:out>"> --%>

							<input type="hidden" name="url" id="url" value="">
							<div class="row">
								<div class="form-group col-md-12">
									<label for="name">Your Name</label> <input type="text"
										name="name" placeholder="Enter name" class="form-control"
										required>
								</div>
								<div class="form-group col-md-12 mt-3">
									<label for="subject">Subject</label> <input type="text"
										name="subject" placeholder="Enter subject"
										class="form-control" required>
								</div>
								<div class="form-group col-md-12 mt-3">
									<label for="email">Your Email</label> <input type="email"
										name="email" placeholder="Enter email" class="form-control"
										required>
								</div>
							</div>
							<div class="form-group mt-3">
								<label for="message">Message</label>
								<textarea class="form-control" name="message" id="message"
									rows="10" required></textarea>
							</div>
							<div class="text-center mt-2">
								<button type="submit" name="submit" id="submit"
									class="btn btn-primary">Send Message</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/typed.js/typed.min.js"></script>
	<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

	<script>
		window.onload = function getURL() {
			document.getElementById("url").value = window.location.href;
		}
	</script>
</body>

</html>