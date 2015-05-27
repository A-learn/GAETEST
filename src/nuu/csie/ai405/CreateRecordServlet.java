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

	int no=0;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		String sid=request.getParameter("sid"+no);
		String name=request.getParameter("name");
		String auth=request.getParameter("auth");
		String publi=request.getParameter("publi");
		String pri=request.getParameter("pri");
		String email=request.getParameter("email");
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity entity = new Entity("Profiles");//新增一個名為Profiles的實體
		entity.setProperty("SID", no+"");//將request取得的sid參數設定到SID屬性
		entity.setProperty("Name", name);//將request取得的Name參數設定到Name屬性
		entity.setProperty("Auth", auth);//將request取得的address參數設定到Address屬性
		entity.setProperty("Publi", publi);//將request取得的phone參數設定到Phone屬性
		entity.setProperty("Pri", pri);
		entity.setProperty("Email", email);
		datastore.put(entity);//將新增的Profiles的實體存到datastore中
		no++;
		response.sendRedirect("/");//導回原本的首頁
		
	}

}
