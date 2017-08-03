package controler;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import da.CityDA;
import model.city;

/**
 * Servlet implementation class StudentControler
 */
@WebServlet("/CityControler")
public class CityControler extends HttpServlet {
     	private static final long serialVersionUID = 1L;

        public static final String LIST_CITY="/City.jsp";
        public static final String FORM_CITY="/form_City.jsp";


        //������ �
        // DA
        CityDA myCityDA;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityControler() {
        super();
        // TODO Auto-generated constructor stub

        myCityDA=new CityDA();
    }

        /**
         * @see HttpServlet#doGet(HttpServletRequest request,
		HttpServletResponse response)
         */
        protected void doGet(HttpServletRequest request, HttpServletResponse
        		response) throws ServletException, IOException {
                // TODO Auto-generated method stub
                //response.getWriter().append("Served at: ").append(request.getContextPath());

                String action=request.getParameter("action");
                String forward="";

                if(action.equalsIgnoreCase("listCity"))
                {
                        forward=LIST_CITY;
                        List<city> list=myCityDA.getAllcitys();
                        request.setAttribute("cities", list);
                }
                
                else if(action.equalsIgnoreCase("delete"))
                {
                	forward=LIST_CITY;
                	int cityID=Integer.valueOf(request.getParameter("ID"));
                	myCityDA.deleteCity(cityID);
                	List<city> list=myCityDA.getAllcitys();
                	request.setAttribute("cities", list);
                }
                else if(action.equalsIgnoreCase("update"))
                {
                	forward=FORM_CITY;
                	int cityID=Integer.valueOf(request.getParameter("ID"));
                	city city=myCityDA.getCityByID(cityID);
                	request.setAttribute("sumcity", city);                	
                }
                
                else if(action.equalsIgnoreCase("insert"))
                {
                	forward=FORM_CITY;
                	//int cityID=Integer.valueOf(request.getParameter("ID"));
                	//city city=myCityDA.getCityByID(cityID);
                	request.setAttribute("action", "add");
                	
                }




        RequestDispatcher dispatcher=request.getRequestDispatcher(forward);
        dispatcher.forward(request, response);

        }

        /**
         * @see HttpServlet#doPost(HttpServletRequest request,
		HttpServletResponse response)
         */
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                // TODO Auto-generated method stub
        		city city=new city();
        		request.setCharacterEncoding("UTF-8");
        		
        		String name=request.getParameter("name_param");
        		city.setCityName(name);
                String idString=request.getParameter("id_param");
                String action_type=request.getParameter("action_type");
                
                if(idString == null || idString.isEmpty())
                {
                	// 
                }
                else
                {
                	int id=Integer.valueOf(idString);
                	city.setRid(id);
                	
                	if(action_type.equals("Update"))
                	{
                		myCityDA.updateCity(city);
                	}
                	else
                	{
                		myCityDA.addCity(city);
                	}
                }
                
                
                
                
                
                // ���� ��� ���� ����� � doget                
                List<city> list=myCityDA.getAllcitys();
                request.setAttribute("cities", list);
                RequestDispatcher dispatcher=request.getRequestDispatcher(LIST_CITY);
                dispatcher.forward(request, response);
                
        }

}