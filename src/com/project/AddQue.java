package com.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AddQue
 */
public class AddQue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQue() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		    String text = request.getParameter("text");
		    String subject = request.getParameter("subject");
		    String chapter = request.getParameter("chapter");
		    

		    
		    if (text != null && !text.isEmpty()) {
		       
		    String bloomTaxonomyLevel = identifyBloomTaxonomyLevel(text);

		   
		    int marks = 0;
		    switch (bloomTaxonomyLevel.toLowerCase()) {
		        case "remembering":
		        case "understanding":
		        case "applying":
		            marks = 5; 
		            break;
		        
		        case "evaluating":
		        case "creating":
		        case "analysing":
		            marks = 10; 
		            break;
		    }
		    
		    try {
				Connection con = Connect_DB.connect();
				PreparedStatement ps1 = con.prepareStatement("insert into question_tbl values(?,?,?,?,?)");
				ps1.setInt(1,0);
				ps1.setString(2,text);
				ps1.setInt(3,marks);
				ps1.setString(4,subject);
				ps1.setString(5,chapter);
				int i = ps1.executeUpdate();
				if(i==1)
				{
					response.sendRedirect("menu.html");
				}
			 }
				catch(Exception e)
				{
					response.sendRedirect("error.html");
				}
		    }
	}

		private String identifyBloomTaxonomyLevel(String text) {
		    String[] keywordsForRemembering = {"define", "list", "state", "name", "identify" };
		    String[] keywordsForUnderstanding = {"describe","summarize", "what" };
		    String[] keywordsForApplying = { "apply", "demonstrate", "use", "illustrate" };
		    String[] keywordsForAnalyzing = { "analyze", "compare", "contrast", "difference" };
		    String[] keywordsForEvaluating = { "evaluate", "judge","explain" , "discuss" };
		    String[] keywordsForCreating = { "create", "design", "develop", "construct" };

		    text = text.toLowerCase();

		    if (containsAnyKeyword(text, keywordsForCreating))
		        return "Creating";
		    if (containsAnyKeyword(text, keywordsForEvaluating))
		        return "Evaluating";
		    if (containsAnyKeyword(text, keywordsForAnalyzing))
		        return "Analyzing";
		    if (containsAnyKeyword(text, keywordsForApplying))
		        return "Applying";
		    if (containsAnyKeyword(text, keywordsForUnderstanding))
		        return "Understanding";
		    if (containsAnyKeyword(text, keywordsForRemembering))
		        return "Remembering";

		    
		    return "Unknown";
		}

		private boolean containsAnyKeyword(String text, String[] keywords) {
		    for (String keyword : keywords) {
		        if (text.contains(keyword.toLowerCase())) {
		            return true;
		        }
		    }
		    return false;
		}
	}
	



