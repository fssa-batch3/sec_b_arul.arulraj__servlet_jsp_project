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
import in.fssa.technolibrary.model.Book;
import in.fssa.technolibrary.model.Category;
import in.fssa.technolibrary.model.Publisher;
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.CategoryService;
import in.fssa.technolibrary.service.PublisherService;
import in.fssa.technolibrary.util.Logger;

/**
 * Servlet implementation class CreateBookServlet
 */
@WebServlet("/book/create")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Book newBook = new Book();	
		Set<Category> categoryList =  null;
		Set<Publisher> listOfPublisher = null;
		try {
			
			CategoryService categoryService = new CategoryService();
			categoryList = categoryService.findAllcategory();
			
			PublisherService publisherService = new PublisherService();
			listOfPublisher = publisherService.findAllPublisher();
			
			String cat_name = request.getParameter("category_name");
			int category_id = Integer.parseInt(cat_name);
			String pub_name = request.getParameter("publisher_name");
			int publisher_id = Integer.parseInt(pub_name);
			newBook.setTitle(request.getParameter("title"));
			newBook.setAuthor(request.getParameter("author"));
			newBook.setPrice(Integer.parseInt(request.getParameter("price")));
			newBook.setCategoryId(category_id);
			newBook.setPublisherId(publisher_id);
			newBook.setPublishedDate(request.getParameter("published_date"));

			BookService.createNewBook(newBook);
			response.sendRedirect(request.getContextPath()+"/book/list");
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
			request.setAttribute("categoryDetails", categoryList);
			request.setAttribute("publisherDetails", listOfPublisher);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/add_book.jsp?error=");
			rd.forward(request, response);
		} 

	}
}
