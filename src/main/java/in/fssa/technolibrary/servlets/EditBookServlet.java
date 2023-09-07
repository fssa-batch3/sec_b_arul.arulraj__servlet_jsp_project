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
import in.fssa.technolibrary.model.Category;
import in.fssa.technolibrary.model.Publisher;
import in.fssa.technolibrary.service.CategoryService;
import in.fssa.technolibrary.service.PublisherService;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/book_list/edit")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		try {
			CategoryService categoryService = new CategoryService();
			Set<Category> categoryList = categoryService.findAllcategory();
			request.setAttribute("categoryDetails", categoryList);
			
			PublisherService publisherService = new PublisherService();
			Set<Publisher> listOfPublisher = publisherService.findAllPublisher();
			
			request.setAttribute("publisherDetails", listOfPublisher);
			RequestDispatcher rd = request.getRequestDispatcher("/edit_book.jsp");
			rd.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}

}
