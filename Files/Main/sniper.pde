class sniper extends tower
{
  sniper()
  {
    super();
    damage = 100;
    rateOfFire = 0.5;
    towerColour = color(255,100,100);
    range = width*2;
    price = 300;
  }
  
  void drawTower()
  {
    strokeWeight(3);
    stroke(towerColour);
    noFill();
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    
    strokeWeight(5);
    line(pos.x,pos.y+towerHeight/5,pos.x,pos.y-towerHeight/2.25);
  }
}