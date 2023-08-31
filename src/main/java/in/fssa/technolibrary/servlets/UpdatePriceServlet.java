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
 * Servlet implementation class UpdatePriceServlet
 */
@WebServlet("/book/update/price")
public class UpdatePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Book book = new Book();
		try {
			String rate = request.getParameter("price");
			int price = Integer.parseInt(rate);
			book.setPrice(price);
			
			String stringId = request.getParameter("id");
			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				BookService.updateBookPrice(id, book);
				response.sendRedirect(request.getContextPath()+"/book_list");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
