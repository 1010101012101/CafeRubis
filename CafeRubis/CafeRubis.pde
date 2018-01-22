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
float total = 0;
boolean billFull = false;

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
  float borderY = height / 15;
  float borderX = width / 15;
  float y = borderY;
  //float split = height / products.size();
  float split = map(y, 0, height, borderY, height - borderY);
  
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(0);
  text("Cafe Rubus Till System", width / 2, 20);
  textAlign(LEFT, CENTER);
  textSize(15);
  
  //Draw line between
  line (width / 2, borderY, width / 2, height - borderY);
  fill(255);
  //rectMode(CENTER);
  rect(width / 2 + (borderX / 2), borderY, width - width /1.8, height / 1.2);

  for(int i = 0; i < products.size(); i++)
  {
    Product drinks = products.get(i);
    
    //Draw squares
    fill(255);
    rect(borderX, borderY + (split * i), width / 3, height / 10);
    
    //Write products
    fill(0);
    text(drinks.name, borderX + (borderX / 4), borderY + (height / 20) + split * i);
    
    //Write Prices
    text(drinks.roundedPrice, borderX * 5,  borderY + (height / 20) + split * i);
  }//end for
   
}//end displayProducts

void displayBill()
{
  float borderY = height / 15;
  float borderX = width / 15;
  float boxBorder = height - height / 1.1;
  int y = 10;
  float mappedDistanceY = map(y, 0, height, borderY, height - borderY);
  int i;
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(0);
  text("Your Bill", width - (width / 4), boxBorder);
  
  //textAlign(LEFT, CENTER);
  textSize(15);
  
  for(i = 0; i < bill.size(); i++)
  {
    Product bills = bill.get(i);
    
    //Write products
    fill(0);
    text(bills.name, width - (borderX * 1.8), mappedDistanceY * i + (mappedDistanceY / 10) + boxBorder * 2);
    
    //Write Prices
    text(bills.roundedPrice, width - (borderX * 6), mappedDistanceY * i + (mappedDistanceY / 10) + boxBorder * 2);
  }//end for
  //print total
    String roundedTotal = nf(total, 1, 2);
    text("Total: " + roundedTotal, width - (borderX * 1.2), mappedDistanceY * i + (mappedDistanceY / 10) + boxBorder * 2 + mappedDistanceY);
}//end displayBill

void mousePressed()
{
  float borderY = height / 15;
  float borderX = width / 15;
  float y = borderY;
  float mappedDistanceY = map(y, 0, height, borderY, height - borderY);

    //Makes sure within boxses
    if (mouseX > borderX && mouseX < borderX + width / 3)
    {
      for(int i = 0; i < products.size(); i++)
      {
        Product drinks = products.get(i);
        
        if(mouseY > borderY + (mappedDistanceY * i) && mouseY < borderY + (mappedDistanceY * i) +  (height / 10))
        {
          if(billFull)
          {
            //Don't add any more since will go off bill
            break;
          }//end if
          
          else
          {
            bill.add(drinks);
            total += drinks.price;
            
            //Can't fit any more than this on the screen
            if(bill.size() == 7)
            {
              billFull = true;
            }//end if
            break;
          }//end else
        }//end if
      }//end for
    }//end if
}//end mousePressed

void draw()
{
  background(200, 200, 200);
  displayProducts();
  displayBill();
}//end draw