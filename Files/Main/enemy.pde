abstract class enemy
{
  PVector source;
  PVector dest;
  PVector forward;
  PVector curr;
  float speed;
  float theta;
  color entityColour;
  float entityWidth;
  float entityHeight;
  float health;
  int destIndex;
  
  enemy()
  {
    source = new PVector(0,0);
    dest  = new PVector(0,0);
    forward = new PVector(0,0);
    curr = new PVector(0,0);
    destIndex = 1;
    theta = 0;
  }
  
  void moveEnemy()
  {
    map selected = new map();
    
    for(int i=0;i<maps.size();i++)
    {
      if(maps.get(i).name.equals(selectedMap))
      {
        selected = maps.get(i);
        source = new PVector(maps.get(i).points.get(destIndex-1).x,maps.get(i).points.get(destIndex-1).y);
        dest = new PVector(maps.get(i).points.get(destIndex).x-source.x,maps.get(i).points.get(destIndex).y-source.y);
      }
    } 
 
    pushMatrix();
    
    translate(source.x,source.y);
    theta = atan2(dest.x,dest.y);
    
    popMatrix();
    
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
      
    if(curr.x < dest.x-10 || curr.x > dest.x + 10 || curr.y < dest.y-10 || curr.y >dest.y+10)
    {
      curr.x += forward.x * speed;
      curr.y -= forward.y * speed; 
    }
    else if(destIndex+1 < selected.points.size())
    {          
      destIndex +=1;

      curr.x = 0;
      curr.y = 0;
    }
  }
  
}