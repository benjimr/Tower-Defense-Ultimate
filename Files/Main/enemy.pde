abstract class enemy
{
  PVector pos1 = new PVector(0,0);
  PVector dest1 = new PVector(0,0);
  float velocity;
  color entityColour;
  float entityWidth;
  float entityHeight;
  float health;

  
  void moveEnemy()
  {
    map selected = new map();
    
    for(int i=0;i<maps.size();i++)
    {
      if(maps.get(i).name.equals(selectedMap))
      {
        selected = maps.get(i);
      }
    } 
   
   
   
    println("Pos : " + pos1.x + "\t" + pos1.y);
    println("Dest: " + 
    dest1.x + "\t" + dest1.y);
   
    println("Velocity: " + velocity);
    
    pos1.x = lerp(pos1.x,dest1.x,velocity);
    pos1.y = lerp(pos1.y,dest1.y,velocity);
    
    if(pos1 == dest1)
    {
       
    } 
   
   
  }
  
}