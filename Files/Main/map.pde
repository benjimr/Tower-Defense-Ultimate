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
        float x = Float.parseFloat(row.getString(i));
        float y = Float.parseFloat(row.getString(i+1));
          
        PVector p = new PVector(x,y);
        points.add(p);
      }
    }
  }
  
  void drawMap()
  {
    for(int i=0;i<points.size();i++)
    {
      float x1 = map(points.get(i).x,-10,10,277,width-277);
      float y1 = map(points.get(i).y,-10,10,156,height-156);
      float x2 = -1;
      float y2 = -1;
      
      if(i+1 < points.size())
      {
         x2 = map(points.get(i+1).x,-10,10,277,width-277);
         y2 = map(points.get(i+1).y,-10,10,156,height-156);
      }
      
      strokeWeight(10);
      stroke(0,255,0);
      point(x1,y1);
      
      strokeWeight(5);
      stroke(0,0,255);
      
      if(x2 != -1 && y2 != -1)
      {
        line(x1,y1,x2,y2);  
      }
      
      
    }
  }
}