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
   
   tower()
   {
     pos = new PVector(0,0);
    timeDamage = millis();
     timeDraw = millis();
     drawShot = false;
     preference = "weakest";
     changeTarget = false;
     target = null;
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
           
            break;
          }
          case "heavy":
          {
            
            break;
          }
          case "fast":
          {
            
            break;
          }
       }
     }
     
     
   }
}