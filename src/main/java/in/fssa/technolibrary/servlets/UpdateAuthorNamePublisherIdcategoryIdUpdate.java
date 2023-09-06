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
 * Servlet implementation class UpdateAuthorNamePublisherIdcategoryIdUpdate
 */
@WebServlet("/book/update/AuthorNamePublisherIdcategoryId")
public class UpdateAuthorNamePublisherIdcategoryIdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Book book = new Book();
		try {
			String author = request.getParameter("author");
			String pub_name = request.getParameter("publisher_name");
			System.out.println(pub_name);
			int publisher_id = Integer.parseInt(pub_name);
			String cat_name = request.getParameter("category_name");
			System.out.println(cat_name);
			int category_id = Integer.parseInt(cat_name);
			
			book.setAuthor(author);
			book.setPublisherId(publisher_id);
			book.setCategoryId(category_id);

			String stringId = request.getParameter("id");
			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				BookService.updateAuthorNamePublisherIdCategoryId(id, book);
				response.sendRedirect(request.getContextPath() + "/book/list");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}
}
