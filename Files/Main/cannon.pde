class cannon extends tower
{  
  cannon()
  {
    super();
    damage = 20;
    rateOfFire = 1;
    towerColour = color(255,0,255);
    range = width/8;
    priority = "Heavy";
    price = 100;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    noFill();
    strokeWeight(3);
    
    if(target != null)
    {
      pushMatrix();
      translate(pos.x,pos.y);
      theta = atan2(target.curr.x-pos.x,target.curr.y-pos.y);
      rotate(-theta);
      
      ellipse(0,0,towerWidth,towerHeight);
      triangle(0+towerWidth/4,0+towerHeight/4,0,0-towerHeight/4,0-towerWidth/4,+towerHeight/4);  
      
      /*
      ellipse(pos.x,pos.y,towerWidth,towerHeight);
      triangle(pos.x,pos.y-towerHeight/4,pos.x+towerWidth/4,pos.y+towerHeight/4,pos.x-towerWidth/4,pos.y+towerHeight/4);  
    */
      if(placing == true && pos.x > menuWidth || clicked == true)
      {
        strokeWeight(1);
        ellipse(0,0,range*2,range*2);
      } 
   
      popMatrix(); 
    }
    
    
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos,range);
    
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
    else
    {
     target = null; 
    }
  }
}