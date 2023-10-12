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
import in.fssa.technolibrary.model.Category;
import in.fssa.technolibrary.service.CategoryService;
import in.fssa.technolibrary.util.Logger;

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
	CategoryService categoryService = new CategoryService();
	Set<Category> categoryList = null;
	try {
		newCategory.setName(request.getParameter("name"));
		categoryList = categoryService.findAllcategory();
		CategoryService.createCategory(newCategory);
		response.sendRedirect(request.getContextPath()+"/category/list");
	} catch (ValidationException | ServiceException e) {
		Logger.error(e);
		request.setAttribute("error", e.getMessage());
		request.setAttribute("categoryDetails", categoryList);
		RequestDispatcher rd = request.getRequestDispatcher("/category_list.jsp?error=");
		rd.forward(request, response);
	}

}
   
}
