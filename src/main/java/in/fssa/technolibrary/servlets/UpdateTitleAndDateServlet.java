package in.fssa.technolibrary.servlets;

import java.io.IOException;
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
 * Servlet implementation class UpdateTitleAndDateServlet
 */
@WebServlet("/book/update/titleandpublisheddate")
public class UpdateTitleAndDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book = new Book();
		try {
			String title = request.getParameter("title");
			String date = request.getParameter("published_date");
			book.setTitle(title);
			book.setPublishedDate(date);
			
			String stringId = request.getParameter("id");
			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				BookService.updateTitleAndDate(id, book);
				response.sendRedirect(request.getContextPath()+"/book/list");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
