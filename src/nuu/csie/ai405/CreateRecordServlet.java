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
		Entity entity = new Entity("Profiles");//�s�W�@�ӦW��Profiles������
		entity.setProperty("SID", no+"");//�Nrequest���o��sid�ѼƳ]�w��SID�ݩ�
		entity.setProperty("Name", name);//�Nrequest���o��Name�ѼƳ]�w��Name�ݩ�
		entity.setProperty("Auth", auth);//�Nrequest���o��address�ѼƳ]�w��Address�ݩ�
		entity.setProperty("Publi", publi);//�Nrequest���o��phone�ѼƳ]�w��Phone�ݩ�
		entity.setProperty("Pri", pri);
		entity.setProperty("Email", email);
		datastore.put(entity);//�N�s�W��Profiles������s��datastore��
		no++;
		response.sendRedirect("/");//�ɦ^�쥻������
		
	}

}
