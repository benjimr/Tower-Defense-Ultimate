abstract class enemy
{
  PVector pos1 = new PVector(0,0);
  PVector dest1 = new PVector(0,0);
  PVector velocity = new PVector(0,0);
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
    
   velocity = new PVector(2,2);
   pos1.add(velocity);
  }
  
}