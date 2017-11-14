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
Table table; 
void loadData()
{
  table = loadTable("cafe.csv", "header");
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
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(0);
  text("Cafe Rubus Till System", width / 2, 20);
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
    text(row.roundedPrice, borderX * 6, mappedDistanceY + (mappedDistanceY / 10));
    y += height / table.getRowCount();
  }//end for
  
  //Draw line between
  line (width / 2, borderY, width / 2, height - borderY);
  fill(255);
  //rectMode(CENTER);
  rect(width / 2 + 10, (height / 10), width - width /1.8, borderY *  table.getRowCount() + (table.getRowCount() * 8) );
}//end displayProducts

void displayBill()
{
  float borderY = height * 0.1;
  float borderX = width * 0.05;
  int y = 10;
  float mappedDistanceY = map(y, 0, height, borderY, height - borderY);
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(0);
  text("Your Bill", width - (width / 4), height - height / 1.2);
  
  textAlign(LEFT, CENTER);
  textSize(15);
  for(Product row : bill)
  {
    //Write products
    fill(0);
    text(row.name, width - (borderX * 1.5), mappedDistanceY + (mappedDistanceY / 10));
    
    //Write Prices
    text(row.roundedPrice, width - (borderX * 6), mappedDistanceY + (mappedDistanceY / 10));
    y += height / table.getRowCount();
  }//end for
}//end displayBill
float total = 0;
void mousePressed()
{
  float borderY = height * 0.1;
  float borderX = width * 0.05;
  int count = 0;
  
  for (int i = 10; i < table.getRowCount(); i+= height / table.getRowCount())
  {
    if (mouseX > borderX && mouseX < borderX + 250 && mouseY > i + borderY && mouseY < borderY + i + 60)
    {
      if(count == 0)
      {
        //Product products = products.get(count);
         bill.get(count);
         //total += bill.price;
      }//end if
    }//end if
    count++;
  }//end for
}//end mousePressed

void draw()
{
  background(200, 200, 200);
  displayProducts();
  displayBill();
}//end draw