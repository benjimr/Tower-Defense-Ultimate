class rocket extends tower
{
   PVector curr;
   PVector source;
   PVector forward;
   float speed;
   boolean currSet;
  
  rocket()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    towerColour = color(150,100,150);
    range =300;
    price = 450;
    speed = 6;
    forward = new PVector(1,1);
    currSet = true;
  }
  
  void drawTower()
  {
    strokeWeight(3);
    stroke(towerColour);
    noFill();
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    fill(0);
    rect(pos.x-towerWidth/4,pos.y-towerHeight/1.5,towerWidth-towerWidth/2,towerHeight);
    
    if(placing == true && pos.x > menuWidth || clicked == true)
    {
      strokeWeight(1);
      noFill();
      ellipse(pos.x,pos.y,range*2,range*2);
      
      
      source = new PVector(pos.x,pos.y);
      

    } 
  }
  
  void fire()
  {
    if(currSet == true)
    {
      curr = new PVector(pos.x,pos.y);
      currSet = false;
    }
    
    ArrayList<enemy> inRange = rangeCheck(this);
    
    if(inRange != null && drawShot == false)
    {
      super.choose(inRange);
    }
    
    if(target != null && millis() - timeDamage  >= 1000/rateOfFire && placing == false)
    {
      timeDamage = millis();
      drawShot = true;
    }
    
    if(drawShot == true)
    {
      PVector dest = new PVector(target.curr.x+target.source.x,target.curr.y+target.source.y);
   
      forward = PVector.sub(dest,curr);
      forward.normalize();
        
      curr.add(PVector.mult(forward,speed)); 
              
      stroke(0,255,0);
      strokeWeight(10);
      fill(0,255,0);
      point(curr.x,curr.y);
      
      stroke(255,0,0);
      point(dest.x,dest.y);
      
      stroke(0,0,255);
      point(source.x,source.y);
    
      if(dist(curr.x,curr.y,dest.x,dest.y) < 10 )
      {
        drawShot = false; 
        target.takeDamage(damage);
        curr.x = source.x;
        curr.y = source.y;
      }
  
    }
    
    
     
        

  }
}