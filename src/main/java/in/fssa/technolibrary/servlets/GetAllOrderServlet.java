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
 * Servlet implementation class GetAllOrderAervlet
 */
@WebServlet("/order/list")
public class GetAllOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			try {
	        	
				OrderService orderService = new OrderService();
				Set<Order> orderdetails = orderService.findAllOrder();
				request.setAttribute("orders", orderdetails);
				System.out.print(orderdetails);
				
				
				List<User> users = new ArrayList<>();
				UserService userService = new UserService();
				
				for (Order order : orderdetails) {
					int userId = order.getUser_id();
					User userDetails = userService.findByUserId(userId);
					users.add(userDetails);
				}
				request.setAttribute("UserDetail", users);
				
				
				List<Book> books = new ArrayList<>();

				for (Order order : orderdetails) {
				    int bookId = order.getBook_id();
				    Book bookDetails = BookService.findBookById(bookId);
				    books.add(bookDetails);
				}
				request.setAttribute("BookDetail", books);
	    		
				
	    		RequestDispatcher rd = request.getRequestDispatcher("/order_list.jsp");
	    		rd.forward(request, response);
			} catch (ServiceException | ValidationException e) {
				e.printStackTrace();
			}
	}

}
