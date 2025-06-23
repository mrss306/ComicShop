package it.unisa.model;


public class ItemOrder {
  private ProductBean item;
  private int numItems;

  public ItemOrder(ProductBean item) {
    setItem(item);
    setNumItems(1);
  }

  public ProductBean getItem() {
    return(item);
  }

  protected void setItem(ProductBean item) {
    this.item = item;
  }

  public int getId() {
    return(getItem().getId());
  }

  public String getDescrizione() {
    return(getItem().getDescrizione());
  }

  public String getNome() {
	  return(getItem().getNome());
  }
  
  
  public float getPrezzo() {
    return (float) ((Math.round(getItem().getPrezzo()*100.0))/100.0);
  }
  
  public int getNumItems() {
    return(numItems);
  }

  public void setNumItems(int n) {
    this.numItems = n;
  }

  public void incrementNumItems() {
    setNumItems(getNumItems() + 1);
  }

  public void cancelOrder() {
    setNumItems(0);
  }

  public float getTotalCost() {
    return (float) (Math.round(getNumItems() * getPrezzo()*100)/100.00);
  }
}