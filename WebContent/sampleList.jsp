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

    String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
    String url="jdbc:oracle:thin:@localhost:1521:orcl";

    		try {
    		Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
    		conn=DriverManager.getConnection(url,"heb498","pass123");
    		pstmt=conn.prepareStatement("SELECT * FROM SCORE");
    		rs=pstmt.executeQuery();
    		}catch(Exception e){
    		e.printStackTrace();
    		}
    		%>
    		<title>점수 보기</title>
</head>
<body>
<center>
<H2>SCORE LIST</H2>
<table border=1 width=500>

<tr align=center><td>학번 </td><td>이름 </td><td>성적  </td><td>제출시간  </td></tr>
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





    		


