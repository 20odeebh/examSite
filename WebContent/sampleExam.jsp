<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("euc-kr"); %>

<%!
String Check(String s,String c){
	
	if(c.equals("TI")){
		
	return "<img src =\"\\hw\\image\\"+s+"\"\\>";
	}
	else{
	return s;
	
	}
}
%>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
<!--
<%
String clock = request.getParameter( "clock" );
if( clock == null ) clock = "300";
%>
var timeout = <%=clock%>;
function timer()
{
if( --timeout > 0 )
{
document.forma.clock.value = timeout; //�ʸ� �����ְ�
window.setTimeout( "timer()", 1000 ); //timer�Լ��� �ٽ� ȣ���ؼ� ���ҵ� �ʸ� ������
}
else
{
	document.formb.action="sampleExam_ok.jsp" //�ð��� �� �ƴµ� ���� ��ư �� ������ �ڵ����� �Է� ������
	document.formb.submit(); //ä�� �������� ����
	
	
}
}
//-->
</script>
</head>
<body>
<form action="<%=request.getRequestURL()%>" name="forma">
���ѽð�: <input type="text" name="clock" value="<%=clock%>" style="background-color:transparent;border:0 solid black;text-align:right;">
<br><br>
</form>

<%
String driver="oracle.jdbc.driver.OracleDriver";  //����̹� �̸� ����
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
int[] randomq = new int[10];//���� ���� ������ �迭
int[] randomr = new int[4];//���� ���� ������ �迭(����)
String[] stbogi=new String[4];//���� ���� ������ �迭(��Ʈ��)

Random r = new Random();
//���� ���� ���� ����
for (int qr = 0; qr < 10; qr++)
{
    
    randomq[qr] = r.nextInt(12)+1;
    
    

    for (int cr = 0; cr < qr; cr++)
    {
        if (randomq[cr] == randomq[qr])
        {
            qr--;
        }
    }

}

//���� ���� ���� ����
for (int rr = 0; rr < 4; rr++)
{
    
    randomr[rr] = r.nextInt(4)+1;


    for (int chr = 0; chr < rr; chr++)
    {
        if (randomr[chr] == randomr[rr])
        {
            rr--;
        }
    }

}

//1>Q_EX1,2>Q_EX2 .... ��ȯ �۾�
for(int cnt=0;cnt<4;cnt++){
	switch(randomr[cnt]){
	case 1:
		stbogi[cnt]="Q_EX1";
		break;
	case 2:
		stbogi[cnt]="Q_EX2";
		break;
	case 3:
		stbogi[cnt]="Q_EX3";
		break;
	case 4:
		stbogi[cnt]="Q_EX4";
		break;
	default :
		break;
	}
}

try {
	
	
Class.forName(driver);  //����̹� �̸����� ����̹��� �ε�
    conn=DriverManager.getConnection(url,"heb498","pass123");
pstmt=conn.prepareStatement("SELECT * from QUIZ WHERE Q_NUM=?");

}catch(Exception e){
e.printStackTrace();
}
%>
<form action= "sampleExam_ok.jsp" method="post" name="formb">
�й� : <input type="text" name="id"/> &nbsp;&nbsp;
�̸� : <input type="text" name="name"/> <br><br>

<%for(int a=0;a<10;a++){
	pstmt.setInt(1,randomq[a]); 
	rs=pstmt.executeQuery(); //1���� 12�� ���� ��������  DB���� ������
	rs.next();
	
	%>
	���� <%=a+1 %> <%=rs.getString("Q_QUESTION") %><br><br> 
     
    <%for(int b=0;b<4;b++){ 
    	String param=rs.getString("Q_TYPE"); //���� Ÿ��
    	String s=rs.getString(stbogi[b]);  
    %>
    
    <input type="radio" name="bogi<%=a+1 %>" value="<%=rs.getString(stbogi[b]) %>"> <%=Check(s,param) %> &nbsp;&nbsp;
    <%} %>
    <br>
    <input type="hidden" name="answer<%=a+1%>" value="<%=rs.getString("Q_ANSWER") %>"> 
    <br>
<%
}
%> 
<input type="submit" value="ä�� �ϱ� " >
<script>
<!--
timer();
//-->
</script>
</body></html>
