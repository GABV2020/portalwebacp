package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidades.Region;
import datos.Dt_Region;
/**
 * Servlet implementation class Sl_GestionRegion
 */
@WebServlet("/Sl_GestionRegion")
public class Sl_GestionRegion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionRegion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//obtenemos el valor de opcion
				int opc = 0;
				opc = Integer.parseInt(request.getParameter("opcion"));
				
				//CONSTRUIR EL OBJETO Region
				Dt_Region dtf = new Dt_Region();
				Region rg = new Region();
				rg.setNombre(request.getParameter("txtNombreRegion"));
				rg.setDescripcion(request.getParameter("txtDescripcionRegion"));
				//rg.setPaisID(Integer.parseInt(request.getParameter("txtNombrePais")));				
				
				switch (opc){
				case 1:{
					
				        try {
					        if(	dtf.guardarRegion(rg)) {
					        	response.sendRedirect("GestionRegion.jsp?msj=1");
					        }
					        else {
					        	response.sendRedirect("GestionRegion.jsp?msj=2");
					        }
					        	
				        	
				        }
				        catch(Exception e) {
				        	System.out.println("Sl_GestionRegion, el error es: " + e.getMessage());
							e.printStackTrace();
				        }
				        
						break;
					}
				
					default:
					response.sendRedirect("GestionRegion.jsp?msj=5");	
					break;
				
				
				}
			}
	
	
	
	

}
