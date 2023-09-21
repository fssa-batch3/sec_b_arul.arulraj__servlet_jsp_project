package in.fssa.technolibrary.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
import in.fssa.technolibrary.model.Order;
import in.fssa.technolibrary.model.User;
import in.fssa.technolibrary.service.BookService;
import in.fssa.technolibrary.service.OrderService;
import in.fssa.technolibrary.service.UserService;

/**
 * Servlet implementation class FindUserByEmailServlet
 */
@WebServlet("/user/profile")
public class FindUserByEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	        try {
	        	HttpSession session = request.getSession();
	        	User user = (User) session.getAttribute("user");
	    		if (user != null && user.getEmail() != null && !user.getEmail().isEmpty()) {
	    			
	    	    UserService userService = new UserService();
				User userDetail = userService.findByEmail(user.getEmail());
				request.setAttribute("UserDetail", userDetail);
				
				OrderService orderService = new OrderService();
				Set<Order> orderdetails = orderService.findAllOrderByUserId(userDetail.getId());
				request.setAttribute("orderDetails", orderdetails);
				System.out.print(orderdetails);
				
				List<Book> books = new ArrayList<>();

				for (Order order : orderdetails) {
				    int bookId = order.getBook_id();
				    Book bookDetails = BookService.findBookById(bookId);
				    books.add(bookDetails);
				}
				request.setAttribute("BookDetail", books);
				
				RequestDispatcher rd = request.getRequestDispatcher("/user_profile.jsp");

				rd.forward(request, response);
			}} catch (ValidationException | ServiceException e) {
				e.printStackTrace();
			}
		
	}

}
