class rocket extends tower
{
  rocket()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    towerColour = color(150,100,150);
    range =width/2;
    price = 450;
  }
  
  void drawTower()
  {
    strokeWeight(3);
    stroke(towerColour);
    noFill();
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    
    rect(pos.x-towerWidth/3,pos.y-towerHeight/3,towerWidth/2,towerHeight);
  }
}