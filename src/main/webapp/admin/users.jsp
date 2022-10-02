<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="servlet.data"%>

<%@ page import="servlet.data"%>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="${data.url }" user="${data.user }" password="${data.password }" />

<c:if test="${pageContext.request.method=='POST'}">
	<% if(request.getParameter("formType").equalsIgnoreCase("edit")){ %>
	<sql:update dataSource="${db}" var="count">
		UPDATE user SET 
			username = "<%=request.getParameter("username")%>", 
			email= "<%=request.getParameter("email")%>"
		where id = ${user_id}
	</sql:update>
	<%}else {%>
	<sql:update dataSource="${db}" var="count">
	UPDATE user SET 
		pass= "<%=data.getMd5(request.getParameter("password"))%>"
	where id = ${user_id}
</sql:update>
<%} %>
</c:if>


<jsp:include page="header.jsp" />
<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong>User</strong> <span class="box-link" style="float: right;"><label
							class="switch"> <input id="edit" type="checkbox"
								onclick="formSetting()"> <span class="slider round"></span>
						</label> </span>
					</div>
					<form method="post" id="editForm" action="users.jsp">
					<input type="hidden" value="edit" name="formType">
						<sql:query var="rs" dataSource="${db}">SELECT * from user where id =${user_id} ; </sql:query>

						<c:forEach var="data" items="${rs.rows}">
							<div class="card-body card-block">
								<div class="form-group">
									<div class="form-group">
										<label for="users" class=" form-control-label">User
											Name</label> <input type="text" name="username"
											placeholder="Enter user name" class="form-control"
											value='<c:out value="${data.username}"></c:out>' required
											disabled>
									</div>

									<div class="form-group">
										<label for="users" class=" form-control-label">Email</label> <input
											type="email" name="email" placeholder="Enter email"
											class="form-control"
											value='<c:out value="${data.email}"></c:out>' required
											disabled>
									</div>

									<!-- <div class="form-group">
										<label for="users" class=" form-control-label">Password</label>
										<input type="password" name="password"
											placeholder="Enter password" class="form-control"
											 required
											disabled>
									</div> -->
									<button type="button" class="btn btn-link" data-toggle="modal"
										data-target="#exampleModal" disabled>Change Password
									</button>

									<button id="payment-button" name="submit" type="submit"
										class="btn btn-lg btn-info btn-block" disabled>
										<span id="payment-button-amount">Submit</span>
									</button>
								</div>
							</div>
						</c:forEach>
					</form>


				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" id="editPassForm" action="users.jsp">
				<input type="hidden" value="cPass" name="formType">
					<div class="form-group">
						<label for="changePass1">Password</label> <input type="password"
							class="form-control" id="changePass1"  name="password">
					</div>
					<div class="form-group">
						<label for="changePass2">Confirm Password</label> <input
							type="password" class="form-control" id="changePass2">
					</div>
					<!-- center this submit button -->
					<div class="text-center">
						<button type="submit" class="btn btn-primary" disabled>Submit</button>
					</div>
					<!-- <button type="submit" class="btn btn-primary">Submit</button> -->
				</form>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>$(document).ready(function() {
	// create a function to check if password and confirm password are the same
	$('#changePass2').keyup(function() {
		// get the value of password and confirm password
		var password = $('#changePass1').val();
		var confirmPassword = $('#changePass2').val();

		// check if password and confirm password are the same and enable disable submit button
		if (password == confirmPassword) {
			$('#changePass2').css('border-color', 'black');
			$('button[type="submit"]').prop('disabled', false);
		} else {
			$('#changePass2').css('border-color', 'red');
			$('button[type="submit"]').prop('disabled', true);
		}
	});
});</script>


<jsp:include page="footer.jsp" />