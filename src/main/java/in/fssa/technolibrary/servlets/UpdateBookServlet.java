package in.fssa.technolibrary.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.model.Book;
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.util.Logger;

/**
 * Servlet implementation class UpdateTitleAndDateServlet
 */
@WebServlet("/book/update")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book = new Book();
		
		try {
			String title = request.getParameter("title");
			String date = request.getParameter("published_date");
			String author = request.getParameter("author");
			String pub_name = request.getParameter("publisher_name");
			System.out.println(pub_name);
			int publisher_id = Integer.parseInt(pub_name);
			String cat_name = request.getParameter("category_name");
			System.out.println(cat_name);
			int category_id = Integer.parseInt(cat_name);
			String rate = request.getParameter("price");
			int price = Integer.parseInt(rate);
			
			book.setAuthor(author);
			book.setPublisherId(publisher_id);
			book.setCategoryId(category_id);
			book.setPrice(price);
			book.setTitle(title);
			book.setPublishedDate(date);
			
			String stringId = request.getParameter("id");
			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				BookService.updateBook(id, book);
				response.sendRedirect(request.getContextPath()+"/book/list");
			}
		} catch (ServiceException e) {
			Logger.error(e);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/edit_book.jsp?error=");
			rd.forward(request, response);
		}
	}

}
