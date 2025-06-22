package it.unisa.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PhotoDAO {
    private static DataSource ds;
    static Connection currentCon = null;
    static ResultSet rs = null;
    
    static {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("jdbc/comicshop");
        } catch (NamingException e) {
            System.out.println("Error:" + e.getMessage());
        }
    }
    
    public PhotoBean getPhotoById(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        PhotoBean bean = null;
        
        String query = "SELECT * FROM foto WHERE id = ?";
        
        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                bean = new PhotoBean();
                Blob blob = rs.getBlob("foto");
                bean.setImg(blob.getBinaryStream());
                bean.setId(rs.getInt("id"));
                bean.setArticolo(rs.getInt("articolo"));
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        
        return bean;
    }
    
    public synchronized void doSave(PhotoBean foto) throws SQLException {
        Connection connection = null;

        
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO foto (foto, id, articolo) VALUES (?, ?, ?)";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);
            
            preparedStatement.setBlob(1, foto.getImg());
            preparedStatement.setInt(2, foto.getId());
            preparedStatement.setInt(3, foto.getArticolo());
            
            preparedStatement.executeUpdate();
            connection.commit();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
    }

    public synchronized List<PhotoBean> getPhotos(ProductBean product) {
        List<PhotoBean> photos = new LinkedList<PhotoBean>();
        PreparedStatement preparedStatement = null;
        String SearchQuery = "Select foto.* FROM foto Join articolo ON " + 
                          "foto.articolo=articolo.id " + 
                          "WHERE articolo.id = " + product.getId();

        Connection connection = null;
        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(SearchQuery);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                PhotoBean bean = new PhotoBean();
                Blob blob = rs.getBlob("foto");
                bean.setImg(blob.getBinaryStream());
                bean.setId(rs.getInt("id"));
                bean.setArticolo(rs.getInt("articolo"));
                photos.add(bean);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }

        return photos;
    }
}