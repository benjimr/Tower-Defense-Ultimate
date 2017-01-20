void setup()
{
  fullScreen(P3D,1);
  smooth(8);  
  splashFont = createFont("spektakel.otf",50);
  menuFont = createFont("CH-Thin.otf",50);
  
  dataInit();
}

void draw()
{
  background(0);
  screenControl();
}

void drawSplash()
{
 textFont(splashFont,50);
 
 String splashVal = "TOWER DEFENSE ULTIMATE";
 float splashX = ((width/2)-(textWidth(splashVal)/2));
 float splashY = ((height/2)+(textAscent()/2)); 
 
 fill(255,255,255,splashOp);
 text(splashVal,splashX,splashY);
}

void drawMainMenu()
{  
  for(int i=0;i<menuOptions.size();i++)
  {
    menuOptions.get(i).mouseDet();
    menuOptions.get(i).drawOption();
    
    if(menuOptions.get(i).clicked == true)
    {
      menuIndex = i; 
      selected = menuOptions.get(i);
    }
  }
}

void drawPlay()
{
  text(selected.value,width/2,height/2);
}