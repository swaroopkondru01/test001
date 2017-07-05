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

import org.hibernate.Session;

import com.wlas.conn.ConnectionUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		 HttpSession sess= request.getSession();
	        
	        
	        String action=request.getParameter("action");
	        String redirectpage=null;
	        
	        try {
	            Connection conn = ConnectionUtils.getConnection();
	            if (action != null && !action.isEmpty()) {
	                
	                if(action.equalsIgnoreCase("dbuser"))
	                {
	                    
	                    String username=(String) sess.getAttribute("uname");
	                    String uniquepwd = request.getParameter("pwd");
	                    
	                    // the mysql insert statement
	                    String query = "select * from user where userid=? and uniquepassword=?;";
	                    // create the mysql insert preparedstatement
	                    PreparedStatement preparedStmt = conn.prepareStatement(query);
	                    preparedStmt.setString(1, username);
	                    preparedStmt.setString(2, uniquepwd);
	                    ResultSet rs = preparedStmt.executeQuery();
	                    if (rs.next()) {
	                            redirectpage = "dbAdmin.jsp";
	                    }
	                    else {
	                        sess.setAttribute("error", "Invalid user name or password");
	                        redirectpage = "Login.jsp";

	 }
	                }
	            } else {
	                sess.invalidate();
	                sess=request.getSession();
	                
	                String username = request.getParameter("username");
	                String pwd = request.getParameter("pwd");
	                sess.removeAttribute("error");
	                // the mysql insert statement
	                String query = "select * from user where userid=? and password=?;";
	                // create the mysql insert preparedstatement
	                PreparedStatement preparedStmt = conn.prepareStatement(query);
	                preparedStmt.setString(1, username);
	                preparedStmt.setString(2, pwd);
	                // execute the preparedstatement
	                ResultSet rs = preparedStmt.executeQuery();
	                if (rs.next()) {
	                    sess.setAttribute("uname", username);
	                    sess.setAttribute("loginName", username);
	                    if (rs.getString("role").equalsIgnoreCase("3"))
	                        redirectpage = "dbAdmin_auth.jsp";
	                    else if (rs.getString("role").equalsIgnoreCase("1"))
	                    {
	                    	sess.setAttribute("disp", "1");
	                        redirectpage = "Home.jsp";
	                    }
	                    else
	                    {
	                    	sess.setAttribute("disp", "2");
	                    	redirectpage = "Home.jsp";
	                    }
	                        
	                }
	                else {
	                    sess.setAttribute("error", "Invalid user name or password");
	                    redirectpage = "Login.jsp";
	                }
	                ConnectionUtils.closeQuietly(conn);
	            }
	        } catch (Exception e) {
	            System.err.println("Got an exception!");
	            System.err.println(e.getMessage());
	            e.printStackTrace();
	        }
	        
	        response.sendRedirect(redirectpage);
		/*HttpSession sess= request.getSession();
		sess.invalidate();
		sess=request.getSession();
		String username = request.getParameter("username");
		String pwd= request.getParameter("pwd");
		String redirectpage=null;
		
		sess.removeAttribute("error");
		try{
			  Connection conn = ConnectionUtils.getConnection();
			    
		      // the mysql insert statement
		      String query = "select * from user where userid=? and password=?;";
		      		

		      // create the mysql insert preparedstatement
		      PreparedStatement preparedStmt = conn.prepareStatement(query);
		      preparedStmt.setString (1, username);
		      preparedStmt.setString (2, pwd);
		     

		      // execute the preparedstatement
		       ResultSet rs= preparedStmt.executeQuery();
		       
		       if (rs.next())
		       {
		    	   
		    	   sess.setAttribute("uname", username);
		    	   sess.setAttribute("loginName", username);
		    	   if(rs.getString("role").equalsIgnoreCase("3"))
		    		   redirectpage="dbAdmin.jsp";
		    	   else if(rs.getString("role").equalsIgnoreCase("1"))
		    		   redirectpage="Home.jsp";
		    	   else
		    		   redirectpage="Home.jsp";
		    	   
		       }
		    	   
		       else
		       {
		    	   sess.setAttribute("error", "Invalid user name or password");
		    	   redirectpage="Login.jsp";
		       }
		      
		      ConnectionUtils.closeQuietly(conn);
		    }
		    catch (Exception e)
		    {
		      System.err.println("Got an exception!");
		      System.err.println(e.getMessage());
		      e.printStackTrace();
		    }
		
		response.sendRedirect(redirectpage);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
