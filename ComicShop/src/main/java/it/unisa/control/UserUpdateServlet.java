package it.unisa.control;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdate")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String email = request.getParameter("email");
			LocalDate data =LocalDate.parse(request.getParameter("data"));
			String num_telefono = request.getParameter("num_telefono");
			String paese_residenza = request.getParameter("paese_residenza");
			String via = request.getParameter("via");
			String citta = request.getParameter("citta");
			String provincia = request.getParameter("provincia");
			String carta = request.getParameter("carta");
			
			HttpSession session = request.getSession(false);	    
	         UserBean user= (UserBean) session.getAttribute("currentSessionUser");
	         UserDAO dao= new UserDAO();
	         user.setNome(nome);
	         user.setCognome(cognome);
	         user.setEmail(email);
	         user.setData_nascita(data);
	         user.setNum_tel(num_telefono);
	         user.setPaese_residenza(paese_residenza);
	         user.setVia(via);
	         user.setCitta(citta);
	         user.setProvincia(provincia);
	         user.setCarta(carta);

	         dao.Alter(user.getUsername(), user);
	         response.sendRedirect("UserPage.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}