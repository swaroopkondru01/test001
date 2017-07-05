package com.wlas.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wlas.conn.ConnectionUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession sess=request.getSession();
		
		String name = request.getParameter("firstName");
		String passsword=request.getParameter("pwd");
		String lastName = request.getParameter("lastName");
		String userId = request.getParameter("userId");
		String role=request.getParameter("role");
		String phone = request.getParameter("phone");
		String email = request.getParameter("emailID");
		
		String query="";
		try
		
		{
		
		// create a mysql database connection
	     /* String myDriver = "com.mysql.jdbc.Driver";
	      String myUrl = "jdbc:mysql://localhost/wlas";
	      Class.forName(myDriver);*/
	      Connection conn = ConnectionUtils.getConnection();
	    
	      
	      if(role.equalsIgnoreCase("3"))
			{
	    	   query = "INSERT INTO user (firstname, lastname, password, role, phonenumber, email, userid,status,uniquepassword)"
	  	      		+ "VALUES (?, ?, ?, ?, ?, ?, ?,?,?)";
			}
	      else{
	    	   query = "INSERT INTO user (firstname, lastname, password, role, phonenumber, email, userid,status)"
	  	      		+ "VALUES (?, ?, ?, ?, ?, ?, ?,?)";
	      }
	      
	      // the mysql insert statement
	   

	      // create the mysql insert preparedstatement
	      PreparedStatement preparedStmt = conn.prepareStatement(query);
	      preparedStmt.setString (1, name);
	      preparedStmt.setString (2, lastName);
	      preparedStmt.setString (3, passsword);
	      preparedStmt.setString (4, role);
	      preparedStmt.setString (5, phone);
	      preparedStmt.setString(6, email);
	      preparedStmt.setString(7, userId);
	      preparedStmt.setString(8, "A");
	      if(role.equalsIgnoreCase("3"))
			{
	    	  preparedStmt.setString(9, "db@admin");
			}
	      

	      // execute the preparedstatement
	      preparedStmt.execute();
	      
	      ConnectionUtils.closeQuietly(conn);
	    }
	    catch (Exception e)
	    {
	      System.err.println("Got an exception!");
	      System.err.println(e.getMessage());
	      e.printStackTrace();
	    }
		
		if(role.equalsIgnoreCase("1"))
		{
			sess.setAttribute("dispResName", "Plantiff");
		}
		
		else if(role.equalsIgnoreCase("2"))
		{
			sess.setAttribute("dispResName", "Attorney");
		}
		else if(role.equalsIgnoreCase("3"))
		{
			sess.setAttribute("dispResName", "Admin");
		}


		response.sendRedirect("registration_result.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
