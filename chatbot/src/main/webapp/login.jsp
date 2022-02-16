<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.awt.*"%>

<%
//String name=request.getParameter("name");
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
    String query="SELECT password FROM register WHERE email ='"+email+"'";
    ResultSet rs = st.executeQuery(query);
    String get_pass="";
    while(rs.next()){
    	get_pass=rs.getString(1);
    }
    if(get_pass.equals(password))
    {
    	response.sendRedirect("save.html");
    }
    else
    {
    	response.sendRedirect("error.html");
    }
    //st.executeUpdate("insert into user1(name) values('"+name+"')");
    //response.sendRedirect("login.html");
}
catch (Exception e)
{
	 response.sendRedirect("error.html");
    
} 

%>
