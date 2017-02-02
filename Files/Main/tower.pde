abstract class tower
{
   PVector pos;
   float damage;
   float rateOfFire;
   color towerColour;
   float towerWidth;
   float towerHeight;
   float range;
   String priority;
   enemy target;
   boolean changeTarget;
   int timeDamage;
   int timeDraw;
   boolean drawShot;
   String preference;
   boolean clicked;
   
   tower()
   {
     pos = new PVector(0,0);
    timeDamage = millis();
     timeDraw = millis();
     drawShot = false;
     preference = "first";
     changeTarget = false;
     target = null;
     clicked = false;
   }
   
   
   void place()
   {
     pos.x = mouseX;
     pos.y = mouseY;
     
     if(mousePressed)
     {
       placing = true;
     }
     else
     {
       placing = false;
     }
   }
   
   void choose(ArrayList<enemy> inRange)
   {
     for(int i=0;i<inRange.size();i++)
     {
       if(inRange.contains(target) && target != null)
       {
         changeTarget = false;
         break;
       }
       else
       {
         changeTarget = true;
       }
     }
     
     if(changeTarget == true)
     {
       switch(preference)
       {
          case "first":
          {
            target = inRange.get(0);
            break;
          }
          case "last":
          {
            target = inRange.get(inRange.size()-1);
            break;
          }
          case "strongest":
          {
            int highest = 0;
            
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(highest).health<inRange.get(i).health)
              {
                highest = i;
              }
            }
            
            target = inRange.get(highest);
            break; 
          }
          case "weakest":
          {
            int lowest = 0;
            
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(lowest).health>inRange.get(i).health)
              {
                lowest = i;
              }
            }
            
            target = inRange.get(lowest);
            break;
          }
          case "basic":
          {
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(i) instanceof basic)
              {
                target = inRange.get(i);
                break;
              }
              else
              {
                target = null; 
              }
            }
            break;
          }
          case "heavy":
          {
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(i) instanceof heavy)
              {
                target = inRange.get(i);
                break;
              }
              else
              {
                target = null; 
              }
            }
            break;
          }
          case "fast":
          {
            for(int i=0;i<inRange.size();i++)
            {
              if(inRange.get(i) instanceof fast)
              {
                target = inRange.get(i);
                break;
              }
              else
              {
                target = null; 
              }
            }            
            break;
          }
       }
     } 
   }
   
   void isClicked()
   {
     if(mouseX > pos.x - towerWidth/2 && mouseX < pos.x +towerWidth/2 && mouseY > pos.y - towerHeight/2 && mouseY < pos.y + towerHeight/2 && mousePressed)
     {
       clicked = true; 
       
       for(int j=0;j<activeTowers.size();j++)
       {
         if(activeTowers.get(j) != this)
         {
           activeTowers.get(j).clicked = false;
         }
       }
     }
   }
   
   void drawData()
   {
     float boxHeight = towerHeight;
     float boxWidth = towerWidth*3;
     float boxX = pos.x+towerWidth;
     float boxY = pos.y-towerHeight;
     float border = towerWidth/10;
     
     String d = "Damage: " + (int)damage;
     String r = "Rate of Fire: " + (int)rateOfFire;
     String p = "Focus: " + preference;
     
     
     
     strokeWeight(2);
     stroke(0,255,0);
    
     line(pos.x,pos.y,pos.x+towerWidth/2,pos.y);
     line(pos.x+towerWidth/2,pos.y,pos.x+towerWidth,pos.y-towerHeight/2);
     
     fill(0);
     rect(boxX,boxY,boxWidth,boxHeight);
     
     textSize(10);
     fill(0,255,0);
     
     text(d,boxX+border,boxY+border+textAscent());
     text(r,boxX+border,boxY+border+textAscent()*2);
     text(p,boxX+border,boxY+border+textAscent()*3);
     
     
     
     
     
     
   }
}