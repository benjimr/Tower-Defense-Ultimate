class basic extends enemy
{
  basic()
  {
    super();
    entityColour = color(255,0,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 3;
    health = 100;
  }
  
  void drawEnemy()
  {
    stroke(entityColour);
    
    pushMatrix();
    
    translate(source.x,source.y);
    ellipse(curr.x,curr.y,entityWidth,entityHeight);
    
    popMatrix();
  }
}