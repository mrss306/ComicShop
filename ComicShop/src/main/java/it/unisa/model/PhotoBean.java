package it.unisa.model;

import java.io.Serializable;

public class PhotoBean implements Serializable{
	private String base64image;
	private int id;
	private int articolo;

	

	public String getBase64image() {
		return base64image;
	}

	public void setBase64image(String base64image) {
		this.base64image = base64image;
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