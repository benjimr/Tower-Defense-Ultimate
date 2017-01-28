class map
{
  String name;

  ArrayList<PVector> points = new ArrayList<PVector>();
  
  map()
  {
    this.name = "Default"; 
  }
  
  map(TableRow row)
  {
    this.name = row.getString("Name");
    float column = row.getColumnCount();
    
    for(int i=1;i<column;i+=2)
    { 
      if(!row.getString(i).equals("11"))
      {
        float x = map(Float.parseFloat(row.getString(i)),-10,10,277,width-277);
        float y = map(Float.parseFloat(row.getString(i+1)),-10,20,100,height+156);
          
        PVector p = new PVector(x,y);
        points.add(p);
      }
    }
  }
  
  void drawMap()
  {
    for(int i=0;i<points.size();i++)
    {
      float x1 = points.get(i).x;
      float y1 = points.get(i).y;
      float x2 = -1;
      float y2 = -1;
      
      if(i+1 < points.size())
      {
         x2 = points.get(i+1).x;
         y2 = points.get(i+1).y;
      }
      
      strokeWeight(60);
      stroke(255);
      
      if(x2 != -1 && y2 != -1)
      {
        line(x1,y1,x2,y2);  
      }
      
      
    }
  }
}