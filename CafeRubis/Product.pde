class Product
{
  String name;
  float price;
  String roundedPrice;
  
  Product(TableRow row)
  {
    name = row.getString("Name");
    price = row.getFloat("Price");
    roundedPrice = nf(price, 1, 2);
  }//end Product
  
   String toString()
  {
    return name 
      + " " + price;
  }
}//end class Product