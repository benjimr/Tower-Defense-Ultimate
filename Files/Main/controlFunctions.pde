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
      if(scoreCheck == true)
      {
        Table t3 = loadTable("data/highscores.csv","header");

        println(t3.getRowCount());
        for(int i=0;i<t3.getRowCount();i++)
        {
          TableRow row = t3.getRow(i);
          println(row.getString("Name"));
        }
        int lowest = 0;
            
        //find lowest in table
        for(int i=0;i<t3.getRowCount();i++)
        {
          TableRow row2 = t3.getRow(lowest);
          int s2 = row2.getInt("Score");
          
          TableRow row  = t3.getRow(i);
          int s = row.getInt("Score");

          if(s2>s)
          {
            lowest = i; 
          }
       }
      
       TableRow row = t3.getRow(lowest);
       println("Lowest = " +row.getInt("Score"));
      
       if(row.getInt("Score") < score)
       {
         row.setString("Name","Bob");
         row.setInt("Round",currentRound+1);
         row.setInt("Score",score);
         row.setString("Diff",difficulty);
         row.setString("Map",selectedMap);

       }
       
       saveTable(t3,"data/highscores.csv");

       scoreCheck = false;
      }
      
     
      
     
      drawGameOver();

      if(r.clicked == true)
      {
        resetGame();
        screenIndex = 2; 
      }
      
      if(m.clicked == true)
      {
        resetGame();
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
 // score = 0;
  currentRound = 0;
  roundInitialised = false;
  roundStarted = false;
  roundEnded = false;
  placing = false;
  qCheck = false;
  scoreCheck = true;
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
  textFont(gameFont,50);
  drawMainMenu();
  
  switch(menuIndex)
  {
    case 0://Play - game options
    {
      drawPlay();
      
      switch(difficulty)
      {
        case "Easy":
        {
          diffMult = 0.5;
          break;
        }
        case "Normal":
        {
          diffMult = 1;
          break;
        }
        case "Hard":
        {
          diffMult = 1.5;
          break;
        } 
      }
            
      //If Player clicks go, start game
      if(g.clicked)
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