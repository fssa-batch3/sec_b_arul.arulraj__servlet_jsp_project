package in.fssa.technolibrary.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.User;
import in.fssa.technolibrary.service.UserService;
import in.fssa.technolibrary.util.Logger;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/user/create")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
	User user = new User();
	try {
		user.setName(request.getParameter("username"));
		user.setEmail(request.getParameter("useremail"));
		user.setPassword(request.getParameter("userpassword"));
		String phoneNumber = request.getParameter("userphone");
		long number = Long.parseLong(phoneNumber);
		user.setPhoneNumber(number);
		UserService userService = new UserService();
		userService.createUser(user);
		response.sendRedirect(request.getContextPath() + "/user/login");
	} catch ( ServiceException | ValidationException e) {
		Logger.error(e);
		request.setAttribute("userDetail", user);
		request.setAttribute("error", e.getMessage());
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?error=");
		rd.forward(request, response);	
	}
	}

}
