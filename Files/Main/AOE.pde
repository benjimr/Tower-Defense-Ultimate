class AOE extends tower
{
  AOE()
  {
    super();
    damage = 10;
    rateOfFire = 2;
    towerColour = color(0,255,255);
    towerWidth = 50;
    towerHeight = 50;
    range = 50;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    ellipse(pos.x,pos.y,towerWidth/2,towerHeight/2);
  }
}