void setup()
{
  size(1366,768);
  smooth(8);  
  splashFont = createFont("spektakel.otf",200);
  menuFont = createFont("CH-Thin.otf",200);
  gameFont = createFont("pixel.otf",200);
  
  menuWidth = width/6;
  roundStartX = menuWidth*0.15;
  roundStartY = height*0.9;
  roundStartWidth = menuWidth*.70;
  roundStartHeight = height/15;
 
  dataInit();
  towerType();
}

float timeDelta = 0;
float timeAccumulator = 0;
int last = 0;


void draw()
{
  background(0);
  screenControl();
  /*
  int now = millis();
  timeDelta = (now - last)/1000.0f;
  last = now;
  
  timeAccumulator += timeDelta;
  
  println(timeDelta);
  println(timeAccumulator);
  
      if (timeAccumulator >= 0 && timeAccumulator < 1)  
      {    
        background(255, 0, 0);  
      }  
      if (timeAccumulator >= 1 && timeAccumulator < 2)  
      {    
        background(0, 0, 255);  
      }    
      if (timeAccumulator >= 2)   
      {    
        timeAccumulator = 0;  
      }  
      */
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
   // println("ArrayList size = "+activeEnemies.size()+"\t"+"Enemy Total = "+enemyTotal);

  noFill();
  strokeWeight(5);
  
  if(k<enemies.size() && frameCount % 15 == 0)
  {
    enemy e = enemies.get(k);
    activeEnemies.add(e);
    k++;
  }
  
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
   if(e instanceof basic)
    {
      basic b = (basic)activeEnemies.get(i); 
      b.drawEnemy();
    }
    else if(e instanceof heavy)
    {
      heavy h = (heavy)activeEnemies.get(i);
      h.drawEnemy();
    }
    else if(e instanceof fast)
    {
      fast f = (fast)activeEnemies.get(i);
      f.drawEnemy();
    }
    
     e.moveEnemy();
  } 
}
 

void drawTowerMenu()
{
   fill(0,0,50);
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

void drawRoundUI()
{
  textFont(gameFont,20);
  String go = "Start";
  String r = ("Round:"+(currentRound+1)+"/"+"21");
  String e = ("Remaining Enemies:"+enemyTotal);
  fill(0);
  stroke(255,0,0);
  rect(roundStartX,roundStartY,roundStartWidth,roundStartHeight);
  
  fill(255,0,0);
  text(go,roundStartX+(roundStartWidth/2)-textWidth(go)/2,(roundStartY+(roundStartHeight/2))+textAscent()/2);
  
  textSize(25);
  text(r,(menuWidth/2)-(textWidth(r)/2),roundStartY-textAscent());
  
  textSize(20);
  text(e,menuWidth+5,height);
  
  textSize(15);
  text(rounds.get(currentRound).toString(),menuWidth+5,height-(textAscent()*7));
  //println(rounds.get(currentRound));
  
  
  
}