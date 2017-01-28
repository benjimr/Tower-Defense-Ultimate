class cannon extends tower
{
  cannon()
  {
    super();
    damage = 50;
    rateOfFire = 2;
    towerColour = color(255,0,255);
    towerWidth = 50;
    towerHeight = 50;
    range = 100;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    triangle(pos.x,pos.y-towerHeight/4,pos.x+towerWidth/4,pos.y+towerHeight/4,pos.x-towerWidth/4,pos.y+towerHeight/4);
  }
}