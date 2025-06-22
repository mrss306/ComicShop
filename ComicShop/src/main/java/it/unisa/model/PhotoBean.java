package it.unisa.model;

import java.io.InputStream;
import java.io.Serializable;

public class PhotoBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private InputStream img;
	private int id;
	private int articolo;
	
	public InputStream getImg() {
		return img;
	}

	public void setImg(InputStream img) {
		this.img = img;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getArticolo() {
		return articolo;
	}

	public void setArticolo(int articolo) {
		this.articolo = articolo;
	}

}