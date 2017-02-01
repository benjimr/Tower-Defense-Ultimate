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
   
   tower()
   {
     pos = new PVector(0,0);
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
     enemy e = new basic();
     return e;
   }
}