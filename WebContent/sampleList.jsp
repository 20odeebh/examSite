<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    request.setCharacterEncoding("euc-kr");

     String id=null;
     Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;

    String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
    String url="jdbc:oracle:thin:@localhost:1521:orcl";

    		try {
    		Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
    		conn=DriverManager.getConnection(url,"heb498","pass123");
    		pstmt=conn.prepareStatement("SELECT * FROM SCORE");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		%>
    		<title>���� ����</title>
</head>
<body>
<center>
<H2>SCORE LIST</H2>
<table border=1 width=500>

<tr align=center><td>�й� </td><td>�̸� </td><td>����  </td><td>����ð�  </td></tr>
<%while(rs.next()){%>
<tr align=center>
<td><%=rs.getString("S_NUM") %></td>
<td><%=rs.getString("S_NAME") %></td>
<td><%=rs.getString("S_GRADE") %></td>
<td><%Timestamp timestamp = rs.getTimestamp(4); 
java.util.Date indate = new java.util.Date(timestamp.getTime()); %>
<%=indate %></td>
</tr>
<%} %>
</table>    
</center>
</body>
</html>





    		


