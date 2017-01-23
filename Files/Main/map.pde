class map
{
  String name;
  PVector first = new PVector(0,0);
  PVector second = new PVector(0,0);
  PVector third = new PVector(0,0);
  PVector fourth = new PVector(0,0);
  PVector fifth = new PVector(0,0);
  PVector sixth = new PVector(0,0);
  
  ArrayList<PVector> points = new ArrayList<PVector>();
  
  map()
  {
    this.name = "Default"; 
  }
  
  map(TableRow row)
  {
    this.name = row.getString("Name");
    
    if(!row.getString("#1X").equals("n"))
    {
      first.x = Float.parseFloat(row.getString("#1X"));
      first.y = Float.parseFloat(row.getString("#1Y"));
      points.add(first);
    }
    
    if(!row.getString("#2X").equals("n"))
    {
      second.x = Float.parseFloat(row.getString("#2X"));
      second.y = Float.parseFloat(row.getString("#2Y"));
      points.add(second);
    }

    if(!row.getString("#3X").equals("n"))
    {
      third.x = Float.parseFloat(row.getString("#3X"));
      third.y = Float.parseFloat(row.getString("#3Y"));
      points.add(third);
    }
    
    if(!row.getString("#4X").equals("n"))
    {
      fourth.x = Float.parseFloat(row.getString("#4X"));
      fourth.y = Float.parseFloat(row.getString("#4Y"));
      points.add(fourth);
    }
   
    if(!row.getString("#5X").equals("n"))
    {
      fifth.x = Float.parseFloat(row.getString("#5X"));
      fifth.y = Float.parseFloat(row.getString("#5Y"));
      points.add(fifth);
    }
    
    if(!row.getString("#6X").equals("n"))
    {
      sixth.x = Float.parseFloat(row.getString("#6X"));
      sixth.y = Float.parseFloat(row.getString("#6Y"));
      points.add(sixth);
    }
  }
  
  void drawMap()
  {
    println("here");
    for(int i=0;i<points.size();i++)
    {
      float x1 = map(points.get(i).x,-10,10,0,width);
      float y1 = map(points.get(i).y,-10,10,0,height);
      float x2 = -1;
      float y2 = -1;
      
      if(i+1 < points.size())
      {
         x2 = map(points.get(i+1).x,-10,10,0,width);
         y2 = map(points.get(i+1).y,-10,10,0,height);
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