class round
{
  float number;
  float basic;
  float heavy;
  float fast;
  float boss;
  
  round(TableRow row)
  {
    number = row.getFloat("round");
    basic = row.getFloat("basic");
    heavy = row.getFloat("heavy");
    fast = row.getFloat("fast");
    boss = row.getFloat("boss");
  }
  
  String toString()
  {
    return "Round: " + number + "\n" +
           "Basic: " + basic  + "\n" +
           "Heavy: " + heavy  + "\n" +
           "Fast:  " + fast   + "\n" +
           "Boss:  " + boss   + "\n";
  }  
}