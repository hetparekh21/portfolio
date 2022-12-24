package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reset_password
 */
public class reset_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reset_password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext s = getServletContext();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		user u = (user)s.getAttribute("user");
		
		String email = u.email;
		String hobby = request.getParameter("hobby");
		String nickname = request.getParameter("nickname");
		String DOB = request.getParameter("dob");
		
//		System.out.println("Details are "+DOB+" "+email+" "+nickname+" "+hobby);
		
		user p = data.get_person(email, hobby , nickname , DOB);
		
		if(data.validate(p)) {
			
//			System.out.println("validated");
			request.getServletContext().setAttribute("user_id", p.user_id);
//			request.getRequestDispatcher("admin/users.jsp").forward(request, response);
			response.sendRedirect("admin/users.jsp");
			
		}else {
			
//			System.out.println("not validated");
			
			out.append("<center><h2 style=\"color: red;\">warning : Data doesn't match</h2></center>");
			//request.getRequestDispatcher("admin/forgot_password.jsp").include(request, response);
			response.sendRedirect("admin/forgot_password.jsp");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
