package it.unisa.model;

import java.io.Serializable;
import java.time.LocalDate;

public class ProductBean implements Serializable {

		private static final long serialVersionUID = 1L;
		
		int id;
		String nome;
		int prezzo;
		int saldo;
		LocalDate data_uscita;
		float voto;
		String descrizione;
		float peso;
		int quantita;

		public ProductBean() {
			id = -1;
			nome = "";
			prezzo=-1;
			saldo=-1;
			data_uscita=LocalDate.MIN;
			voto=-1;
			descrizione = "";
			peso=-1;
			quantita = -1;
		}

		
		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public String getNome() {
			return nome;
		}


		public void setNome(String nome) {
			this.nome = nome;
		}


		public int getPrezzo() {
			return prezzo;
		}


		public void setPrezzo(int prezzo) {
			this.prezzo = prezzo;
		}


		public int getSaldo() {
			return saldo;
		}


		public void setSaldo(int saldo) {
			this.saldo = saldo;
		}


		public LocalDate getData_uscita() {
			return data_uscita;
		}


		public void setData_uscita(LocalDate data_uscita) {
			this.data_uscita = data_uscita;
		}


		public float getVoto() {
			return voto;
		}


		public void setVoto(float voto) {
			this.voto = voto;
		}


		public String getDescrizione() {
			return descrizione;
		}


		public void setDescrizione(String descrizione) {
			this.descrizione = descrizione;
		}


		public float getPeso() {
			return peso;
		}


		public void setPeso(float peso) {
			this.peso = peso;
		}


		public int getQuantita() {
			return quantita;
		}


		public void setQuantita(int quantita) {
			this.quantita = quantita;
		}


		@Override
		public String toString() {
			return nome + " (" + id + "), " + prezzo + " " + quantita + ". " + descrizione+" " +voto+
					" "+peso+" "+saldo+" "+data_uscita;
		}

	}

