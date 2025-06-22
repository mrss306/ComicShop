package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductDAO;

@WebServlet("/ProductInsert")
public class ProductInsert extends HttpServlet {
	static ProductDAO model = new ProductDAO();
	private static final long serialVersionUID = 1L;
       
    public ProductInsert() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		float prezzo = Float.parseFloat(request.getParameter("prezzo"));
		int saldo = Integer.parseInt(request.getParameter("saldo"));
		LocalDate data_uscita = LocalDate.parse(request.getParameter("data"));
		float voto = Float.parseFloat(request.getParameter("voto"));
		String descrizione = request.getParameter("descrizione");
		float peso = Float.parseFloat(request.getParameter("peso"));
		int quantità = Integer.parseInt(request.getParameter("quant"));
		
		ProductBean bean = new ProductBean();
		
		bean.setId(id);
		bean.setNome(nome);
		bean.setPrezzo(prezzo);
		bean.setSaldo(saldo);
		bean.setData_uscita(data_uscita);
		bean.setVoto(voto);
		bean.setDescrizione(descrizione);
		bean.setPeso(peso);
		bean.setQuantità(quantità);
		

		
		
		try {
			model.doSave(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("Homepage.jsp");
	}

}
