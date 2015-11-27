package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusinessLocatorDao;
import model.Company;

/**
 * Servlet implementation class LocationServlet
 */
public class LocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessLocatorDao dao = new BusinessLocatorDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LocationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Double> latitudes = new ArrayList<Double>();
		latitudes.add(new Double(request.getParameter("latitude")).doubleValue());
		ArrayList<Double> longitudes = new ArrayList<Double>();
		longitudes.add(new Double(request.getParameter("longitude")).doubleValue());
		ArrayList<Company>  companies = dao.getNabours(new Double(request.getParameter("latitude")).doubleValue(), new Double(request.getParameter("longitude")).doubleValue());
		System.out.println("found " + companies.size() + " companies");
		request.getSession(true).setAttribute("latitude",(new Double(request.getParameter("latitude")).doubleValue())); 
		request.getSession(true).setAttribute("longitude",(new Double(request.getParameter("longitude")).doubleValue()));
		request.getSession(true).setAttribute("companies",companies);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("locator.jsp#work");
        //dispatcher.forward(request, response);
		response.sendRedirect("locator.jsp#work");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
