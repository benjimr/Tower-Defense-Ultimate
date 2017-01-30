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
    priority = "Heavy";
  }
  
  void drawTower()
  {
    stroke(towerColour);
    
    strokeWeight(3);
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    triangle(pos.x,pos.y-towerHeight/4,pos.x+towerWidth/4,pos.y+towerHeight/4,pos.x-towerWidth/4,pos.y+towerHeight/4);
    strokeWeight(1);
    ellipse(pos.x,pos.y,range*2,range*2);
  }
  
  void fire()
  {
    enemy e = rangeCheck(this); 
    
    if(e != null)
    {
      pushMatrix();
      translate(e.source.x,e.source.y);
      line(pos.x-e.source.x,pos.y-e.source.y,e.curr.x,e.curr.y);
      popMatrix();
    }  
  }
  
  
}