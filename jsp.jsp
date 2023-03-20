


<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP page</title>
        <style>
            table,th,td{
               border:2px solid black;
               border-collapse: collapse;
               padding:20px;
            }
            body{
                background-image:url('img.jpg');
                background-size:cover;
                margin-left:400px;
                margin-top:200px;
            }
        </style>
    </head>
    <body>
        <h1>INVOICE</h1>
        <table>
         <%
        Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/invoices");
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("select count(*)from invoices");
        rs.next();
        int count=rs.getInt(1);
        out.println("<tr><td>Total Number of invoices in the database</td><td> " + count+"</td></tr>");
        ResultSet rs1=st.executeQuery("select sum(total_amount)from invoices");
        rs1.next();
        Double total_amount=rs1.getDouble(1);
        out.print("<tr><td>Total amount of all invoices </td><td> "+String.format("%.2f", total_amount)+"</td></tr>");
        ResultSet rs2=st.executeQuery("select avg(total_amount) from invoices");
        rs2.next();
        Double avg=rs2.getDouble(1);
        out.println("<tr><td>The average amount of all invoices </td><td>  "+avg+"</td></tr></table>");
        %>
    </body>
</html>
