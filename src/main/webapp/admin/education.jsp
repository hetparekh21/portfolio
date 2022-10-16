<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page isELIgnored = "false" %>
<jsp:include page="header.jsp" />
<%@ page import="servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<%@ page import="servlet.data" %>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="${data.url }" user="${data.user }" password="${data.password }" />
	
<c:if test="${not empty param.id}">

	<sql:update dataSource="${db}" var="count">  
		DELETE FROM skills where id = "${param.id}" ; 
	</sql:update>
	
	<%
	response.sendRedirect("skills.jsp");
	%>

</c:if>

<div class="content pb-0">
	<div class="orders">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<strong>Education</strong>
						<span class="" style="float:right;">
						    <button type="button" class="btn text-decoration-none bg-secondary text-white" data-toggle="modal"
						     data-target="#exampleModal">Add Education</button>
						</span>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table ">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Level</th>
										<th>Category</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									int i = 1;
									%>
									

									<sql:query var="rs" dataSource="${db}">SELECT s.* , c.category_name from skills s , categories c where s.user_id = ${user_id} and s.user_id = c.user_id and s.category = c.id ;</sql:query>

									<c:forEach var="data" items="${rs.rows}">

										<tr>
											<td><%=i++%></td>
											<td><c:out value="${data.skill}"></c:out></td>
											<td><c:out value="${data.level}"></c:out></td>
											<td><c:out value="${data.category_name}"></c:out></td>
											<td>&nbsp;<span class='badge badge-edit'><a
													href='add_skill.jsp?id=${data.id}'>Edit</a></span>&nbsp;<span
												class='badge badge-delete'><a
													href='skills.jsp?id=${data.id}'>Delete</a></span></td>
										</tr>
										<tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="border:0 ;">
        <h5 class="modal-title" id="exampleModalLongTitle">Education
		<button type="button" class="close" data-dismiss="modal">x</button></h5> 
	  </div>
	  <br>
	  <ul style="list-style-type: none;">
		<li><p class="label"><a href="add_education.jsp">Graduation Details</a></p></li>
		<li><p class="label"><a href="add_education.jsp">XII (Senior Secondary) Details</a></p></li>
		<li><p class="label"><a href="add_education.jsp">X (Secondary Details)</a></p></li>
		<li><p class="label"><a href="add_education.jsp">Post Graduation Details</a></p></li>
		<li><p class="label"><a href="add_education.jsp">Diploma Details</a></p></li>
		<li><p class="label"><a href="add_education.jsp">PhD Details</a></p></li>

	  </ul>
	   
      <div class="modal-footer" style="border:0 ;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<style>
.label{
	background-color:  #DFDFDF;
	color: black;
	margin-left: 30px;
	margin-right: 30px;
	padding: 5px;
	border-radius: 4px;
	text-align:"center";	
	font-weight:600;
}

</style>
<jsp:include page="footer.jsp" />  