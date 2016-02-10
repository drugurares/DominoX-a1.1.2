package org.game.functions;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servletPrint
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/servletPrint" })
public class servletPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected String message ;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servletPrint(String msg) {
		message=msg;
		
		
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		request.setAttribute("message", message); // This will be available as
													// ${message}
		request.getRequestDispatcher("/WEB-INF/page.jsp").forward(request, response);
	}

}
