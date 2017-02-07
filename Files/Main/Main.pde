void setup()
{
  size(1366,768);
  //fullScreen();
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
  textFont(splashFont,40);
 
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
  
  textSize(15);
 ;
  String type = "Name: ";
  fill(255);
  text(type,(width/2)-textWidth(type),height-100);
  text(Name,(width/2)-textWidth(Name)/2,height-100);
  
  if(keyPressed)
  {
    if(key == 8) 
    {
      if (Name.length() > 0) 
      {
        Name = Name.substring(0, Name.length()-1);
      }
    }
    else if (key == 127)
    {
      Name = "";
    } 
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && Name.length() < 4) 
    {
      Name = Name + key;
    }
    delay(100);
  }
}

void drawPlay()
{
  float border = menuBoxWidth/20;
  float bottom = 0;
  drawMenuBox();
  goWidth = menuBoxWidth/6;
  goHeight = menuBoxHeight/7;
  
  goX = startX + menuBoxWidth - goWidth/2;
  goY = menuBoxY + menuBoxHeight - goHeight-border;
 

  
  ArrayList<button> mapChoice = new ArrayList<button>();
  fill(255);
  
  for(int i=0;i<maps.size();i++)
  {
     button b = new button(maps.get(i).name,false, menuLineX+startX+border,menuBoxY+(goHeight*i)+border+(border*i),goWidth,goHeight);
     mapChoice.add(b);
     
     if(i == maps.size()-1)
     {
       bottom = menuBoxY+(goHeight*i)+border+(border*i);
     }
     
     if(selectedMap == maps.get(i).name)
     {
        for(int j=0;j<maps.get(i).points.size()-1;j++)
        {
           float x1 = map(map(maps.get(i).points.get(j).x,menuWidth+100,width-100,0,20),0,20,menuLineX+startX+goWidth*2,menuLineX+menuBoxWidth+startX-border);
           float y1 = map(map(maps.get(i).points.get(j).y,100,height-156,0,20),0,20,menuBoxY+border,menuBoxHeight);
           float x2 = map(map(maps.get(i).points.get(j+1).x,menuWidth+100,width-100,0,20),0,20,menuLineX+startX+goWidth*2,menuLineX+menuBoxWidth+startX-border);
           float y2 = map(map(maps.get(i).points.get(j+1).y,100,height-156,0,20),0,20,menuBoxY+border,menuBoxHeight);
           
           line(x1,y1,x2,y2);
        }
     }
  }
  
  for(int i=0;i<mapChoice.size();i++)
  {
    mapChoice.get(i).drawButton(); 
    
    if(mapChoice.get(i).clicked == true)
    {
      selectedMap = mapChoice.get(i).label; 
    }
  }
  String[] diff = {"Easy","Normal","Hard"};
  for(int i=0;i<diff.length;i++)
  {
    button b = new button(diff[i],false,menuLineX+startX+((border/2)*(i+3))+goWidth*(i+1),bottom,goWidth,goHeight);
    
    b.drawButton();
    
    if(b.clicked == true)
    {
      difficulty = diff[i]; 
    }
  }
  textSize(9);
  text(difficulty,goX-textWidth(difficulty)/2,bottom-goHeight);
  
  g = new button("Go",false,goX+border,bottom,goWidth,goHeight);
  g.drawButton();
  

}

void drawHigh()
{
  float border = menuBoxWidth/20;
  float sectionWidth = menuBoxWidth/6;
  
  drawMenuBox(); 
  textSize(10);
  
  ArrayList<TableRow> scores = new ArrayList<TableRow>();

  Table t3 = loadTable("data/highscores.csv","header");
 
  for(int i=0;i<t3.getRowCount();i++)
  {
    scores.add(t3.getRow(i));
  }
  
  for(int i=0;i<scores.size();i++)
  {
    for(int j=1;j<scores.size()-i;j++)
    {
      int score = scores.get(j-1).getInt("Score");
      int score1 = scores.get(j).getInt("Score");

      if(score > score1)
      {
        TableRow temp = scores.get(j-1);
        scores.set(j-1,scores.get(j));
        scores.set(j,temp);
      }
    }
   }
 
  Collections.reverse(scores);
  
  fill(255);
  for(int i=0;i<scores.size();i++)
  {
    TableRow row = scores.get(i);
    text(row.getString("Name"),menuLineX+startX+border,menuBoxY+border*2+textAscent()*3*i);
    text(row.getInt("Round"),menuLineX+startX+border+sectionWidth,menuBoxY+border*2+textAscent()*3*i);
    text(row.getInt("Score"),menuLineX+startX+border+sectionWidth*1.5,menuBoxY+border*2+textAscent()*3*i);
    text(row.getString("Diff"),menuLineX+startX+border+sectionWidth*3,menuBoxY+border*2+textAscent()*3*i);
    text(row.getString("Map"),menuLineX+startX+border+sectionWidth*4.5,menuBoxY+border*2+textAscent()*3*i); 
  }
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
  startX = width/3;
  
  float endX = width/20;
  float lineY = selectedMenu.yVal - textAscent();

  pushMatrix();
  translate(startX,0);
  point(0,0);
  
  menuLineX = lerp(menuLineX,endX,0.1);
  
  menuBoxY = lerp(menuBoxY,lineY-menuBoxHeight/2,0.1);
  menuBoxWidth = lerp(menuBoxWidth,width/3,0.1);
  menuBoxHeight = lerp(menuBoxHeight,height/3,0.1);
  
  strokeWeight(1);
  stroke(255);
  line(0,lineY,menuLineX,lineY);
  
  noFill();
  rect(menuLineX,menuBoxY,menuBoxWidth,menuBoxHeight);
  
  popMatrix(); 
  

}

void drawTitle()
{
  textFont(splashFont,100);
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
    else if(activeTowers.get(i) instanceof sniper)
    {
      sniper s = (sniper)activeTowers.get(i);
      s.drawTower();
    }
    else if(activeTowers.get(i) instanceof rocket)
    {
      rocket r = (rocket)activeTowers.get(i);
      r.drawTower();
    }
    
  }
}

void drawEnemies()
{
  noFill();
  strokeWeight(5);
  
  if(k<enemies.size() && frameCount % 35 == 0)
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
  String l = "Laser Cannon";
  String p = "Pulser";
  String sn = "Sniper";
  String rl = "Launcher";
  fill(0);
  stroke(255);
  strokeWeight(3);
   
  rect(0,0,menuWidth,height);
  fill(255);
  textSize(10);
  text("Money: " + money,5,textAscent()*2+5);
  text("Limit: " + limit,5,textAscent()*4+5);
  text("Score: " + score,5,textAscent()*6+5);
  
 
  noFill();
  textSize(7);
  for(int i=0;i<towerMenu.size();i++)
  {
    if(towerMenu.get(i) instanceof cannon)
    {
      cannon c = (cannon) towerMenu.get(i);
      c.pos.x = menuWidth/4;
      c.pos.y = height*.12;
      
      c.drawTower(); 
      fill(255);
      text(l,c.pos.x+textWidth(l)*0.3,c.pos.y-c.towerHeight*0.2);
      text("Price: "+c.price,c.pos.x+textWidth(l)*0.3,c.pos.y-(c.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(c.damage*c.rateOfFire),c.pos.x+textWidth(l)*0.3,c.pos.y-(c.towerHeight*0.2)+textAscent()*4);
      
    }
     
    if(towerMenu.get(i) instanceof AOE)
    {
      AOE a = (AOE) towerMenu.get(i);
      a.pos.x = menuWidth/4;
      a.pos.y = height*0.22;
      a.drawTower();
      text(p,a.pos.x+textWidth(l)*0.3,a.pos.y-a.towerHeight*0.2);
      text("Price: "+a.price,a.pos.x+textWidth(l)*0.3,a.pos.y-(a.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(a.damage*a.rateOfFire)+"(AOE)",a.pos.x+textWidth(l)*0.3,a.pos.y-(a.towerHeight*0.2)+textAscent()*4);
    }
    
    if(towerMenu.get(i) instanceof sniper)
    {
      sniper s = (sniper) towerMenu.get(i);
      s.pos.x = menuWidth/4;
      s.pos.y = height*0.32;
      fill(255);
      text(sn,s.pos.x+textWidth(l)*0.3,s.pos.y-s.towerHeight*0.2);
      text("Price: "+s.price,s.pos.x+textWidth(l)*0.3,s.pos.y-(s.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(s.damage*s.rateOfFire),s.pos.x+textWidth(l)*0.3,s.pos.y-(s.towerHeight*0.2)+textAscent()*4);
      s.drawTower();
    }
    
    if(towerMenu.get(i) instanceof rocket)
    {
      rocket r = (rocket) towerMenu.get(i);
      r.pos.x = menuWidth/4;
      r.pos.y = height*0.42;
      text(rl,r.pos.x+textWidth(l)*0.3,r.pos.y-r.towerHeight*0.2);
      text("Price: "+r.price,r.pos.x+textWidth(l)*0.3,r.pos.y-(r.towerHeight*0.2)+textAscent()*2);
      text("Dps: "+ (int)(r.damage*r.rateOfFire)+" (AOE)",r.pos.x+textWidth(l)*0.3,r.pos.y-(r.towerHeight*0.2)+textAscent()*4);
      r.drawTower();
    }
  }  
}

void drawRoundUI()
{
  textFont(gameFont,10);
  String r;
  if(overtime == false)
  {
    r = ("Round:"+(currentRound+1)+"/"+"21");
  }
  else
  {
     r = ("Round:"+(currentRound+1+overtimeRound));
  }
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
  textSize(12);
  text(r,(menuWidth/2)-(textWidth(r)/2),roundStartY-textAscent());
  
  textSize(10);
  text(e,menuWidth+5,height);
  
  textSize(10);
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
  else if( selectedTower instanceof sniper)
  {
    sniper s = (sniper)selectedTower;
    s.drawTower();
  }
  else if(selectedTower instanceof rocket)
  {
    rocket r = (rocket)selectedTower;
    r.drawTower();
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
  textSize(15);
  text(are,checkX+(checkWidth/2)-textWidth(are)/2,checkY+checkHeight*.25);
  
  textSize(10);
  text(all,checkX+(checkWidth/2)-textWidth(all)/2,checkY+checkHeight*.5);
  
  yes = new button("Yes",false,checkX+checkWidth/4-5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  yes.drawButton();
  
  no = new button("No",false,checkX+checkWidth/2+5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  no.drawButton();
}

void drawConCheck()
{
  float checkWidth = width/3;
  float checkHeight = height/3;
  float checkX = width/2 - checkWidth/2;
  float checkY = height/2 - checkHeight/2;
  String grat = "Congratulations";
  String beat = "You have beaten the game";
  String sc = "Score = " + score;
  String diff = "Difficuly: " +difficulty;
  String cont = "Do you wish to continue?";
  
  stroke(255);
  fill(0);
  rect(checkX,checkY,checkWidth,checkHeight);
  
  fill(255);
  textSize(15);
  text(grat,checkX+(checkWidth/2)-textWidth(grat)/2,checkY+checkHeight*.25);
  
  textSize(10);
  text(beat,checkX+(checkWidth/2)-textWidth(beat)/2,checkY+checkHeight*.5);
  
  con = new button("Yes",false,checkX+checkWidth/4-5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  con.drawButton();
  
  fin = new button("No",false,checkX+checkWidth/2+5,checkY+checkHeight*.75,checkWidth/4,checkHeight/5);
  fin.drawButton();
}

void drawGameOver()
{
  float overWidth = width/3;
  float overHeight = height/3;
  float overX = (width/2)-overWidth/2;
  float overY = (height/2)-overHeight/2;
  String g = "Game Over";
  String s = "Score: " + score;
  
  fill(0);
  stroke(255);
  rect(overX,overY,overWidth,overHeight);
  
  textSize(25);
  fill(255);
  text(g,overX+(overWidth/2)-textWidth(g)/2,overY+(overHeight*0.40));
  
  textSize(15);
  text(s,overX+(overWidth/2)-textWidth(s)/2,overY+(overHeight*.55));
  
  r = new button("Retry",false,overX+(overWidth*.15)-5,overY+(overHeight*.65),overWidth/3,overHeight/5);
  r.drawButton();
  
  m = new button("Menu",false,overX+(overWidth*.15)+(overWidth/3)+5,overY+overHeight*.65,overWidth/3,overHeight/5);
  m.drawButton();
  
  
}