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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/user/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		User userDetail = (User) request.getSession().getAttribute("user");
		User returnUser = null;
		UserService userService = new UserService();
		try {
			returnUser = userService.findByEmail(userDetail.getEmail());
			user.setName(returnUser.getName());
			user.setEmail(returnUser.getEmail());
			String image = request.getParameter("imageUrl");
			if(image != null) {
			user.setImage(image);
			}
			user.setPassword(returnUser.getPassword());
//			String phoneNumber = returnUser.getPhoneNumber();
//			long number = Long.parseLong(phoneNumber);
			user.setPhoneNumber(returnUser.getPhoneNumber());
			
			if (returnUser.getId() > 0) {
				userService.updateUser(returnUser.getId(), user);
				response.sendRedirect(request.getContextPath()+"/user/profile");
			}
		}  catch ( ValidationException | ServiceException e) {
		    Logger.error(e);
		    request.setAttribute("userDetails", returnUser);
		    request.setAttribute("error", e.getMessage());
		    RequestDispatcher rd = request.getRequestDispatcher("/user/profile");
		    rd.forward(request, response);
		} 


	}

}
