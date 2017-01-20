void setup()
{
  fullScreen(P3D,1);
  smooth(8);
  background(0);
  
  splashFont = createFont("spektakel.otf",50);
}

//GLOBAL VARIABLES
int screenIndex = 0;
int menuIndex = 0;

PFont splashFont;

void draw()
{
  stroke(255);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  screenControl();
}

void screenControl()
{
  switch(screenIndex)
  {
    case 0://Splash Screen
    {
      drawSplash();
    }
    case 1://Menu Screen
    {
      menuControl();
    }
    case 2://Game Screen
    {
      
    }
  }
}

void menuControl()
{
  //things common to all menu options
  
  switch(menuIndex)
  {
    case 0://main menu
    {
      
    }
    case 1://Play - game options
    {
      
    }
    case 2://High Scores 
    {
      
    }
    case 3://Options
    {
      
    }
    case 4://Acheivements
    {
      
    }
  }
}

void drawSplash()
{
 textFont(splashFont,50);
 
 String splashVal = "TOWER DEFENSE ULTIMATE";
 float splashX = ((width/2)-(textWidth(splashVal)/2));
 float splashY = ((height/2)+(textAscent())); 
 
 text(splashVal,splashX,splashY);
}