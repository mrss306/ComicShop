package it.unisa.control;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductDAO;


@WebServlet("/ProductUpdate")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ProductUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);

		
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		float prezzo = Float.parseFloat(request.getParameter("prezzo"));
		int saldo = Integer.parseInt(request.getParameter("saldo"));
		LocalDate data_uscita=LocalDate.parse(request.getParameter("data"));
		float voto = Float.parseFloat(request.getParameter("voto"));
		String descrizione = request.getParameter("descrizione");
		float peso = Float.parseFloat(request.getParameter("peso"));
		int quantità = Integer.parseInt(request.getParameter("quantita"));
				
         ProductBean product = new ProductBean();
         ProductDAO dao= new ProductDAO();
         
         product.setId(id);
         product.setNome(nome);
         product.setPrezzo(prezzo);
         product.setSaldo(saldo);
         product.setData_uscita(data_uscita);
         product.setVoto(voto);
         product.setDescrizione(descrizione);
         product.setPeso(peso);
         product.setQuantità(quantità);

         dao.Alter(id, product);
         
         session.setAttribute("modificatoSuccesso", "Articolo modificato correttamente");
         response.sendRedirect("Homepage.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
