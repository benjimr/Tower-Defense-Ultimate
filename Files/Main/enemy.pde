abstract class enemy
{
  PVector pos1 = new PVector(0,0);
  PVector dest1 = new PVector(0,0);
  float speed;
  color entityColour;
  float entityWidth;
  float entityHeight;

  
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
     
    for(int i=0;i<selected.points.size()-1;i++)
    {
      pos1 = selected.points.get(i);
      dest1 = selected.points.get(i+1);
    }
  }
  
}