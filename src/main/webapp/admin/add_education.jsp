<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

                <%@ page import="servlet.data" %>
                    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="${data.url }"
                        user="${data.user }" password="${data.password }" />
                    <jsp:include page="header.jsp" />

                    <c:if test="${pageContext.request.method=='POST'}">
                        <%int s_date=Integer.parseInt(request.getParameter("s_date")); int
                            e_date=Integer.parseInt(request.getParameter("e_date")); if (e_date>=s_date) {

                            %>

                            <c:choose>

                                <c:when test="${param.execute eq \" Submit\"}">
                                    <sql:update dataSource="${db}" var="count">
                                        INSERT INTO skills(skill , user_id , category, level) VALUES ("
                                        <%=request.getParameter("title")%>", ${user_id} ,
                                            (select c.id from categories c where category_name = "<%=
                                                request.getParameter("skills") %>" and c.user_id = ${user_id}) ,
                                                <%=request.getParameter("level")%> );
                                    </sql:update>

                                </c:when>

                                <c:when test="${param.execute eq \" Update\"}">

                                    <sql:update dataSource="${db}" var="count">
                                        UPDATE skills SET
                                        category = (select id from categories where category_name = "
                                        <%=request.getParameter("skills")%>" and user_id = ${user_id}),
                                            skill= "<%=request.getParameter("title")%>",
                                                level= <%=request.getParameter("level")%>
                                                    where user_id = ${user_id} and id = "
                                                    <%=request.getParameter("save_education")%>";
                                    </sql:update>

                                </c:when>

                            </c:choose>

                            <% } response.sendRedirect("add_education.jsp"); %>

                    </c:if>

                    <c:choose>

                        <c:when test="${not empty param.id}">

                            <sql:query var="skill" dataSource="${db}">SELECT s.* , category_name from skills s ,
                                categories c where s.id = "${param.id}" and s.user_id = ${user_id} and c.id = s.category
                                ;</sql:query>
                            <c:set var="level" value="${skill.rows[0].level}"></c:set>
                            <c:set var="skill_name" value="${skill.rows[0].skill}"></c:set>
                            <c:set var="category_name" value="${skill.rows[0].category_name}"></c:set>

                            <c:set var="page_name" value="Edit Education"></c:set>
                            <c:set var="submit_button" value="Update"></c:set>

                        </c:when>
                        <c:otherwise>

                            <c:set var="page_name" value="Add Education"></c:set>
                            <c:set var="submit_button" value="Submit"></c:set>

                        </c:otherwise>

                    </c:choose>


                    <div class="content pb-0">
                        <div class="animated fadeIn">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong> ${page_name} </strong>
                                        </div>
                                        <form method="post" action="add_education.jsp" id="editForm">
                                            <input type="hidden" name="execute" value="${submit_button}">
                                            <input type="hidden" name="save_education" value="${param.id}">
                                            <div class="card-body card-block">
                                                <div class="form-group">

                                                    <sql:query var="rs" dataSource="${db}">SELECT * from categories
                                                        where user_id = ${user_id} ;</sql:query>
                                                    <div class="form-group">
                                                        <label for="Graduation" class=" form-control-label"
                                                            style="font-size: 10pt;">Graduation Status</label><br>

                                                        <!-- get data and fill in the options -->
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status"
                                                                value="pursuing">
                                                            <label class="form-check-label small"
                                                                for="inlineRadio1">pursuing</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status"
                                                                value="completed">
                                                            <label class="form-check-label small"
                                                                for="inlineRadio2">completed</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-6">
                                                                <label for="start">start Year</label>
                                                                <select class="form-control" id="s_date" name="s_date">
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="end">end Year</label>
                                                                <select class="form-control" id="e_date" name="e_date">
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="degree" class=" form-control-label">Degree</label>
                                                        <input type="text" name="degree" class="form-control"
                                                            value="${skill_name}" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="stream" class=" form-control-label">Stream</label>
                                                        <input type="text" name="stream" class="form-control"
                                                            value="${level}" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="form-row">
                                                            <div class="form-group col-md-6">
                                                                <label for="performance">performance</label>
                                                                <select class="form-control" id="type" name="type">
                                                                    <option value="SGPA">SGPA</option>
                                                                    <option value="CGPA">CGPA</option>
                                                                    <option value="Percentage">Percentage</option>
                                                                    <option value="Grade">Grade</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label style="visibility: hidden;">sa</label>
                                                                <input type="text" name="performance" class="form-control"
                                                                value="${level}" required>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <c:choose>

                                                        <c:when test="${not empty param.id}">

                                                            <button id="payment-button" name="submit" type="submit"
                                                                class="btn btn-lg btn-info btn-block" onclick="check()">
                                                                <span id="payment-button-amount">Update</span>
                                                            </button>

                                                        </c:when>

                                                        <c:when test="${empty param.id}">
                                                            <button id="payment-button" name="submit" type="submit"
                                                                class="btn btn-lg btn-info btn-block" onclick="check()">
                                                                <span id="payment-button-amount">Submit</span>
                                                            </button>

                                                        </c:when>

                                                    </c:choose>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossorigin="anonymous"></script>
                    <script>
                        let s_drop = document.getElementById('s_date');
                        let e_drop = document.getElementById('e_date');

                        let currentYear = new Date().getFullYear();
                        let earliestYear = 1970;

                        while (currentYear >= earliestYear) {
                            let dateOption = document.createElement('option');
                            dateOption.text = currentYear;
                            dateOption.value = currentYear;
                            s_drop.add(dateOption);
                            currentYear -= 1;
                        }
                        let currentYear2 = new Date().getFullYear();
                        let earliestYear2 = 1970;


                        while (currentYear2 >= earliestYear2) {
                            let dateOption = document.createElement('option');
                            dateOption.text = currentYear2;
                            dateOption.value = currentYear2;
                            e_drop.add(dateOption);
                            currentYear2 -= 1;
                        }

                        function check() {
                            var s_date = $('#s_date').val();
                            var e_date = $('#e_date').val();

                            // console.log(s_date)
                            // console.log(e_date)
                            if (e_date < s_date) {
                                alert("end date must be greater than or equal to start date")
                            }
                        }

                    </script>

                    <!-- FOOTER -->
                    <jsp:include page="footer.jsp" />