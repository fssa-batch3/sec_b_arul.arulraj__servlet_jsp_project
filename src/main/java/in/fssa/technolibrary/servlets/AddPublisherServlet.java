package in.fssa.technolibrary.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.Publisher;
import in.fssa.technolibrary.service.PublisherService;
import in.fssa.technolibrary.util.Logger;

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
		PublisherService publisherService = new PublisherService();
		Set<Publisher> listOfPublisher = null;
		
		try {
			newPublisher.setName(request.getParameter("name"));
			listOfPublisher = publisherService.findAllPublisher();
			PublisherService.createPublisher(newPublisher);
			response.sendRedirect(request.getContextPath()+"/publisher/list");
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
			request.setAttribute("publisherDetails", listOfPublisher);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/publisher_list.jsp?error=");
			rd.forward(request, response);
		}

	}

}
