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
import in.fssa.technolibrary.model.Book;
import in.fssa.technolibrary.model.Category;
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.CategoryService;

/**
 * Servlet implementation class BookCreationServlet
 */
@WebServlet("/book/list")
public class GetAllBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookService bookService = new BookService();
			try {
				Set<Book> bookList = bookService.findAllBook();
				CategoryService categoryService = new CategoryService();
				Set<Category> categoryList = categoryService.findAllcategory();
				request.setAttribute("bookDetails", bookList);
				request.setAttribute("categoryDetails", categoryList);
	    		RequestDispatcher rd = request.getRequestDispatcher("/book_list.jsp");
	    		rd.forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
			}
	}

}
