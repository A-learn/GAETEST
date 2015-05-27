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
	  <th>編號</th>
	  	<th>書名</th>
	    <th>作者</th>
	    <th>出版社</th>
	    <th>價錢	</th>
	     <th>Email</th>
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
    <td><%=entity.getProperty("Auth") %></td><%--取得entity各屬性值，顯示於表格各欄--%>
    <td><%=entity.getProperty("Publi") %></td><%--取得entity各屬性值，顯示於表格各欄--%>
  <td><%=entity.getProperty("Pri") %></td>
  <td><%=entity.getProperty("Email") %></td>
  </tr>
<%
	}
%>
</tbody>
</table>
<!--表單在按下新增後會將數值post到/CreateRecord.doURL向CreateRecordServlet發處請求，儲存新一筆的聯絡人資料  -->
<p>新增資料</p>
<form action="/CreateRecord.do" method="Post">
<p>書名</p>
<input name="name" type="text" placeholder="請輸入書名"/>
<p>作者</p>
<input name="auth"  type="text" placeholder="請輸入作者"/>
<p>出版社</p>
<input name="publi"  type="text" placeholder="請輸入出版社"/>
<p>價錢</p>
<input name="pri"  type="text" placeholder="請輸入價錢"/>
<p>Email</p>
<input name="email"  type="text" placeholder="請輸入Email"/>
<input type="submit" value="新增"/>
</form>

</body>
</html>