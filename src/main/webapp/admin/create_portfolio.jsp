<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="java.util.Base64"%>
<%
String a = application.getAttribute("user_id").toString();
String encodedString = Base64.getEncoder().encodeToString(a.getBytes());
%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />
<jsp:include page="header.jsp" />

<style type="text/css">
.whos-speaking-area .speakers {
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	border: 1px solid #dee2e6;
	border-radius: 6px;
}

.whos-speaking-area .speakers:hover {
	-webkit-box-shadow: 0 0 6px 5px #ddd;
	box-shadow: 0 0 6px 5px #ddd;
	border-radius: 6px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	border: 1px solid #dee2e6;
}

.whos-speaking-area .speakers .spk-img {
	position: relative;
}

.whos-speaking-area .speakers .spk-img:before {
	background: rgba(7, 2, 33, 0.449);
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	z-index: 5;
}

.whos-speaking-area .speakers .spk-img:hover:before {
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
}

.whos-speaking-area .speakers .spk-img img {
	width: 100%;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
}

.whos-speaking-area .speakers .spk-img ul {
	position: absolute;
	display: inline-block;
	top: 35%;
	left: 40%;
	width: 100px;
	line-height: 3;
	opacity: 0;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
}

.whos-speaking-area .speakers .spk-img ul li {
	display: inline-block;
	margin: 0 3px;
	-webkit-transform: perspective(50px) rotatey(80deg);
	transform: perspective(50px) rotatey(80deg);
	-webkit-transition: all 0.5s ease 0.2s;
	-o-transition: all 0.5s ease 0.2s;
	transition: all 0.5s ease 0.2s;
	margin: 0 5px;
}

/* change the li effect: please comment to change */
.whos-speaking-area .speakers .spk-img ul li {
	-webkit-transform: translate3d(-53px, -50px, 0);
	transform: translate3d(-53px, -50px, 0);
}

.whos-speaking-area .speakers .spk-img:hover ul {
	left: 35%;
	opacity: 1;
	z-index: 9;
}

.whos-speaking-area .speakers .spk-img:hover ul:before {
	opacity: 1;
	-webkit-transform: rotate(44deg) scale(1);
	-ms-transform: rotate(44deg) scale(1);
	transform: rotate(44deg) scale(1);
}

.whos-speaking-area .speakers .spk-img:hover ul li {
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.whos-speaking-area .speakers .spk-info {
	text-align: center;
	padding: 5px 0;
}

.whos-speaking-area .speakers .spk-info h3 {
	color: #252525;
	font-size: 16px;
	line-height: 16px;
	margin-bottom: 5px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	text-transform: capitalize;
}

.whos-speaking-area .speakers .spk-info h3:hover {
	color: #4125dd;
}

.whos-speaking-area-two .speakers {
	position: relative;
	overflow: hidden;
}

ul {
	list-style: outside none none;
	margin: 0;
	padding: 0;
	outline: none;
}

.mb50 {
	margin-bottom: 50px;
}

.row {
	background-color: white;
}

a {
	font-size: 12px;
}
</style>
<br>
<div class="whos-speaking-area speakers pad100">
	<div class="container">

		<!-- row start -->
		<div class="row mb50">
			<!-- Col start -->
			<div class="col-xl-3 col-lg-3 d-md-none d-lg-block col-sm-12">
				<div class="speakers w-75">
					<div class="spk-img">
						<img class="img-fluid"
							src="../assets/p1.PNG" />
						<ul>
							<li>
							<button type="button" class="btn btn-link " style="color:white" data-bs-toggle="modal" data-bs-target="#myModal2">
    Preview
  </button>
							</li>
						</ul>
					</div>
					<div class="spk-info">
						<h3>Template 1</h3>
						
						<a
								href="../Portfolio_1/index.jsp?userId=<%=encodedString%>"
								target="_blank" style="font-size: 15px;">Open</a>
						
						<button id="pf1" type="button" class="btn btn-link"
							value="http://localhost:8080/portfolyio/Portfolio_1/index.jsp?userId=<%=encodedString%>"
							onclick="getURL(this.id)">Copy</button>
					</div>
				</div>
			</div>
			<!-- /col end-->
			<!-- Col start -->
			<div class="col-xl-3 col-lg-3 d-md-none d-lg-block col-sm-12">
				<div class="speakers w-75">
					<div class="spk-img">
						<img class="img-fluid"
							src="../assets/p2.PNG" />
							
						<ul>
							<li>
							<%-- <a
								href="../Portfolio_2/index.jsp?userId=<%=encodedString%>"
								target="_blank" style="color: white; font-size: 16px;">Preview</a> --%>
								
							<button type="button" class="btn btn-link" style="color:white" data-bs-toggle="modal" data-bs-target="#myModal">
    Preview
  </button>

							</li>
						</ul>
					</div>
					<div class="spk-info">
						<h3>Template 2</h3>
						<%-- <a href="../Portfolio_2/index.jsp?userId=<%= encodedString %>" id="copy-link">Copy Link</a> --%>
						<a
								href="../Portfolio_2/index.jsp?userId=<%=encodedString%>"
								target="_blank" style="font-size: 15px;">Open</a>
						<button id="pf2" type="button" class="btn btn-link"
							value="http://localhost:8080/portfolyio/Portfolio_2/index.jsp?userId=<%=encodedString%>"
							onclick="getURL(this.id)">Copy</button>
					</div>
				</div>
			</div>
			<!-- /col end-->
		</div>
		<!-- /row end-->

	</div>
	<!-- /container end-->
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <iframe src="http://localhost:8080/portfolyio/Portfolio_2/index.jsp?userId=<%= encodedString %>" style="height:100%;width:100%;" title="description"></iframe>
      </div>
    </div>
  </div>
</div>

<div class="modal" id="myModal2">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <iframe src="http://localhost:8080/portfolyio/Portfolio_1/index.jsp?userId=<%= encodedString %>" style="height:100%;width:100%;" title="description"></iframe>
      </div>
    </div>
  </div>
</div>



  
<jsp:include page="footer.jsp" />
