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
import in.fssa.technolibrary.model.Category;
import in.fssa.technolibrary.service.CategoryService;

/**
 * Servlet implementation class GetAllServlet
 */
@WebServlet("/category/list")
public class GetAllCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			CategoryService categoryService = new CategoryService();
			Set<Category> categoryList = categoryService.findAllcategory();
			request.setAttribute("categoryDetails", categoryList);
			RequestDispatcher rd = request.getRequestDispatcher("/category_list.jsp");
			rd.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		

	}

}
