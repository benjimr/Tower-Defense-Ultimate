
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
      gameControl();
      break;
    }
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

void gameControl()
{
  roundData();
  drawMap(); 
  drawEnemies();
  drawTowerMenu();
  drawActiveTowers();
  
  for(int i=0;i<activeTowers.size();i++)
  {
    tower t = activeTowers.get(i); 
    
    if(t instanceof cannon)
    {
      cannon c = (cannon)t;
      c.fire();
      
    }
  }
  
  for(int i=0;i<towerMenu.size();i++)
  {
    PVector pos = towerMenu.get(i).pos;
    float tWidth = towerMenu.get(i).towerWidth;
    float tHeight = towerMenu.get(i).towerHeight;
    
    if(mouseX > pos.x - tWidth/2 && mouseX < pos.x + tWidth/2 && mouseY > pos.y - tHeight/2 && mouseY < pos.y+tHeight/2 && mousePressed)
    {
      if(towerMenu.get(i) instanceof cannon)
      {
        selectedTower = new cannon();
        placing = true;
        break;
      }
      else if(towerMenu.get(i) instanceof AOE)
      {
        selectedTower = new AOE();
        placing = true;
        break;
      }
      

    }
    
    if(!mousePressed && selectedTower != null && placing == true)
    {
      activeTowers.add(selectedTower);
      placing = false;
      selectedTower = null;
    }

  }
    
  if(placing == true)
  {
      selectedTower.place();
      drawSelectedTower();
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

basic rangeCheck(tower t)
{
  for(int i=0;i<basics.size();i++)
  {
    basic b = basics.get(i);

    float range = dist(t.pos.x-b.source.x,t.pos.y-b.source.y,b.curr.x,b.curr.y);
    
    if(range <= t.range)
    {
      return b; 
    }
  }
  return null;
}