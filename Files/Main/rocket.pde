class rocket extends tower
{
   PVector curr;
   PVector source;
   PVector forward;
   PVector blastLoc;
   float speed;
   boolean currSet;
   float AOE;
   boolean drawBlast;
   float pulse;
  
  rocket()
  {
    super();
    damage = 100;
    rateOfFire = 0.25;
    towerColour = color(150,100,150);
    range =width/5;
    price = 450;
    speed = 6;
    currSet = true;
    AOE = 100;
    drawBlast = false;
    pulse = 0;
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
    ArrayList<enemy> inRange = rangeCheck(pos,range);

    if(currSet == true)
    {
      curr = new PVector(pos.x,pos.y);
      currSet = false;
    }
    
    
    if(inRange != null && drawShot == false)
    {
        super.choose(inRange);
    }
    
    if(!(activeEnemies.contains(target)))
    {
      target = null;
      drawShot = false;
      curr.x = source.x;
      curr.y = source.y;
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
    
      if(dist(curr.x,curr.y,dest.x,dest.y) < 10)
      {         
        blastLoc = new PVector(curr.x,curr.y);
        curr.x = source.x;
        curr.y = source.y;
        target = null;
        drawShot = false; 
        drawBlast = true;
      }
    }
    
    if(drawBlast == true)
    {
      ArrayList<enemy> inBlast = rangeCheck(blastLoc,AOE);

       
      stroke(0,255,0);
      strokeWeight(4);
      noFill();
      
      pulse = lerp(pulse,AOE*2,0.1);
      
      if(pulse > (AOE*2)-1)
      {
        pulse = 0;
        drawBlast = false;  
      }
      else if(pulse > AOE && inBlast != null)
      {
        for(int i=0;i<inBlast.size();i++)
        {
          inBlast.get(i).takeDamage(damage); 
        }
      }

      
      
      ellipse(blastLoc.x,blastLoc.y,pulse,pulse);
    }
  }
}