class basic extends enemy
{
  
  basic()
  {
    pos1 = new PVector(0,0);
    dest1 = new PVector(0,0);
    speed = 0;
    entityColour = color(255,0,0);
    entityWidth = 50;
    entityHeight = 50;
  }
  void drawEnemy()
  {
    noFill();
    stroke(entityColour);
    
    pushMatrix();
    translate(width/2,height/2);
    rect(pos1.x,pos1.y,entityWidth,entityHeight);
    popMatrix();
  }
}