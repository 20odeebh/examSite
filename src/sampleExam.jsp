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
document.forma.clock.value = timeout; //초를 보여주고
window.setTimeout( "timer()", 1000 ); //timer함수를 다시 호출해서 감소된 초를 보여줌
}
else
{
	document.formb.action="sampleExam_ok.jsp" //시간이 다 됐는데 전송 버튼 안 누르면 자동으로 입력 정보를
	document.formb.submit(); //채점 페이지로 전송
	
	
}
}
//-->
</script>
</head>
<body>
<form action="<%=request.getRequestURL()%>" name="forma">
제한시간: <input type="text" name="clock" value="<%=clock%>" style="background-color:transparent;border:0 solid black;text-align:right;">
<br><br>
</form>

<%
String driver="oracle.jdbc.driver.OracleDriver";  //드라이버 이름 설정
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
int[] randomq = new int[10];//문제 순서 저장할 배열
int[] randomr = new int[4];//보기 순서 저장할 배열(숫자)
String[] stbogi=new String[4];//보기 순서 저장할 배열(스트링)

Random r = new Random();
//글자 문제 랜덤 섞기
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

//글자 보기 랜덤 섞기
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

//1>Q_EX1,2>Q_EX2 .... 변환 작업
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
	
	
Class.forName(driver);  //드라이버 이름으로 드라이버를 로드
    conn=DriverManager.getConnection(url,"heb498","pass123");
pstmt=conn.prepareStatement("SELECT * from QUIZ WHERE Q_NUM=?");

}catch(Exception e){
e.printStackTrace();
}
%>
<form action= "sampleExam_ok.jsp" method="post" name="formb">
학번 : <input type="text" name="id"/> &nbsp;&nbsp;
이름 : <input type="text" name="name"/> <br><br>

<%for(int a=0;a<10;a++){
	pstmt.setInt(1,randomq[a]); 
	rs=pstmt.executeQuery(); //1부터 12번 문제 랜덤으로  DB에서 가져옴
	rs.next();
	
	%>
	문제 <%=a+1 %> <%=rs.getString("Q_QUESTION") %><br><br> 
     
    <%for(int b=0;b<4;b++){ 
    	String param=rs.getString("Q_TYPE"); //문제 타입
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
<input type="submit" value="채점 하기 " >
<script>
<!--
timer();
//-->
</script>
</body></html>
