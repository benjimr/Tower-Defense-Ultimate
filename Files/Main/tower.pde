abstract class tower
{
   PVector pos;
   float damage;
   float rateOfFire;
   color towerColour;
   float towerWidth;
   float towerHeight;
   float range;
   
   tower()
   {
     pos = new PVector(0,0);
   }
   
   void fire()
   {
     
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
}