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
String[] bogi=new String[10]; //1~10������ ����ڰ� ������ ����
String[] answer=new String[10]; //1~10���� ���� �迭
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
String url="jdbc:oracle:thin:@localhost:1521:orcl";
//java.util.Date time=new java.util.Date();

for(int c=0;c<10;c++){
	bogi[c]=request.getParameter("bogi"+(c+1))==null?"":request.getParameter("bogi"+(c+1)); //�������� �ʾ����� ���� ���������� ���ð��� �� �迭�� �ִ´�.
	answer[c]=request.getParameter("answer"+(c+1)); //�� ������ ������ �޾ƿ´�
}

for(int d=0;d<10;d++){
	if(bogi[d].equals(answer[d])){count++;}//����� ���ð��� ���ϸ� ä���Ѵ�.
	grade=Integer.toString(count);
}
	  Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
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
<h2>���� ���</h2>
<table border=1 width=500>
<tr align=center><td>�й�  </td>
      <td><%=id %></td></tr>
<tr align=center><td>�̸�   </td>
           <td><%=name %></td></tr>
<tr align=center><td>����  </td><td><%=count %>/10</td></tr>
<tr align=center><td colspan=2><a href="sampleList.jsp">���� ����Ʈ ����</a></td></tr>
</table>
</body>
</center>
</html>