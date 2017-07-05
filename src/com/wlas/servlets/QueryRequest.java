package com.wlas.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wlas.conn.ConnectionUtils;

/**
 * Servlet implementation class QueryRequest
 */
@WebServlet("/QueryRequest")
public class QueryRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String type=request.getParameter("type");
		String nameofAtt=request.getParameter("nameofAtt");
		HttpSession session=request.getSession();
		try{
			  Connection conn = ConnectionUtils.getConnection();
			    
		      // the mysql insert statement
		      String query = "select * from attorneylist where type=? and firstname=?;";
		      		

		      // create the mysql insert preparedstatement
		      PreparedStatement preparedStmt = conn.prepareStatement(query);
		      preparedStmt.setString (1, type);
		      preparedStmt.setString (2, nameofAtt);
		     

		      // execute the preparedstatement
		       ResultSet rs= preparedStmt.executeQuery();
		       
		      if(rs.next())
		      {
		    	  session.setAttribute("firstname", rs.getString("firstname"));
		    	  session.setAttribute("mail", rs.getString("mailid"));
		    	  session.setAttribute("Address", rs.getString("address"));
		    	  session.setAttribute("exp", rs.getString("exp"));
		      }
		      
		      ConnectionUtils.closeQuietly(conn);
		    }
		    catch (Exception e)
		    {
		      System.err.println("Got an exception!");
		      System.err.println(e.getMessage());
		      e.printStackTrace();
		    }
		
		if(request.getParameter("actionval").equalsIgnoreCase("nonlogged"))
				response.sendRedirect("QueryRequest_result.jsp");
		else
			response.sendRedirect("QueryRequest_logged_result.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
