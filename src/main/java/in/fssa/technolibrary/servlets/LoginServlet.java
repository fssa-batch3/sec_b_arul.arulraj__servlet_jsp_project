package in.fssa.technolibrary.servlets;
import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.User;
import in.fssa.technolibrary.service.UserService;
import in.fssa.technolibrary.util.Logger;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.print("mail :" + email);
		String password = request.getParameter("password");
		User u = new User();
		u.setEmail(email);
		try {
			UserService userService = new UserService();
			User user = userService.findByEmail(email);
			
			if (user == null) {
	            throw new ValidationException("User not found");
	        }else if(!BCrypt.checkpw(password, user.getPassword())) {
				throw new ValidationException("Incorrect Password");
			} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			
			}
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", u);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?error=");
			rd.forward(request, response);
		}
		
	}
}