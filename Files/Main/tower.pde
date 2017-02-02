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
   int preference;
   boolean clicked;
   
   tower()
   {
     pos = new PVector(0,0);
     timeDamage = millis();
     timeDraw = millis();
     drawShot = false;
     preference = 0;
     changeTarget = false;
     target = null;
     clicked = false;
   }
   
   
   void place()
   {
     pos.x = mouseX;
     pos.y = mouseY;
     
     if(!mousePressed)
     {
       placing = true;
     }
     else if(selectedTower != null && placing == true)
     {
       if(pos.x - towerWidth/2 > menuWidth)
       {
         activeTowers.add(selectedTower);
         placing = false;
         selectedTower = null;
       }
       else
       {
         text("Can not place here",width/2,height/2); 
       }

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
       }s
       else
       {
         changeTarget = true;
       }
     }
     
     if(changeTarget == true)
     {
       switch(preferences[preference])
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
     float boxHeight = towerHeight*2;
     float boxWidth = towerWidth*7;
     float boxX = pos.x+towerWidth;
     float boxY = pos.y-towerHeight;
     float border = towerWidth/10;
     
     textSize(13);
     String d = "Damage: " + (int)damage;
     String r = "Rate of Fire: " + (int)rateOfFire;
     String p = "Focus: " + preferences[preference];
     
     
     strokeWeight(2);
     stroke(0,255,0);
    
     line(pos.x,pos.y,pos.x+towerWidth/2,pos.y);
     line(pos.x+towerWidth/2,pos.y,pos.x+towerWidth,pos.y-towerHeight/2);
     
     fill(0);
     rect(boxX,boxY,boxWidth+border*4,boxHeight);
     
     fill(0,255,0);
     
     text(d,boxX+border,boxY+border+textAscent());
     text(r,boxX+border,boxY+border+textAscent()*2);
     text(p,boxX+border,boxY+border+textAscent()*3);
     
   
   prefButtons.clear();
   int j = 0;
   for(int i=0;i<preferences.length;i++)
   {
     button b;
     if(i<=2)
     {
       b = new button(preferences[i],false,boxX+border*j+1+(boxWidth/4)*j,boxY+textAscent()*4,boxWidth/4,textAscent());
       j++;
     }
     else
     {
       if(i==3)
       {
         j=0;
       }
       b = new button(preferences[i],false,boxX+border*j+1+(boxWidth/4)*j,boxY+textAscent()*5+5,boxWidth/4,textAscent());
       j++;
     }
     prefButtons.add(b);
   }
   
   for(int i=0;i<prefButtons.size();i++)
   {
     prefButtons.get(i).drawButton(); 
     if(prefButtons.get(i).clicked == true)
     {
        for(int k=0;k<preferences.length;k++)
        {
           if(preferences[k] == prefButtons.get(i).label)
           {
              preference = k; 
           }
        }
     }
   }
   
   
     
     
     
   }  
     
     
     
 }