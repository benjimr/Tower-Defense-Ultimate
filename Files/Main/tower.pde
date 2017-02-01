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
     preference = "first";
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
   
   enemy choose(ArrayList<enemy> inRange)
   {
     enemy e = inRange.get(0);
     
     switch(preference)
     {
        case "first":
        {
          
          break;
        }
        case "last":
        {
         
          break;
        }
        case "strongest":
        {
          
          break; 
        }
        case "weakest":
        {
         
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
     return e;
     
     
   }
}