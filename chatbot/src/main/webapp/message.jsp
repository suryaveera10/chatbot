<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String user=request.getParameter("text");


try
{
    Class.forName("com.mysql.cj.jdbc.Driver"); //Registering JDBC Driver //for mysql
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/chatbot", "root", "root"); //Opening Connection
   
    Statement st=con.createStatement();
  
    st.executeUpdate("insert into userinput(user_input) values('"+user+"')");
   
    PreparedStatement pst = con.prepareStatement("SELECT replies FROM chatbot WHERE queries LIKE ?");
    pst.setString(1, user);
    ResultSet rs = pst.executeQuery();
    if(rs.next() ){
    	
    	%>
    	<%=rs.getString("replies") %>
    	<%
    }
    else{
    	out.print("Sorry can't be able to understand you!");
    }
   
}
    
    
     catch (Exception e) {
    	
    e.printStackTrace();
    }
    %>
    
    

 
       

