class cannon extends tower
{  
  cannon()
  {
    super();
    damage = 5;
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
   // strokeWeight(1);
   // ellipse(pos.x,pos.y,range*2,range*2);
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(this);
    if(inRange != null)
    {
      enemy e = super.choose(inRange);
      
      pushMatrix();
      translate(e.source.x,e.source.y);
      strokeWeight(3);
      stroke(255,0,0);
      line(pos.x-e.source.x,pos.y-e.source.y,e.curr.x,e.curr.y);
      popMatrix();
      e.takeDamage(damage);
    }  
    
    
  }
  
  
}