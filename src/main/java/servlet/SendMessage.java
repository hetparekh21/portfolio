package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMessage
 */
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Connection c = data.connect();
            
			PreparedStatement s;
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDateTime now = LocalDateTime.now();

			s = c.prepareStatement("INSERT INTO messages(name_,subject_, email, message,date_, user_id) VALUES (?,?, ?, ?, ?, ?)");

			s.setString(1, request.getParameter("name"));
			s.setString(2, request.getParameter("subject"));
			s.setString(3, request.getParameter("email"));
			s.setString(4, request.getParameter("message"));
			s.setString(5, dtf.format(now).toString());
			s.setInt(6, Integer.parseInt(request.getParameter("user_id")));

			int x = s.executeUpdate();

			if (x == 0) {
				System.out.println("values not inserted");
			} else {
				System.out.println("values inserted successfull");
			}

			response.sendRedirect("" + request.getParameter("url"));
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
