class boss extends enemy
{
  boss()
  {
    super();
    entityColour = color(255,255,100);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1;
    health = health2 = (1000*diffMult)*(1+(currentRound+1+overtimeRound)/10);
    value = 1000;
  } 
  
  void drawEnemy()
  {
    
  }
}