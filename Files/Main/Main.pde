void setup()
{
  size(1366,768);
  
  dataInit();
  
  smooth(8);  
  imageMode(CENTER);
  eventHorizon.loop();
}

void draw()
{
  background(0);
  screenControl(); 
}

void movieEvent(Movie m)  
{
  m.read();
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
  
  //Insert game options here, map, difficulty etc
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

void drawActiveTowers()
{
  for(int i=0;i<activeTowers.size();i++)
  {
    if(activeTowers.get(i) instanceof cannon)
    {
      cannon c = (cannon)activeTowers.get(i);
      c.drawTower();
    
    }
    else if(activeTowers.get(i) instanceof AOE)
    {
      AOE a = (AOE)activeTowers.get(i);
      a.drawTower();
    }
  }
}

void drawEnemies()
{
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
  fill(0);
  stroke(255);
  strokeWeight(3);
   
  rect(0,0,menuWidth,height);
  fill(255);
  textSize(15);
  text("Money: " + money,5,0+textAscent());
  text("Limit: " + limit,5,0+textAscent()*2);
 
  noFill();
  
  for(int i=0;i<towerMenu.size();i++)
  {
    if(towerMenu.get(i) instanceof cannon)
    {
      cannon c = (cannon) towerMenu.get(i);
      c.pos.x = menuWidth/2;
      c.pos.y = height/6;
      
      c.drawTower(); 
      fill(255);
      text("Price: "+c.price,c.pos.x,c.pos.y+c.towerHeight/2+textAscent());
    }
     
    if(towerMenu.get(i) instanceof AOE)
    {
      AOE a = (AOE) towerMenu.get(i);
      a.pos.x = menuWidth/2;
      a.pos.y = height/4;
      a.drawTower();
      text("Price: "+a.price,a.pos.x,a.pos.y+a.towerHeight/2+textAscent());
    }
  }  
}

void drawRoundUI()
{
  textFont(gameFont,20);
  String r = ("Round:"+(currentRound+1)+"/"+"21");
  String e = ("Remaining Enemies:"+enemyTotal);
  float border = width/80;
  fill(0);
  stroke(255);
  strokeWeight(3);
  
  s = new button("Start",false,roundStartX,roundStartY,roundStartWidth,roundStartHeight);
  s.drawButton();
  
  q = new button("Quit",false,width - roundStartWidth - border,border,roundStartWidth,roundStartHeight); 
  q.drawButton();
  
  fill(255);
  textSize(25);
  text(r,(menuWidth/2)-(textWidth(r)/2),roundStartY-textAscent());
  
  textSize(20);
  text(e,menuWidth+5,height);
  
  textSize(15);
  text(rounds.get(currentRound).toString(),menuWidth+5,height-(textAscent()*7));
}

void drawSelectedTower()
{
  if(selectedTower instanceof cannon)
  {
    cannon c = (cannon)selectedTower;
    c.drawTower();
  }
  else if(selectedTower instanceof AOE)
  {
    AOE a = (AOE)selectedTower;
    a.drawTower();
  } 
}

void drawQCheck()
{
  
  float checkWidth = width/3;
  float checkHeight = height/3;
  float checkX = width/2 - checkWidth/2;
  float checkY = height/2 - checkHeight/2;
  String are = "Are you sure?";
  String all = "All progress will be lost";
  
  stroke(255);
  fill(0);
  rect(checkX,checkY,checkWidth,checkHeight);
  
  fill(255);
  textSize(30);
  text(are,checkX+(checkWidth/2)-textWidth(are)/2,checkY+checkHeight*.25);
  
  textSize(20);
  text(all,checkX+(checkWidth/2)-textWidth(all)/2,checkY+checkHeight*.5);
  
  yes = new button("Yes",false,checkX+checkWidth/4-5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  yes.drawButton();
  
  no = new button("No",false,checkX+checkWidth/2+5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  no.drawButton();
  
  
}