package in.fssa.technolibrary.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.technolibrary.exception.ServiceException;
import in.fssa.technolibrary.model.Order;
import in.fssa.technolibrary.service.OrderService;

/**
 * Servlet implementation class UpdateOrderServlet
 */
@WebServlet("/order/update")
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Define your desired date format
		String formattedDate = currentDate.format(formatter); // Format the current date as a string

		Order updateOrder = new Order();
		
		try {
			String status = request.getParameter("status");
			
			updateOrder.setStatus(status);
			updateOrder.setLast_update_on(formattedDate);
			
			String stringId = request.getParameter("bookId");
			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				OrderService.updateStatus(id, updateOrder);
				response.sendRedirect(request.getContextPath()+"/order/list");
			}
			
		}catch (ServiceException e) {
			e.printStackTrace();
		}
		
		
	}

}
