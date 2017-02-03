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
   boolean moving;
   boolean placeOk;
   int price;
   
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
     moving = false;
     placeOk = true;
   }
   
   
   void place()
   {
     pos.x = mouseX;
     pos.y = mouseY;
     placeOk = true;
      
     boolean mouse;
     
     if(moving == true)
     {
       mouse = mousePressed; 
     }
     else
     {
       mouse = !mousePressed; 
     }
     
     if(mouse)
     {
       placing = true;
     }
     else if(selectedTower != null && placing == true)
     {
       if(pos.x - towerWidth/2 < menuWidth)
       {
         placeOk = false;
       }
      
       
       map m = new map();
       for(int i=0;i<maps.size();i++)
       {
         if(selectedMap == maps.get(i).name)
         {
            m = maps.get(i); 
         }
       }
       
       //for(int i=0;i<m.points.size()-1;i++)
       //{
         //quad(x1,y1-pathWidth/2,x2,y2-pathWidth/2,x2,y2+pathWidth/2,x1,y1+pathWidth/2);
         //PVector one = m.points.get(i);  
         //PVector two = m.points.get(i+1);
         
         /*if(????
         {
           placeOk = false; 
         }*/

//       }}
       
       if(placeOk == true)
       {
         if(!activeTowers.contains(selectedTower))
         {
           activeTowers.add(selectedTower);
         }
         placing = false;
         selectedTower = null;
         money -= price; 
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
       }
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
     float border = towerWidth/10;
     float boxHeight = height/4;
     float boxWidth = menuWidth - border*2;
     float boxX = border;
     float boxY = height/2;
     
     textSize(13);
     String d = "Damage: " + (int)damage;
     String r = "Rate of Fire: " + (int)rateOfFire;
     String p = "Focus: " + preferences[preference];
     String ra = "Range: " + int(range);
     
     strokeWeight(2);
     noStroke();
     noFill();
    
     rect(boxX,boxY,boxWidth,boxHeight);
     
     fill(255);
     text(d,boxX+border,boxY+textAscent());
     text(r,boxX+border,boxY+textAscent()*2);
     text(p,boxX+border,boxY+textAscent()*3);
     text(ra,boxX+border,boxY+textAscent()*4);
     
   
   
   
   
   if(!(this instanceof AOE))
   {
     prefButtons.clear();
     int j = 0;
     
     for(int i=0;i<preferences.length;i++)
     {
       button b = new button();
       if(i<=1)
       {
         b = new button(preferences[i],false,(boxX+border)+((boxWidth/2)-(border*2))*j+(border*j),boxY+textAscent()*5,(boxWidth/2)-border*2,textAscent()*2);
         j++;
       }
       else if(i<=3)
       {
         if(i==2)
         {
           j=0;
         }
         b = new button(preferences[i],false,(boxX+border)+((boxWidth/2)-(border*2))*j+(border*j),boxY+textAscent()*7+5,(boxWidth/2)-border*2,textAscent()*2);
         j++;
       }
       else if(i<=5)
       {
         if(i==4)
         {
           j=0;
         }
         b = new button(preferences[i],false,((boxX+border)+((boxWidth/2)-(border*2))*j)+(border*j),boxY+textAscent()*9+10,(boxWidth/2)-border*2,textAscent()*2);
         j++;
       }
       else if(i<=7)
       {
         if(i==6)
         {
           j=0;
         }
         b = new button(preferences[i],false,((boxX+border)+((boxWidth/2)-(border*2))*j)+(border*j),boxY+textAscent()*11+15,(boxWidth/2)-border*2,textAscent()*2);
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
 
   

  
   
   button m = new button("Move",false,boxX+boxWidth*0.75-border,boxY,boxWidth/4,textAscent()*2);
   m.drawButton();
   
   if(m.clicked == true)
   {
     selectedTower = this;
     moving = true;
     place();
   }
   else
   {
     moving = false;
   }
   
   button s = new button("Sell",false,boxX+boxWidth*0.75-border,boxY+textAscent()*2,boxWidth/4,textAscent()*2);
   s.drawButton();
   
   if(s.clicked == true)
   {
     sell(); 
   }
   
     
     
     
   }
   
  void sell()
  {
    money += price/2;
    activeTowers.remove(this);
  }
}


     
     