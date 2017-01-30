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
    ellipse(pos.x,pos.y,range*2,range*2);
  }
  
  void fire()
  {
    basic b = rangeCheck(this); 
    
    if(b != null)
    {
      pushMatrix();
      translate(b.source.x,b.source.y);
      line(pos.x-b.source.x,pos.y-b.source.y,b.curr.x,b.curr.y);
      popMatrix();
    }  
  }
}