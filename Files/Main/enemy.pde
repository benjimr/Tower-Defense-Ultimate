abstract class enemy
{
  PVector source = new PVector(0,0);
  PVector dest = new PVector(0,0);
  PVector forward = new PVector(0,0);
  PVector curr = new PVector(0,0);
  float speed = 6;
  float theta = 0;
  color entityColour;
  float entityWidth;
  float entityHeight;
  float health;
  int destIndex;

  
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
    
    
    
     println("Forward : " + forward.x + "\t" + forward.y);
    println("Theta: " + theta);   
    println("Source : " + source.x + "\t" + source.y);
    println("Dest: " + dest.x + "\t" + dest.y);
    println("Curr: " + curr.x +"\t"+curr.y);
    println("speed: " + speed);
    println("destIndex: " +destIndex + "\n");
   
  }
  
}