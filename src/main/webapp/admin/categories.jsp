<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<jsp:include page="header.jsp" />
<%@ page import="servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="servlet.data"%>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="${data.url }" user="${data.user }" password="${data.password }" />

<c:if test="${pageContext.request.method=='POST'}">

	<c:if test="${not empty param.update}">

		<c:out value="${param.update}"></c:out>

		<sql:update dataSource="${db}" var="count">  
			UPDATE categories set category_name = "<%=request.getParameter("category_name")%>" where user_id = ${user_id} and id = ${param.update} ;
		</sql:update>

	</c:if>

	<c:if test="${empty param.update}">

		<c:out value="${param.update}"></c:out>

		<sql:update dataSource="${db}" var="count">  
			INSERT INTO categories(category_name ,user_id ) VALUES( "<%=request.getParameter("category_name")%>" , ${user_id});
		</sql:update>

	</c:if>

	<%
	response.sendRedirect("categories.jsp");
	%>

</c:if>


<c:if test="${not empty param.id}">

	<sql:update dataSource="${db}" var="count">  
		DELETE FROM categories where id = ${param.id} ;
	</sql:update>

	<%
	response.sendRedirect("categories.jsp");
	%>

</c:if>

<form method="post" action="categories.jsp" id="editForm">

	<div class="card-body card-block">
		<div class="container mt-3">
			<label for="contact" class=" form-control-label">Add Category</label>
			<div class="input-group mb-3">
				<input type="text" name="category_name" id="category_name"\\
					class="form-control" placeholder="Add Category" required> <input
					type="hidden" name="update" id="update">
					
					<button type="button" class="close" aria-label="Close"
						style="display: none;font-size: 32px;width: 40px" id="cancel" onclick='cancel_()'>
						<span aria-hidden="true">&times;</span>
					</button>

				<div class="input-group-append">
					<button id="add_category" name="submit" type="submit"
						class="btn bg-secondary text-white">
						<span>Add Category</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</form>

<div class="content pb-0">
	<div class="orders">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<h4 class="box-title">Categories</h4>
						<h4 class="box-link">
							<!-- <a href="manage_plant.php">Add category</a> -->
						</h4>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table ">
								<thead>
									<tr>
										<th>Title</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<sql:query var="rs" dataSource="${db}">select * from categories c  where c.user_id = ${user_id} ;</sql:query>
									<c:forEach var="data" items="${rs.rows}">

										<tr>
											<td><c:out value="${data.category_name}"></c:out></td>
											<td>&nbsp;
												<button class='badge badge-edit'
													onclick="edit('${data.id}','${data.category_name}')">Edit</button>&nbsp;<span
												class='badge badge-delete'><a
													href='categories.jsp?id=${data.id}'>Delete</a></span>
											</td>
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

<script>
	function edit(category_id, category_name) {

		// set visibility to visible
		document.getElementById("cancel").style.display = "block";

		// set the category name in the input field
		document.getElementById("category_name").value = category_name;
		// set the category id in the hidden input field
		document.getElementById("update").value = category_id;
		// change the Add Category Button Text
		document.getElementById("add_category").innerHTML = "Update Category";

	}

	function cancel_() {

		// set visibility to hidden
		document.getElementById("cancel").style.display = "none";

		// set the category name in the input field
		document.getElementById("category_name").value = "";
		// set the category id in the hidden input field
		document.getElementById("update").value = "";
		// change the Add Category Button Text
		document.getElementById("add_category").innerHTML = "Add Category";

	}
</script>

<jsp:include page="footer.jsp" />
