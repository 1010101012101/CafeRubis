/*Lab Test one - OOP
Name: Michael Lenghel
Student Number: C16434974*/

void setup()
{
  size(800, 600);
  loadData();
  printProducts();
}//end setup

ArrayList<Product> products = new ArrayList<Product>(); 
ArrayList<Product> bill = new ArrayList<Product>(); 

void loadData()
{
  Table table = loadTable("cafe.csv", "header");
  for (TableRow row:table.rows())
  {
    Product prod = new Product(row);
    products.add(prod);
  }//end for
}//end loadData

void printProducts()
{
  for(Product row : products)
    println(row);
}

void draw()
{
  background(0);
}//end draw