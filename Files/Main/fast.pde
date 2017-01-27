class fast extends enemy
{
  float size = 20;
  
  fast()
  {
    entityColour = color(255,0,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 4.5;
    health = 70;
  }
  
  void drawEnemy()
  {
    fill(255,0,0);
    stroke(0,255,0);
    
    pushMatrix();
    translate(source.x,source.y);
    triangle(curr.x,curr.y-size,curr.x+size,curr.y+size,curr.x-size,curr.y+size);
    popMatrix();
  }
}