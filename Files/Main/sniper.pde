class sniper extends tower
{
  sniper()
  {
    super();
    damage = 100;
    rateOfFire = 0.5;
    towerColour = color(255,100,100);
    range = 600;
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
    
    if(placing == true && pos.x > menuWidth || clicked == true)
    {
      strokeWeight(1);
      noFill();
      ellipse(pos.x,pos.y,range*2,range*2);
    } 
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(this);
    
    if(inRange != null )
    {
      super.choose(inRange);
     
      if(millis()-timeDamage >= 1000/rateOfFire && target != null && placing == false)  
      {    
        target.takeDamage(damage);
        timeDamage = millis();
        drawShot = true;
      } 
      
      if(drawShot == true)
      {
        pushMatrix();
        translate(target.source.x,target.source.y);
        strokeWeight(5);
        stroke(255,0,0);
        line(pos.x-target.source.x,pos.y-target.source.y,target.curr.x,target.curr.y);
        popMatrix();
        
        if(millis()-timeDraw > (1000/rateOfFire)/3)
        {
          drawShot = false;
          timeDraw = millis();
        } 
      }
    }
  }
}