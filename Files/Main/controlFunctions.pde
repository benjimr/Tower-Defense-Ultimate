
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
  
  for(int i=0;i<towerMenu.size();i++)
  {
    PVector pos = towerMenu.get(i).pos;
    float tWidth = towerMenu.get(i).towerWidth;
    float tHeight = towerMenu.get(i).towerHeight;
    
    if(mouseX > pos.x - tWidth/2 && mouseX < pos.x + tWidth/2 && mouseY > pos.y - tHeight/2 && mouseY < pos.y+tHeight/2 && mousePressed)
    {
      if(towerMenu.get(i) instanceof cannon)
      {
        cannon c = new cannon();
        c.place();
        c.drawTower();
        break;
      }
      else if(towerMenu.get(i) instanceof AOE)
      {
        AOE a = new AOE();
        a.place();
        a.drawTower();
        break;
      }
    }
    
  }
}