class basic extends enemy
{
  
  basic()
  {
    destIndex = 1;

    
    entityColour = color(255,0,0);
    entityWidth = 25;
    entityHeight = 25;
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