void setup()
{
  println("start");
  size(1366,768);
  smooth(8);  
  splashFont = createFont("spektakel.otf",200);
  menuFont = createFont("CH-Thin.otf",200);
  
  dataInit();
  towerType();
}

void draw()
{
  background(0);
  screenControl();
  println(frameRate);
}

//SPLASH DRAW FUNCTION
void drawSplash()
{
 textFont(splashFont,50);
 
 String splashVal = "TD GAMES";
 float splashX = ((width/2)-(textWidth(splashVal)/2));
 float splashY = ((height/2)+(textAscent()/2)); 
 
 fill(255,255,255,splashOp);
 text(splashVal,splashX,splashY);
}

//IN MENU DRAW FUNCTIONS
void drawMainMenu()
{  
  for(int i=0;i<menuOptions.size();i++)
  {
    menuOptions.get(i).mouseDet();
    menuOptions.get(i).drawOption();
    
    if(menuOptions.get(i).clicked == true)
    {
      menuIndex = i; 
      selectedMenu = menuOptions.get(i);
    }
    
    if(menuOptions.get(i).hover == true)
    {
      titleCheck = true; 
    }
  }
}

void drawPlay()
{
  drawMenuBox();
  goWidth = menuBoxWidth/6;
  goHeight = menuBoxHeight/5;
  
  goX = startX + menuBoxWidth - goWidth/2;
  goY = menuBoxY + menuBoxHeight - goHeight - 20;
  
  rect(goX,goY,goWidth,goHeight);
  
  text("Go",goX + 20,goY+textAscent()+textDescent());
}

void drawHigh()
{
  drawMenuBox(); 
}

void drawAchieve()
{
  drawMenuBox(); 
}

void drawOptions()
{
  drawMenuBox(); 
}

void drawMenuBox()
{
  startX = selectedMenu.xVal + textWidth(selectedMenu.value) + 20;
  float endX = width/20;
  float lineY = selectedMenu.yVal - textDescent();
  
  pushMatrix();
  translate(startX,0);
  
  menuLineX = lerp(menuLineX,endX,0.1);
  
  menuBoxY = lerp(menuBoxY,lineY-menuBoxHeight/2,0.1);
  menuBoxWidth = lerp(menuBoxWidth,width/3,0.1);
  menuBoxHeight = lerp(menuBoxHeight,height/3,0.1);
  
  strokeWeight(1);
  stroke(255,0,0);
  line(0,lineY,menuLineX,lineY);
  
  noFill();
  rect(menuLineX,menuBoxY,menuBoxWidth,menuBoxHeight);
  popMatrix(); 
}

void drawTitle()
{
  textFont(splashFont,150);
  String name1 = "TOWER";
  String name2 = "DEFENSE";
  String name3 = "ULTIMATE";
  float xVal = (width*0.60);
  float yVal = height*0.30;
  
  fill(255);
  text(name1,xVal-(textWidth(name1)/2),yVal);
  text(name2,xVal-(textWidth(name2)/2),yVal+(textAscent()+textDescent())*1.4);
  text(name3,xVal-(textWidth(name3)/2),yVal+(textAscent()+textDescent())*2.8);

}

//IN GAME DRAW FUNCTIONS
void drawMap()
{
   for(int i=0;i<maps.size();i++)
   {
     if(maps.get(i).name.equals(selectedMap)) 
     {
       maps.get(i).drawMap(); 
     }
   }
}

void drawEnemies()
{
  noFill();
  strokeWeight(5);
  
  
  for(int i=0;i<enemies.size();i++)
  {
    enemy e = enemies.get(i);
    
    if(e instanceof basic)
    {
      basic b = (basic)enemies.get(i); 
      b.drawEnemy();
    }
    else if(e instanceof heavy)
    {
      heavy h = (heavy)enemies.get(i);
      h.drawEnemy();
    }
    else if(e instanceof fast)
    {
      fast f = (fast)enemies.get(i);
      f.drawEnemy();
    }
    
     e.moveEnemy();
  }
}

void drawTowerMenu()
{
   float menuWidth = width/10;
   
   fill(0);
   stroke(255);
   strokeWeight(3);
   
   rect(0,0,menuWidth,height);
   
   noFill();
   for(int i=0;i<towerMenu.size();i++)
   {
     if(towerMenu.get(i) instanceof cannon)
     {
        cannon c = (cannon) towerMenu.get(i);
        c.pos.x = menuWidth/2;
        c.pos.y = height/6;

        c.drawTower();
     }
     
     if(towerMenu.get(i) instanceof AOE)
     {
       AOE a = (AOE) towerMenu.get(i);
       a.pos.x = menuWidth/2;
       a.pos.y = height/4;
       a.drawTower();
     }
      
   }
   
   
}