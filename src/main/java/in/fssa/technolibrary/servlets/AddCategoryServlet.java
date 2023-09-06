package in.fssa.technolibrary.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.Category;
import in.fssa.technolibrary.service.CategoryService;

/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/category/create")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
	Category newCategory= new Category();
	try {
		newCategory.setName(request.getParameter("name"));
		
		CategoryService.createCategory(newCategory);
		response.sendRedirect(request.getContextPath()+"/category/list");
	} catch (ValidationException e) {
		e.printStackTrace();
	} catch (ServiceException e) {
		e.printStackTrace();
	}

}
   
}
