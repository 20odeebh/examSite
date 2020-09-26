<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%request.setCharacterEncoding("euc-kr"); %>

<%
int count=0;
String grade=null;
String id=request.getParameter("id");
String name=request.getParameter("name");
String[] bogi=new String[10]; //1~10번부터 사용자가 선택한 답지
String[] answer=new String[10]; //1~10번의 답지 배열
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
String url="jdbc:oracle:thin:@localhost:1521:orcl";
//java.util.Date time=new java.util.Date();

for(int c=0;c<10;c++){
	bogi[c]=request.getParameter("bogi"+(c+1))==null?"":request.getParameter("bogi"+(c+1)); //선택하지 않았으면 널을 선택했으면 선택값을 각 배열에 넣는다.
	answer[c]=request.getParameter("answer"+(c+1)); //각 문제의 정답을 받아온다
}

for(int d=0;d<10;d++){
	if(bogi[d].equals(answer[d])){count++;}//정답과 선택값을 비교하며 채점한다.
	grade=Integer.toString(count);
}
	  Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
	  conn=DriverManager.getConnection(url,"heb498","pass123");
	  pstmt=conn.prepareStatement("INSERT INTO SCORE(S_NUM,S_NAME,S_GRADE) VALUES(?,?,?)");
	  pstmt.setString(1,id);
	  pstmt.setString(2,name);
	  pstmt.setString(3,grade);
	  //pstmt.setDate(4, new java.sql.Date(time.getTime()) );
	  pstmt.executeUpdate();
	  
	  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<center>
<body>
<h2>시험 결과</h2>
<table border=1 width=500>
<tr align=center><td>학번  </td>
      <td><%=id %></td></tr>
<tr align=center><td>이름   </td>
           <td><%=name %></td></tr>
<tr align=center><td>점수  </td><td><%=count %>/10</td></tr>
<tr align=center><td colspan=2><a href="sampleList.jsp">점수 리스트 보기</a></td></tr>
</table>
</body>
</center>
</html>