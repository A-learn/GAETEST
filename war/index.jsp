<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>

<%--@ page import= "java.util.Arrays" --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- html註釋客戶端看得見 -->
<%--jsp註釋客戶端看不見 --%>
<%!//在這種Scriptlet可定義全域變數、方法、類別
	final int courseAmount=5;//全域常數
%>
<%
/*==============在這種Scriptlet可定義區域變數、撰寫敘述==========*/
	float chinese=0.0f;//區域變數
	float english=0.0f;//區域變數
	float math=0.0f;//區域變數
	float science=0.0f;//區域變數
	float history=0.0f;//區域變數
	float total=0.0f;//區域變數
	float avg=0.0f;//區域變數

	boolean checkParam = (request.getParameter("chinese")!=null &&request.getParameter("chinese")!="" )&&
						 (request.getParameter("english")!=null &&request.getParameter("english")!="" )&&
						 (request.getParameter("math")!=null &&request.getParameter("math")!="" )&&
						 (request.getParameter("science")!=null &&request.getParameter("science")!="" )&&
						 (request.getParameter("history")!=null &&request.getParameter("history")!="" );//取得HTTP Post的參數，並檢查是否合法
	if(checkParam) {
		chinese=Float.parseFloat(request.getParameter("chinese"));
		english=Float.parseFloat(request.getParameter("english"));
		math=Float.parseFloat(request.getParameter("math"));
		science=Float.parseFloat(request.getParameter("science"));
		history=Float.parseFloat(request.getParameter("history"));
		total = chinese+english+math+science+history;
		avg =(float) total/courseAmount;
		out.print("國文:"+chinese+"<br>");//撰寫敘述
		out.print("英文:"+english+"<br>");//撰寫敘述
		out.print("數學:"+math+"<br>");//撰寫敘述
		out.print("自然:"+science+"<br>");//撰寫敘述
		out.print("社會:"+history+"<br>");//撰寫敘述
		out.print("總分:"+total+"<br>");//撰寫敘述
		out.print("平均:"+avg+"<br>");//撰寫敘述
		float[] pointarr={chinese,english,math,science,history};
		int inofmax=0;
		double max=0;
		for(int i=0;i<pointarr.length;i++){
			if(max<pointarr[i]){
			   max=pointarr[i];
				inofmax=i;
			}
		}
		String maxclas="";
		switch(inofmax){
		case 0: maxclas="國文";
				break;
		case 1: maxclas="英文";
				break;
		case 2: maxclas="數學";
				break;
		case 3: maxclas="自然";
				break;	
		
		case 4: maxclas="歷史";
				break;
				
		}
		out.print("最高分is: "+max+","+maxclas+"<br>");
		double Weiavg=(chinese*3+english*3+math*3+science*2+history*2)/13;
		out.print("加權平均is: "+Weiavg);
	}
	
%>


<% if(checkParam){
	if(chinese>=60){
%>
	<p>國文及格=><%=chinese+"分" %></p><%--輸出字串常數、變數 --%>
<%
	}else{
%>
	<p>國文<font color="red">不及格=><%=chinese+"分" %></font></p><%--輸出字串常數、變數 --%>
<%
	}
}
%>

<% if(checkParam){
	if(english>=60){
%>
	<p>英文及格=><%=english+"分" %></p><%--輸出字串常數、變數 --%>
<%
	}else{
%>
	<p>英文<font color="red">不及格=><%=english+"分" %></font></p><%--輸出字串常數、變數 --%>
<%
	}
}
%>

<% if(checkParam){
	if(math>=60){
%>
	<p>數學及格=><%=math+"分" %></p>
<%
	}else{
%>
	<p>數學<font color="red">不及格=><%=math+"分" %></font></p><%--輸出字串常數、變數 --%>
<%
	}
}
%>

<% if(checkParam){
	if(science>=60){
%>
	<p>自然及格=><%=science+"分" %></p><%--輸出字串常數、變數 --%>
<%
	}else{
%>
	<p>自然<font color="red">不及格=><%=science+"分" %></font></p><%--輸出字串常數、變數 --%>
<%
	}
}
%>

<% if(checkParam){
	if(history>=60){
%>
	<p>社會及格=><%=history+"分" %></p><%--輸出字串常數、變數 --%>
<%
	}else{
%>
	<p>社會<font color="red">不及格=><%=history+"分" %></font></p><%--輸出字串常數、變數 --%>
<%
	}
}
%>





<p>請輸入各科成績</p>
<form method="Post">
<p>國文</p>
<input name="chinese" type="text" placeholder="請輸入成績"/>
<p>英文</p>
<input name="english"  type="text" placeholder="請輸入成績"/>
<p>數學</p>
<input name="math"  type="text" placeholder="請輸入成績"/>
<p>自然</p>
<input name="science"  type="text" placeholder="請輸入成績"/>
<p>歷史</p>
<input name="history"  type="text" placeholder="請輸入成績"/>
<input type="submit" value="送出"/>
</form>

</body>
</html>