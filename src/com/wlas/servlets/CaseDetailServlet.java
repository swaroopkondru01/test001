package com.wlas.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wlas.conn.ConnectionUtils;
import com.wlas.pojo.CaseDetails;
import com.wlas.pojo.UserDetails;

/**
 * Servlet implementation class CaseDetailServlet
 */
@WebServlet("/CaseDetailServlet")
public class CaseDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaseDetailServlet() {
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
				
				if(action.equalsIgnoreCase("get"))
				{
					 String query = "select * from casedetails ;";
				      PreparedStatement preparedStmt = conn.prepareStatement(query);
				      ResultSet rs= preparedStmt.executeQuery();
				      ArrayList<CaseDetails> caseList = new ArrayList<CaseDetails>(); 
				      while (rs.next()) {              
				    	  CaseDetails us = new CaseDetails();
				        us.setId(rs.getInt(1));
				        us.setFirstname(rs.getString(2));
				        us.setLastname(rs.getString(3));
				        us.setCaseType(rs.getString(4));
				        us.setCaseID(rs.getString(5));
				        us.setPhonenumber(rs.getString(6));
				        us.setEmail(rs.getString(7));
				        us.setBname(rs.getString(8));
				        us.setRdate(rs.getString(9));
				        us.setAddress(rs.getString(10));
				        us.setTextdata(rs.getString(11));
				        caseList.add(us);
				      }
				      
				      sess.setAttribute("caseList", caseList);
				      response.sendRedirect("caseUpdate.jsp");
				}
				else if(action.equalsIgnoreCase("update"))
				{
					String id= request.getParameter("id");
					 String query1 = "select * from casedetails where id=? ;";
					PreparedStatement preparedStmt1 = conn.prepareStatement(query1);
					preparedStmt1.setString(1, id);
					ResultSet rs=preparedStmt1.executeQuery();
					if(rs.next())
					{
						sess.setAttribute("firstname", rs.getString("firstname"));
						sess.setAttribute("lastname", rs.getString("lastname"));
						sess.setAttribute("caseID", rs.getString("caseID"));
						sess.setAttribute("caseType", rs.getString("caseType"));
						sess.setAttribute("mailid", rs.getString("mailid"));
						sess.setAttribute("phone", rs.getString("phone"));
						sess.setAttribute("businessname", rs.getString("businessname"));
						sess.setAttribute("rdate", rs.getString("rdate"));
					}
					
					
					response.sendRedirect("caseDetailsUpdate.jsp");
				}
				
				else if (action.equalsIgnoreCase("delete")){
					
					try {
						String id= request.getParameter("id");
						String query3 = "delete from casedetails where id =?;";
						PreparedStatement preparedStmt3 = conn.prepareStatement(query3);
						preparedStmt3.setString(1, id);
						preparedStmt3.executeUpdate();
						sess.setAttribute("updateResult", "Case got Deleted Successfully");
						response.sendRedirect("userUpdateResult.jsp");
					} catch (Exception e) {
						 System.err.println("Got an exception!");
					      System.err.println(e.getMessage());
					      e.printStackTrace();
					}
					
				}
				
				else if (action.equalsIgnoreCase("save")){
					String name = request.getParameter("firstName");
					String lastName = request.getParameter("lastName");
					String caseType=(String) sess.getAttribute("caseType");
					String caseID = (String) sess.getAttribute("caseID");
					String textdata=request.getParameter("textdata");
					String phone = request.getParameter("phone");
					String email = request.getParameter("emailID");
					String bName = request.getParameter("bName");
					String rDate = request.getParameter("rDate");
					String address=request.getParameter("address");
					
					// the mysql insert statement
					String query = "update caseDetails set firstname=?, lastname=?, caseType=?, caseID=?, phone=?, mailid=?, businessname=?,rdate=?,address=?,textdata=? where caseID=?;";
							
				      // create the mysql insert preparedstatement
				      PreparedStatement preparedStmt = conn.prepareStatement(query);
				      preparedStmt.setString (1, name);
				      preparedStmt.setString (2, lastName);
				      preparedStmt.setString (3, caseType);
				      preparedStmt.setString (4, caseID);
				      preparedStmt.setString (5, phone);
				      preparedStmt.setString(6, email);
				      preparedStmt.setString(7, bName);
				      preparedStmt.setString(8, rDate);
				      preparedStmt.setString(9, address);
				      preparedStmt.setString(10, textdata);
				      preparedStmt.setString(11, caseID);
				      preparedStmt.executeUpdate();
				      
				      sess.setAttribute("updateResult", "Case got Updated Successfully");
						response.sendRedirect("userUpdateResult.jsp");
				}
				
			}
			else{
			
			String name = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String caseType=request.getParameter("caseType");
			String caseID = request.getParameter("caseID");
			String textdata=request.getParameter("textdata");
			String phone = request.getParameter("phone");
			String email = request.getParameter("emailID");
			String bName = request.getParameter("bName");
			String rDate = request.getParameter("rDate");
			String address=request.getParameter("address");
			try
			
			{
			
			
		     

		      
		      // the mysql insert statement
		      String query = "INSERT INTO caseDetails (firstname, lastname, caseType, caseID, phone, mailid, businessname,rdate,address,textdata)"
		      		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		      // create the mysql insert preparedstatement
		      PreparedStatement preparedStmt = conn.prepareStatement(query);
		      preparedStmt.setString (1, name);
		      preparedStmt.setString (2, lastName);
		      preparedStmt.setString (3, caseType);
		      preparedStmt.setString (4, caseID);
		      preparedStmt.setString (5, phone);
		      preparedStmt.setString(6, email);
		      preparedStmt.setString(7, bName);
		      preparedStmt.setString(8, rDate);
		      preparedStmt.setString(9, address);
		      preparedStmt.setString(10, textdata);

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
			response.sendRedirect("CaseDetails_submit.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
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
