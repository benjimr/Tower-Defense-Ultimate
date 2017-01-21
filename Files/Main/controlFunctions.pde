
void screenControl()
{  
  switch(screenIndex)
  {
    case 0://Splash Screen
    {
      if(splashOp >=0 && splashOp <255 && splashCheck == false)
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
      break;
    }
    case 1://High Scores 
    {
      text("high scores",width/2,height/2);
      break;
    }
    case 2://Acheivements
    {
      text("achievements",width/2,height/2);
      break;
    }
    case 3://Options
    {
      text("options",width/2,height/2);
      break;
    }
    case 4://Title
    {
      drawTitle();
    }
  }
}