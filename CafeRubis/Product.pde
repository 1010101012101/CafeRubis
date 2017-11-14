class Product
{
  String name;
  float price;
  
  Product(TableRow row)
  {
    name = row.getString("Name");
    price = row.getFloat("Price");
  }//end Product
  
   String toString()
  {
    return name 
      + " " + price;
  }
}//end class Product