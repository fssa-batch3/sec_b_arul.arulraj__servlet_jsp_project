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
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.CategoryService;

/**
 * Servlet implementation class FindBookByCategoryServlet
 */
@WebServlet("/book_list/categoryDetails")
public class FindBookByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String categoryIdParam = request.getParameter("categoryId");
		int id = Integer.parseInt(categoryIdParam);
		BookService bookService = new BookService();
		CategoryService categoryService = new CategoryService();
		try {
			
			String category = categoryService.findCategoryById(id);
			request.setAttribute("categoryName", category);
			Set<Book> listOfBook = bookService.findBookByCategoryId(id);
			request.setAttribute("categoryDetails", listOfBook);
			RequestDispatcher rd = request.getRequestDispatcher("/get_book_by_category_id.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}
}
