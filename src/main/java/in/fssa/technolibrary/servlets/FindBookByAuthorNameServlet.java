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
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.CategoryService;

/**
 * Servlet implementation class FindBookByAuthorNameServlet
 */
@WebServlet("/book_list/authorDetails")
public class FindBookByAuthorNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BookService bookService = new BookService();
		CategoryService categoryService = new CategoryService();

		Set<Book> bookList = null;
		Set<Category> categoryList = null;
		
		
		try {
			categoryList = categoryService.findAllcategory();
			bookList = bookService.findAllBook();
			
			String authorNameParam = request.getParameter("authorName");
			
			Set<Book> listOfAuthor = bookService.findByAuthorName(authorNameParam);
			request.setAttribute("authorList", listOfAuthor);
			RequestDispatcher rd = request.getRequestDispatcher("/get_book_by_author.jsp");
			rd.forward(request, response);
		} catch (ValidationException | ServiceException e) {
			
			request.setAttribute("bookDetails", bookList);
			request.setAttribute("categoryDetails", categoryList);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/book_list.jsp?error=");
			rd.forward(request, response);
		}
		
	}

}
