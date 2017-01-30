class AOE extends tower
{
  float pulse = towerWidth/2;
  AOE()
  {
    super();
    damage = 1;
    rateOfFire = 2;
    towerColour = color(0,255,255);
    towerWidth = 50;
    towerHeight = 50;
    range = 100;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    ellipse(pos.x,pos.y,towerWidth/2,towerHeight/2);
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(this);
    
    if(inRange != null)
    {
      stroke(towerColour);
      strokeWeight(2);
      pulse = lerp(pulse,range*2,0.1);
      ellipse(pos.x,pos.y,pulse,pulse);
      
     if(pulse > (range*2)-1)
      {
        pulse = towerWidth/2;
      }
      
      for(int i=0;i<inRange.size();i++)
      {
        inRange.get(i).takeDamage(damage); 
      }
    }
    else
    {
      
        pulse = towerWidth/2; 
      
    }
  }
}