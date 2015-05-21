package nuu.csie.ai405;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class CreateRecordServlet extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid=request.getParameter("sid");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity entity = new Entity("Profiles");//新增一個名為Profiles的實體
		entity.setProperty("SID", sid);//將request取得的sid參數設定到SID屬性
		entity.setProperty("Name", name);//將request取得的Name參數設定到Name屬性
		entity.setProperty("Address", address);//將request取得的address參數設定到Address屬性
		entity.setProperty("Phone", phone);//將request取得的phone參數設定到Phone屬性
		datastore.put(entity);//將新增的Profiles的實體存到datastore中
		response.sendRedirect("/");//導回原本的首頁
		
	}

}
