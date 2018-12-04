package com.cg.task2.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.task2.entity.Application;

/**
 * Servlet implementation class ValidationServlet
 */
@WebServlet("/ValidationServlet")
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		
		ServletContext sc = this.getServletContext();
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
 		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");

		 System.out.println("welcome");
		Application app = new Application();
		app.setFname(fname);
		app.setLname(lname);
		app.setPhone(phone);
		app.setGender(gender);
		app.setEmail(email);

		if (app.getFname().trim().length() < 4) {
			request.setAttribute("firstname", "First Name should be grater than four letters");
			request.setAttribute("Data", app);
			rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}else if (app.getLname().trim().length() < 4) {
			request.setAttribute("lastname", "Last Name should be grater than four letters");
			request.setAttribute("Data", app);
			rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}else if (!(app.getEmail().matches("[a-z_A-Z0-9]+@+[a-z]+\\.com"))) {
			request.setAttribute("email", "Email should be valid");
			request.setAttribute("Data", app);
			rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}else if (!(app.getPhone().matches("^[6-9][0-9]{9}$"))) {
			request.setAttribute("phone", "Phone Number should be valid");
			request.setAttribute("Data", app);
			rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		} else {
			rd = sc.getRequestDispatcher("/success.jsp");
			
			HashMap<String,Application> appdetails = null;
			appdetails = (HashMap<String,Application>)session.getAttribute("APP");
			if(appdetails==null){
				appdetails = new HashMap<String,Application>();
				session.setAttribute("APP", appdetails);
			}
			appdetails.put(app.getPhone(), app);
			request.setAttribute("APP", appdetails);
			
			rd.forward(request, response);
		}
	}
}
