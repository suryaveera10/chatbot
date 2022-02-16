<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
//String password=request.getParameter("password");

try
{
Class.forName("com.mysql.cj.jdbc.Driver"); //Registering JDBC Driver //for mysql
    //Class.forName("oracle.jdbc.driver.OracleDriver");  //For Oracle
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/chatbot", "root", "root"); //Opening Connection
   //System.out.println(con);
    Statement st=con.createStatement();
    st.executeUpdate("insert into register(name,email,password) values('"+name+"','"+email+"','"+password+"')");
    //st.executeUpdate("insert into user1(name) values('"+name+"')");
    response.sendRedirect("login.html");
}
catch (Exception e)
{
	 response.sendRedirect("error.html");
    
} 

%>
