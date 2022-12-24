<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="servlet.data"%>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="${data.url }" user="${data.user }" password="${data.password }" />

<jsp:include page="header.jsp" />

<c:if test="${pageContext.request.method=='POST'}">

	<sql:update dataSource="${db}" var="count">  
		UPDATE about SET 
			name_ = "${param.name}", 
			nationality= "${param.nationality}", 
			about_me_1= "${param.about_me_1}",
			website = "${param.website}",
			positions= "${param.positions}",
			<%
	if (request.getParameter("about_me_2") != null) {
		if (!request.getParameter("about_me_2").isBlank() || !request.getParameter("about_me_2").isEmpty()) {
	%>about_me_2= "${param.about_me_2}",<%
	}
	}
	%>
			projects= ${param.projects}
		where user_id = ${user_id}
	</sql:update>

	<c:if test="${count eq \"0\" or  \"null\"}">

		<%
		if (request.getParameter("about_me_2") != null) {
			if (!request.getParameter("about_me_2").isBlank() || !request.getParameter("about_me_2").isEmpty()) {
		%><sql:update dataSource="${db}" var="count">  
			INSERT INTO about(name_ , nationality, about_me_1, about_me_2, website, positions , projects , user_id) VALUES 
			("${param.name}", "${param.nationality}", "${param.about_me_1}", "${param.about_me_2}", "${param.website}", "${param.positions}" , ${param.projects} ,${user_id} );
		</sql:update>
		<%
		}
		} else {
		%>
		<sql:update dataSource="${db}" var="count">  
			INSERT INTO about(name_ , nationality, about_me_1, website, positions , projects , user_id) VALUES 
			("${param.name}", "${param.nationality}", "${param.about_me_1}", "${param.website}", "${param.positions}" , ${param.projects} ,${user_id} );
		</sql:update>
		<%
		}
		%>
	</c:if>

</c:if>

<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong>About Me</strong> <span class="box-link"
							style="float: right;"> <label class="switch"> <input
								id="edit" type="checkbox" onclick="formSetting()"> <span
								class="slider round"></span>
						</label>
						</span>
					</div>

					<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id = ${user_id};	</sql:query>

					<form method="post" id="editForm" action="about_me.jsp">
						<div class="card-body card-block">
							<div class="form-group">
								<div class="form-group">
									<label for="about" class=" form-control-label">Name</label> <input
										type="text" name="name" id="name" value="${rs.rows[0].name_}"
										class="form-control" required disabled>
								</div>

								<div class="form-group">
									<label for="about" class=" form-control-label">Nationality</label>
									<input type="text" name="nationality" class="form-control"
										value="${rs.rows[0].nationality}" required disabled>
								</div>


								<div class="form-group">
									<label for="about" class=" form-control-label">My
										Positions</label> <input type="text" value="${rs.rows[0].positions}"
										name="positions" class="form-control" required disabled>
								</div>

								<div class="form-group">
									<label for="about" class=" form-control-label">Projects</label>
									<input type="number" name="projects"
										value="${rs.rows[0].projects}" class="form-control" required
										disabled min="0" value="0">

								</div>
								<div class="form-group">
									<label for="about" class=" form-control-label">About
										Me-1</label>
									<textarea name="about_me_1" class="form-control" required
										disabled>${rs.rows[0].about_me_1}</textarea>
								</div>
								<div class="form-group">
									<label for="about" class=" form-control-label">About
										Me-2</label>
									<textarea name="about_me_2" class="form-control" disabled>${rs.rows[0].about_me_2}</textarea>
								</div>

								<div class="form-group">
									<label for="about" class=" form-control-label">Website</label>
									<input type="text" name="website" id="website"
										value="${rs.rows[0].website}" class="form-control" required
										disabled>
								</div>

								<button id="payment-button" name="submit" type="submit"
									class="btn btn-lg btn-info btn-block" disabled>
									<span id="payment-button-amount">Submit</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function printD() {
		alert(document.getElementById("name").value);
	}
</script>

<!-- FOOTER -->
<jsp:include page="footer.jsp" />
