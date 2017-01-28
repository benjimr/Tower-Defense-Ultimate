class fast extends enemy
{
  float size;
  
  fast()
  {
    super();
    entityColour = color(0,0,255);
    entityWidth = 25;
    entityHeight = 25;
    speed = 4.5;
    health = 70;
    size = 20;
  }
  
  void drawEnemy()
  {
    stroke(entityColour);
    
    pushMatrix();
    
    translate(source.x,source.y);
    triangle(curr.x,curr.y-size,curr.x+size,curr.y+size,curr.x-size,curr.y+size);
    
    popMatrix();
  }
}