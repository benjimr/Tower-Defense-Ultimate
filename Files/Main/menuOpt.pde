class menuOpt
{
  String value;
  float xVal;
  float yVal;
  boolean clicked;
  boolean hover;
  
  menuOpt()
  {
    this.value = "Default";
    this.xVal = 0;
    this.yVal = 0;
    this.clicked = false;
    this.hover = false;
  }
  
  menuOpt(String value, float xVal, float yVal)
  {
    this.value = value;
    this.xVal = xVal;
    this.yVal = yVal;
    this.clicked = false;
    this.hover = false;
  }
  
  void drawOption()
  {
    
    if(hover == true)
    {
      fill(0,0,255); 
    }
    else
    {
      fill(255);
    }
    
    if(clicked == true)
    {
      fill(255,0,0); 
    }
    
    text(value,xVal,yVal);
  }
  
  void mouseDet()
  {
    if(mouseX>xVal && mouseX<xVal+textWidth(value) && mouseY<yVal && mouseY>yVal-(textAscent()))
    {
      hover = true;
      if(mousePressed)
      {
        clicked = true; 
        
        for(int i=0;i<menuOptions.size();i++)
        {
          if(menuOptions.get(i).value != this.value)
          {
            menuOptions.get(i).clicked = false; 
          }
        }
      }
    }
    else
    {
      hover = false;
    }
  }
}