<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--[START imports]--%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="java.util.List" %>
<%--[END imports]--%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>目前資料:<p>
<table>
	<thead>
	  <tr>
	  	<th>學號</th>
	    <th>姓名</th>
	    <th>地址</th>
	    <th>電話</th>
	  </tr>
	</thead>
	<tbody>
<%
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	
	Query query = new Query("Profiles");
	List<Entity> result = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
	//利用for each把result中的entity提取出來
	for(Entity entity:result){		
%>

  <tr><%--每一個entity以表格的一列顯示出來--%>
    <td><%=entity.getProperty("SID") %></td><%--取得entity各屬性值，顯示於表格各欄--%>
    <td><%=entity.getProperty("Name") %></td><%--取得entity各屬性值，顯示於表格各欄--%>
    <td><%=entity.getProperty("Address") %></td><%--取得entity各屬性值，顯示於表格各欄--%>
    <td><%=entity.getProperty("Phone") %></td><%--取得entity各屬性值，顯示於表格各欄--%>
  </tr>
<%
	}
%>
</tbody>
</table>
<!--表單在按下新增後會將數值post到/CreateRecord.doURL向CreateRecordServlet發處請求，儲存新一筆的聯絡人資料  -->
<p>新增資料</p>
<form action="/CreateRecord.do" method="Post">
<p>學號</p>
<input name="sid" type="text" placeholder="請輸入學號"/>
<p>姓名</p>
<input name="name"  type="text" placeholder="請輸入姓名"/>
<p>地址</p>
<input name="address"  type="text" placeholder="請輸入地址"/>
<p>連絡電話</p>
<input name="phone"  type="text" placeholder="請輸入連絡電話"/>
<input type="submit" value="新增"/>
</form>

</body>
</html>