class cannon extends tower
{  
  float theta;
  cannon()
  {
    super();
    damage = 100;
    rateOfFire = 1;
    towerColour = color(255,0,255);
    towerWidth = 50;
    towerHeight = 50;
    range = 200;
    priority = "Heavy";
    theta = 0;
    price = 100;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    noFill();
    strokeWeight(3);
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    
     pushMatrix();
     translate(pos.x,pos.y);

    if(target != null)
    {
      theta = lerp(theta,atan2(target.curr.x,target.curr.y),0.1);
      rotate(theta);
      triangle(0,towerHeight/4,towerWidth/4,-towerHeight/4,-towerWidth/4,-towerHeight/4); 
    }
    else
    {
       theta = lerp(theta,0,0.1);
       rotate(theta);
       triangle(0,towerHeight/4,towerWidth/4,-towerHeight/4,-towerWidth/4,-towerHeight/4);
    }
         
    popMatrix();
   
    if(placing == true && pos.x > menuWidth || clicked == true)
    {
      strokeWeight(1);
      ellipse(pos.x,pos.y,range*2,range*2);
    }
    
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(this);
    
    if(inRange != null )
    {
      super.choose(inRange);
     
      if(millis()-timeDamage >= rateOfFire*1000 && target != null)  
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
        
        if(millis()-timeDraw > 500)
        {
          drawShot = false;
          timeDraw = millis();
       } 
      }
    }
    
  }
  
  
}