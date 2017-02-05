void screenControl()
{  
  switch(screenIndex)
  {
    case 0://Splash Screen
    {
      if(keyPressed && key == 32)
      {
        //skip animation
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
      resetGame();
      drawGameOver();

      if(r.clicked == true)
      {
        screenIndex = 2; 
      }
      
      if(m.clicked == true)
      {
        screenIndex = 1; 
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
  currentRound = 0;
  roundInitialised = false;
  roundStarted = false;
  roundEnded = false;
  placing = false;
  qCheck = false;
  menuIndex = 4;
  k=0;
  
  for(int i=0;i<menuOptions.size();i++)
  {
    menuOptions.get(i).clicked = false;
    menuOptions.get(i).hover = false;
  }
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
            
      //If Player clicks go, start game
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
  towerPlace();
  
  return false;
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
    else if(t instanceof sniper)
    {
      sniper s = (sniper)t;
      s.fire();
    }
    else if(t instanceof rocket)
    {
      rocket r = (rocket)t;
      r.fire();
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

ArrayList<enemy> rangeCheck(PVector pos, float range)
{
  ArrayList <enemy> inRange = new ArrayList<enemy>();
  for(int i=0;i<activeEnemies.size();i++)
  {
    enemy e = activeEnemies.get(i);
    float distance = dist(pos.x-e.source.x,pos.y-e.source.y,e.curr.x,e.curr.y);
   
    if(distance <= range)
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

void roundControl()//to Major Tom
{
  drawRoundUI();
  if(s.clicked == true)
  {
    roundStarted = true;
    roundEnded = false;
  }
  
  if(q.clicked == true || qCheck == true)
  {
    drawQCheck();
    
    if(yes.clicked == true)
    {
      resetGame();
      screenIndex = 1;
    }
    else if(no.clicked == true)
    {
      qCheck = false;
    }
    else
    {
      qCheck = true;
    }
  }
  
  if(enemyTotal == 0)
  {
    roundEnded = true; 
    roundStarted = false;
    enemies.clear();
    activeEnemies.clear();
    k=0;
    
    money+=300;
    score+=500;
    
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

void towerPlace()
{
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
      else if(towerMenu.get(i) instanceof sniper && money >= towerMenu.get(i).price)
      {
        selectedTower = new sniper();
        placing = true;
        break;
      }
      else if(towerMenu.get(i) instanceof rocket && money >= towerMenu.get(i).price)
      {
        selectedTower = new rocket();
        placing = true;
        break;
      }
    }
  }
    
  if(placing == true && selectedTower != null)
  {
      selectedTower.place();
      drawSelectedTower();
  }
}