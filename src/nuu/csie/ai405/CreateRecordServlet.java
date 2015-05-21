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
		Entity entity = new Entity("Profiles");//�s�W�@�ӦW��Profiles������
		entity.setProperty("SID", sid);//�Nrequest���o��sid�ѼƳ]�w��SID�ݩ�
		entity.setProperty("Name", name);//�Nrequest���o��Name�ѼƳ]�w��Name�ݩ�
		entity.setProperty("Address", address);//�Nrequest���o��address�ѼƳ]�w��Address�ݩ�
		entity.setProperty("Phone", phone);//�Nrequest���o��phone�ѼƳ]�w��Phone�ݩ�
		datastore.put(entity);//�N�s�W��Profiles������s��datastore��
		response.sendRedirect("/");//�ɦ^�쥻������
		
	}

}
