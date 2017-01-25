
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
  //things common to all menu options
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
}