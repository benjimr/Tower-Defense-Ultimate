void setup()
{
  println("start");
  fullScreen(2);
  smooth(8);  
  splashFont = createFont("spektakel.otf",200);
  menuFont = createFont("CH-Thin.otf",200);
  
  dataInit();
}

void draw()
{
  background(0);
  screenControl();
 // println(rounds.get(currentRound).toString());
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
/*
  if(titleCheck == false && mousePressed)
  {
    menuIndex = 4;
    
    for(int i=0;i<menuOptions.size();i++)
    {
      menuOptions.get(i).clicked = false;
      menuOptions.get(i).hover = false;
    }
  }
  else
  {
   titleCheck =false; 
  }
  */
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
{/*
  for(int i=0;i<basics.size();i++)
  {
    basics.get(i).drawEnemy(); 
    basics.get(i).moveEnemy();
    
  }
  */
  
  basics.get(0).drawEnemy(); 
  basics.get(0).moveEnemy();
}