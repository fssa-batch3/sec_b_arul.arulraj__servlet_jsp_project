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
import in.fssa.technolibrary.model.Book;
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.CategoryService;
import in.fssa.technolibrary.service.PublisherService;

/**
 * Servlet implementation class FindBookByIdServlet
 */
@WebServlet("/book_list/details")
public class FindBookByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		
	        try {
	        	String bookIdParam = request.getParameter("id");
	    		if (bookIdParam != null && !bookIdParam.isEmpty()) {
	    	        int id = Integer.parseInt(bookIdParam);
				Book book = BookService.findBookById(id);
				request.setAttribute("BookDetail", book);
				PublisherService publisherService = new PublisherService();
				String publisher =  publisherService.findPublisherById(book.getPublisherId());
				request.setAttribute("PublisherDetail", publisher);
				CategoryService categoryService = new CategoryService();
				String category =  categoryService.findCategoryById(book.getCategoryId());
				request.setAttribute("CategoryDetail", category);
				RequestDispatcher rd = request.getRequestDispatcher("/get_book_by_id.jsp");
				rd.forward(request, response);
			}} catch (ServiceException | ValidationException e) {
				e.printStackTrace();
			}
		
	}

}
