package in.fssa.technolibrary.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.exception.ValidationException;
import in.fssa.technolibrary.model.Order;
import in.fssa.technolibrary.service.OrderService;

/**
 * Servlet implementation class OrderBookServlet
 */
@WebServlet("/book/order")
public class OrderBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Order newOrder = new Order();
		try {
			
			String book_id = request.getParameter("bookId");
			int id = Integer.parseInt(book_id);
			String user_id = request.getParameter("userId");
			int id2 = Integer.parseInt(user_id);
			String address = request.getParameter("address");
			
			// Create a Date object to represent the current date and time
			Date currentDate = new Date();

			// Define the desired date format (yyyy-MM-dd for date-only format)
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			// Format the date as a string (date-only format)
			String formattedDate = dateFormat.format(currentDate);
			
			newOrder.setAddress(address);
			newOrder.setBook_id(id);
			newOrder.setUser_id(id2);
			newOrder.setStatus("Ordered");
			newOrder.setOrder_date(formattedDate);
			

			OrderService.createNewOrder(newOrder);
			response.sendRedirect(request.getContextPath()+"/user/profile");
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		} 

	}

}
