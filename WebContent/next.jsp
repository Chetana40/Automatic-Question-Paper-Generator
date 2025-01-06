<%@page import="com.project.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Properties"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="bootstrap.min.css" rel="stylesheet">
    <!-- Template Stylesheet -->
    <link href="style.css" rel="stylesheet">
    <style>
    
    .btncentre{
    text-align:center;
    }
    
    
        .ram {
            padding-top: 160px;
        }

        .question-paper {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border: 2px solid black;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }

        .question-paper h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: black;
        }

        .question-paper h3 {
            margin-bottom: 5px;
            font-size: 18px;
            color: black;
        }

        .question-paper h3:last-child {
            text-align: right;
            font-size: 18px;
        }

        .question-paper p {
            margin-bottom: 10px;
        }

        .question-paper .paper-details {
            display: flex; /* Use flexbox to arrange paper details */
            justify-content: space-between; /* Push subject to the left and marks to the right */
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3a3a3a; /* Add a dark line */
        }

        .question-paper .question-container {
            max-height: none; /* Remove max-height */
            padding-top: 20px;
        }

        .question-paper .question-container b {
            display: inline-block;
            width: 20px;
            font-size: 20px;
            font-weight: bold;
            color: #0080ff;
        }

        .question-paper .question-container p {
            margin-left: 30px;
            font-size: 18px;
            color: #3a3a3a;
            flex: 1; 
        }

        .question-paper .question-container .marks {
            font-size: 18px;
            font-weight: bold;
            color: black;
            float: right; /* Move marks to the right */
        }

        .question-paper .question-container .question {
            display: flex; /* Use flexbox to align question items horizontally */
            align-items: center; /* Center items vertically */
        }

        .question-paper .question-container hr {
            margin-top: 15px;
            margin-bottom: 10px;
            border: none;
            height: 1px;
            background-color: #3a3a3a;
        }

        .question-paper .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            color: #3a3a3a;
        }
        
        
        
     
    /* Existing CSS styles */

    /* Style for the buttons */
    .btn {
    margin: 15px;
        font-size: 16px;
        padding: 10px 20px;
        align:centre;
    }

    /* Style for the download button */
    .btn-medium {
        background-color: #0080ff;
        border-color: #0080ff;
    }

    /* Style for the download button on hover */
    .btn-medium:hover {
        background-color: #0070cc;
        border-color: #0070cc;
    }

    /* Style for the print button */
    .print-button {
        background-color: #0080ff;
        border-color: #0080ff;
    }

    /* Style for the print button on hover */
    .print-button:hover {
        background-color: #0070cc;
        border-color: #0070cc;
    }

    /* Hide the print button when printing */
    @media print {
        .print-button {
            display: none;
        }
    }
</style>
    <title>Exam Question Paper</title>
</head>
<body>
    <%
    String subject = request.getParameter("subject");
    String chap1 = request.getParameter("chap1");
    String chap2 = request.getParameter("chap2");
    String num = request.getParameter("num");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    if (subject != null && date != null) {
        Connection con = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        
        try {
            con = Connect_DB.connect();
            if (con == null) {
                throw new Exception("Database connection failed");
            }

            int totalMarks = 30;
            int selectedTotalMarks = 0;
            int i = 1;

    %>
    <div class="question-paper">
        <h1 align="center" style="color:#00bcd4">R.C. PATEL INSTITUTE OF TECHNOLOGY</h1>
        <h2>TERM TEST <%= num %></h2>
        <div class="paper-details"> 
            <div>
                <h3>Subject: <%= subject %></h3>
                <h3>Time: <%= time %></h3>
                <h3>Branch: Computer Engineering</h3>
            </div>
            <div>
                <h3>Marks: 30</h3>
                <h3>Date: <%= date %></h3>
            </div>
        </div>

        <div class="question-container">
            <%
            ps1 = con.prepareStatement("SELECT text, marks FROM question_tbl WHERE subject=? AND chapter IN (?, ?) ORDER BY RAND()");
            ps1.setString(1, subject);
            ps1.setString(2, chap1);
            ps1.setString(3, chap2);
            rs = ps1.executeQuery();

            while (rs.next()) {
                String text = rs.getString("text");
                int marks = rs.getInt("marks");

                if (selectedTotalMarks + marks > totalMarks) {
                    break;
                }

                selectedTotalMarks += marks;
            %>
                <div class="question">
                    <b><%= i %></b>
                    <p><%= text %></p>
                    <div class="marks"><%= marks %> marks</div>
                </div>
                <hr>
            <%
                i++;
            }

            if (selectedTotalMarks < totalMarks) {
                int remainingMarks = totalMarks - selectedTotalMarks;
                ps2 = con.prepareStatement("SELECT text, marks FROM question_tbl WHERE subject=? AND chapter IN (?, ?) AND marks <= ? ORDER BY RAND()");
                ps2.setString(1, subject);
                ps2.setString(2, chap1);
                ps2.setString(3, chap2);
                ps2.setInt(4, remainingMarks);
                rs2 = ps2.executeQuery();

                if (rs2.next()) {
                    String text = rs2.getString("text");
                    int marks = rs2.getInt("marks");

            %>
                    <div class="question">
                        <b><%= i %></b>
                        <p><%= text %></p>
                        <div class="marks"><%= marks %> marks</div>
                    </div>
                    <hr>
            <%
                    i++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (rs2 != null) rs2.close();
            if (ps1 != null) ps1.close();
            if (ps2 != null) ps2.close();
            if (con != null) con.close();
        }
    %>
        </div>

        <div class="footer">
            <small><i><p>All the Best.</p></i></small>  
        </div>
    </div>
    <% } %>
    
    <div>    
        <button class="btn btn-primary btn-medium print-button" onclick="window.print()">Print</button>
        <button class="btn btn-primary btn-medium print-button"><a href="menu.html">Home</a></button>
        <button class="btn btn-primary btn-medium print-button"><a href="index.html">Logout</a></button>
        
    </div>
</body>

</html>