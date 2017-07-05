package com.wlas.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wlas.conn.ConnectionUtils;
import com.wlas.pojo.UserDetails;

/**
 * Servlet implementation class UserUpdate
 */
@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action=request.getParameter("action");
		HttpSession sess= request.getSession();
			try {
				
				 Connection conn = ConnectionUtils.getConnection();
				
				if(action!=null && !action.isEmpty()){
				   
					if(action.equalsIgnoreCase("update"))
					{
						String id= request.getParameter("id");
						 String query1 = "select * from user where id=? ;";
						PreparedStatement preparedStmt1 = conn.prepareStatement(query1);
						preparedStmt1.setString(1, id);
						ResultSet rs=preparedStmt1.executeQuery();
						if(rs.next())
						{
							sess.setAttribute("firstname", rs.getString("firstname"));
							sess.setAttribute("lastname", rs.getString("lastname"));
							sess.setAttribute("uname", rs.getString("userid"));
							sess.setAttribute("role", rs.getString("role"));
							sess.setAttribute("phone", rs.getString("phonenumber"));
							sess.setAttribute("emailID", rs.getString("email"));
						}
						
						response.sendRedirect("userdtlsUpdate.jsp");
					}
					
					else if (action.equalsIgnoreCase("save")){
						String name = request.getParameter("firstName");
						String lastName = request.getParameter("lastName");
						String userId = (String) sess.getAttribute("uname");
						String role=(String) sess.getAttribute("role");
						String phone = request.getParameter("phone");
						String email = request.getParameter("emailID");
						
						String query2 = "update user set firstname=?,lastname=?,phonenumber=?,email=?,status=? where userid=?;";
						PreparedStatement preparedStmt2 = conn.prepareStatement(query2);
						preparedStmt2.setString(1, name);
						preparedStmt2.setString(2, lastName);
						preparedStmt2.setString(3, phone);
						preparedStmt2.setString(4, email);
						preparedStmt2.setString(5, "U");
						preparedStmt2.setString(6, userId);
						preparedStmt2.executeUpdate();
						sess.setAttribute("updateResult", "User got Updated Successfully");
						response.sendRedirect("userUpdateResult.jsp");
					}
					
					else if (action.equalsIgnoreCase("delete")){
						
						try {
							String id= request.getParameter("id");
							String query3 = "update user set status=? where id =?;";
							PreparedStatement preparedStmt3 = conn.prepareStatement(query3);
							preparedStmt3.setString(1, "D");
							preparedStmt3.setString(2, id);
							preparedStmt3.executeUpdate();
							sess.setAttribute("updateResult", "User got Deleted Successfully");
							response.sendRedirect("userUpdateResult.jsp");
						} catch (Exception e) {
							 System.err.println("Got an exception!");
						      System.err.println(e.getMessage());
						      e.printStackTrace();
						}
						
					}
					
				}else{
					 // the mysql insert statement
				      String query = "select * from user where status!=? ;";
				      PreparedStatement preparedStmt = conn.prepareStatement(query);
				      preparedStmt.setString(1, "D");
				      ResultSet rs= preparedStmt.executeQuery();
				      ArrayList<UserDetails> userList = new ArrayList<UserDetails>(); 
				      while (rs.next()) {              
				        UserDetails us = new UserDetails();
				        us.setId(rs.getInt(1));
				        us.setFirstname(rs.getString(2));
				        us.setLastname(rs.getString(3));
				        us.setPassword(rs.getString(4));
				        us.setRole(rs.getString(5));
				        us.setPhonenumber(rs.getString(6));
				        us.setEmail(rs.getString(7));
				        us.setUserid(rs.getString(8));
				        userList.add(us);
				      }
				      
				      sess.setAttribute("userList", userList);
				      response.sendRedirect("userUpdate.jsp");
				}
					
				ConnectionUtils.closeQuietly(conn);
				
			} catch (Exception e) {
			      System.err.println("Got an exception!");
			      System.err.println(e.getMessage());
			      e.printStackTrace();
			}
	
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
