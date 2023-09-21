package in.fssa.technolibrary.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.Publisher;
import in.fssa.technolibrary.service.PublisherService;

/**
 * Servlet implementation class AddPublisherServlet
 */
@WebServlet("/publisher/create")
public class AddPublisherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Publisher newPublisher = new Publisher();
		try {
			newPublisher.setName(request.getParameter("name"));
			
			PublisherService.createPublisher(newPublisher);
			response.sendRedirect(request.getContextPath()+"/publisher/list");
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}

}
