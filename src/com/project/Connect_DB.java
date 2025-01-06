package com.project;
import java.sql.*;

public class Connect_DB {
	
	static Connection con = null;
	public static Connection connect()
	{
		if(con==null)
		{
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db","root","");
			}
	
			catch(Exception e)
			{
				System.err.println("Something went wrong ....");
				e.printStackTrace();
			}
		}
		return con;
				
		}
	

}
