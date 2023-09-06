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

/**
 * Servlet implementation class FindBookByAuthorNameServlet
 */
@WebServlet("/book_list/authorDetails")
public class FindBookByAuthorNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		try {
			String authorNameParam = request.getParameter("authorName");
			BookService bookService = new BookService();
			Set<Book> listOfAuthor = bookService.findByAuthorName(authorNameParam);
			request.setAttribute("authorList", listOfAuthor);
			RequestDispatcher rd = request.getRequestDispatcher("/get_book_by_author.jsp");
			rd.forward(request, response);
		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
