void screenControl()
{  
  switch(screenIndex)
  {
    case 0://Splash Screen
    {
      if(keyPressed && key == 32)
      {
        screenIndex = 1;  
      }
      else if(splashOp >=0 && splashOp <255 && splashCheck == false)
      {
       splashOp += 2;
      }
      else if(splashOp > 255)
      {
        splashCheck = true;
        splashOp -= 2;
      }
      else if(splashOp >= 0)
      {
       splashOp -= 2; 
      }
      else
      {
       screenIndex = 1;//go to menu 
      }
      
      drawSplash();
      break;
    }
    case 1://Menu Screen
    {
      menuControl();
      break;
    }
    case 2://Game Screen
    {
      if(gameControl() == true)
      {
        screenIndex = 3;
      }
      break;
    }
    case 3://Game over
    {
      textSize(50);
      fill(255);
      
      String gOver = "Game Over";
      
      text(gOver,(width/2)-(textWidth(gOver)/2),height/2);
      
      button r = new button("Restart",false,width/2,height/2,width/10,height/10);
      r.drawButton();
      
      if(r.clicked == true)
      {
        resetGame();
        screenIndex = 2; 
      }
      break;
    }
  }
}

void resetGame()
{
  activeTowers.clear();
  activeEnemies.clear();
  enemies.clear();
  basics.clear();
  fasts.clear();
  heavys.clear();
  selectedTower = null;
  limit = 20;
  money = 1000;
  enemyTotal = 0;
  currentRound = 0;
  roundInitialised = false;
  roundStarted = false;
  roundEnded = false;
  placing = false;
}

void menuControl()
{
  textFont(menuFont,50);
  drawMainMenu();
  
  switch(menuIndex)
  {
    case 0://Play - game options
    {
      drawPlay();
      
      if(mouseX > goX && mouseX < goX + goWidth && mouseY > goY && mouseY <goY + goHeight && mousePressed)
      {
        screenIndex = 2; 
      }
      break;
    }
    case 1://High Scores 
    {
      drawHigh();
      break;
    }
    case 2://Acheivements
    {
      drawAchieve();
      break;
    }
    case 3://Options
    {
      drawOptions();
      break;
    }
    case 4://Title
    {
      drawTitle();
    }
  }
}

boolean gameControl()
{
  println(currentRound);
  if(limit == 0)
  {
    return true;
  }
  
  if(roundInitialised == false)
  {
    roundData();
    roundInitialised = true;
  }
  
  drawMap(); 
  drawActiveTowers();
  
  
  if(roundStarted == true && roundInitialised == true && roundEnded == false)
  {
    drawEnemies();
    removeDeadEnemy();
    towerFire();

  }
  drawTowerMenu();
  towerData();
  roundControl();

  
  for(int i=0;i<towerMenu.size();i++)
  {
    PVector pos = towerMenu.get(i).pos;
    float tWidth = towerMenu.get(i).towerWidth;
    float tHeight = towerMenu.get(i).towerHeight;
    
    if(mouseX > pos.x - tWidth/2 && mouseX < pos.x + tWidth/2 && mouseY > pos.y - tHeight/2 && mouseY < pos.y+tHeight/2 && mousePressed)
    {
      if(towerMenu.get(i) instanceof cannon && money >= towerMenu.get(i).price)
      {
        selectedTower = new cannon();
        placing = true;
        break;
      }
      else if(towerMenu.get(i) instanceof AOE && money >= towerMenu.get(i).price)
      {
        selectedTower = new AOE();
        placing = true;
        break;
      }
    }
  }
    
  if(placing == true)
  {
      selectedTower.place();
      drawSelectedTower();
  }
  
  return false;
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

ArrayList<enemy> rangeCheck(tower t)
{
  ArrayList <enemy> inRange = new ArrayList<enemy>();
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
    float range = dist(t.pos.x-e.source.x,t.pos.y-e.source.y,e.curr.x,e.curr.y);
   
    if(range <= t.range)
    {
       inRange.add(e);
    }
  }
  
  if(inRange.size() > 0)
  {
    return inRange;
  }
  else
  {
    return null;
  }
}

void removeDeadEnemy()
{
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
    
    if(e.deadCheck() == true)
    {
      activeEnemies.remove(i); 
      enemyTotal--;
    }
  }
}

void roundControl()
{
  drawRoundUI();
  if(mouseX > roundStartX && mouseX < roundStartX+roundStartWidth && mouseY > roundStartY && mouseY < roundStartY+roundStartHeight && mousePressed)
  {
    roundStarted = true;
    roundEnded = false;
  }
  if(enemyTotal == 0)
  {
    roundEnded = true; 
    roundStarted = false;
    enemies.clear();
    activeEnemies.clear();
    k=0;
    if(currentRound<20)
    {
      text("Round "+(currentRound+1)+" Complete",width/2,height/2);
      currentRound++;
      
    }
    else
    {
      text("Complete",width/2,height/2); 
    }
    
    roundData();
  }
  
}

void towerFire()
{
  for(int i=0;i<activeTowers.size();i++)
  {
    tower t = activeTowers.get(i); 
    
    if(t instanceof cannon)
    {
      cannon c = (cannon)t;
      c.fire(); 
    }
    else if(t instanceof AOE)
    {
      AOE a = (AOE)t;
      a.fire();
    }
  }
}

void towerData()
{
 for(int i=0;i<activeTowers.size();i++)
 {
   activeTowers.get(i).isClicked(); 
   
   if(activeTowers.get(i).clicked == true)
   {
     activeTowers.get(i).drawData();
   } 
 }

}