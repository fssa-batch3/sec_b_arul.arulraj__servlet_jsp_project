package in.fssa.technolibrary.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.service.BookService;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/book/delete")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookId = request.getParameter("id");
		int id = Integer.parseInt(bookId);
		BookService bookService = new BookService();
		try {
			bookService.deleteBook(id);
			response.sendRedirect(request.getContextPath()+"/book_list.jsp");
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}
		
	}

}
