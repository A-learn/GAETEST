package test;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Gaetest1Servlet extends HttpServlet {
//	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		resp.setContentType("text/plain");
//		resp.getWriter().println("Hello, world");
//	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int lowBound = Integer.parseInt(request.getParameter("lowBound"));
	    int highBound =  Integer.parseInt(request.getParameter("highBound"));
	    int sum=1;
	    boolean checkOdd = (lowBound%2==1) ?true:false;
	    for(int currentNumber = lowBound; currentNumber<= highBound;currentNumber+=2)
	    	sum*=currentNumber;
	    response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter= response.getWriter();
		printWriter.write("<html>");
		printWriter.write("<body>");
		if(checkOdd) 
			printWriter.write(lowBound+"~"+highBound+"之間的奇數相乘為"+sum+"<br>");
		else
			printWriter.write(lowBound+"~"+highBound+"之間的偶數相乘為"+sum+"<br>");
		printWriter.write("</body>");
		printWriter.write("</html>");
	}
}
