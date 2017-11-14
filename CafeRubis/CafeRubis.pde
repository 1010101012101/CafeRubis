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

void displayProducts()
{
  int y = 10;
  float borderY = height * 0.1;
  float borderX = width * 0.05;
  float mappedDistanceY = map(y, 0, height, borderY, height - borderY);
  textAlign(LEFT, CENTER);
  textSize(15);
  for(Product row : products)
  {
    mappedDistanceY = map(y, 0, height, borderY, height - borderY);
    //Draw squares
    fill(255);
    rect(borderX,mappedDistanceY, 250, 60);
    
    //Write products
    fill(0);
    text(row.name, borderX * 1.5, mappedDistanceY + (mappedDistanceY / 10));
    
    //Write Prices
    text(row.price, borderX * 6, mappedDistanceY + (mappedDistanceY / 10));
    y += 60;
    
  }//end for
}//end displayProducts

void draw()
{
  background(200, 200, 200);
  displayProducts();
}//end draw