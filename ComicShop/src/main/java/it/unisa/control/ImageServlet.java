package it.unisa.control;

import it.unisa.model.PhotoBean;
import it.unisa.model.PhotoDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID immagine mancante");
            return;
        }
        
        try {
            int photoId = Integer.parseInt(id);
            PhotoDAO photoDAO = new PhotoDAO();
            PhotoBean photo = photoDAO.getPhotoById(photoId);            
            if (photo == null || photo.getImg() == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Immagine non trovata");
                return;
            }
            
            response.setContentType("image/jpeg");
            
            try (InputStream in = photo.getImg();
                 OutputStream out = response.getOutputStream()) {
                
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID immagine non valido");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel recupero dell'immagine");
        }
    }
}