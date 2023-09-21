package in.fssa.technolibrary.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.Book;
import in.fssa.technolibrary.model.User;
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.CategoryService;
import in.fssa.technolibrary.service.UserService;
/**
 * Servlet implementation class NewOrder
 */
@WebServlet("/order/new")
public class NewOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
			
			HttpSession session = request.getSession();
        	User user = (User) session.getAttribute("user");
        	
    	    UserService userService = new UserService();
			User userDetail = userService.findByEmail(user.getEmail());
			request.setAttribute("UserDetail", userDetail);
			
		 String bookIdParam = request.getParameter("id");
 		if (bookIdParam != null && !bookIdParam.isEmpty()) {
 	        int id = Integer.parseInt(bookIdParam);
			Book book = BookService.findBookById(id);
			CategoryService categoryService = new CategoryService();
			String category = categoryService.findCategoryById(book.getCategoryId());
			request.setAttribute("CategoryDetail", category);
			request.setAttribute("BookDetail", book);
		 
				RequestDispatcher rd = request.getRequestDispatcher("/order.jsp");
				rd.forward(request, response);
 		}} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}
		
	 }
	 }
