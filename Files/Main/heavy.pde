class heavy extends enemy
{
  heavy()
  {
    entityColour = color(0,255,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1.5;
    health = 200;
  }
  
  void drawEnemy()
  {
    fill(255,0,0);
    stroke(0,255,0);
    
    pushMatrix();
    translate(source.x,source.y);
    rect(curr.x,curr.y,entityWidth,entityHeight);
    popMatrix();
  }
}