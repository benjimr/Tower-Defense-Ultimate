class heavy extends enemy
{
  heavy()
  {
    super();
    entityColour = color(0,255,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 1.5;
    health = 200;
    value = 60;
  }
  
  void drawEnemy()
  {
    stroke(entityColour);
    noFill();
    pushMatrix();
    
    translate(source.x,source.y);
    rect(curr.x,curr.y-entityHeight/2,entityWidth,entityHeight);
    
    popMatrix();
  }
}