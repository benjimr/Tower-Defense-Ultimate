void setup()
{
  fullScreen(P3D,1);
  smooth(8);  
  splashFont = createFont("spektakel.otf",50);
  menuFont = createFont("CH-Thin.otf",50);
  
  dataInit();
}

//GLOBAL VARIABLES
int screenIndex = 0;
int menuIndex = 0;
int splashOp = 0;
boolean splashCheck = false;

PFont splashFont;
PFont menuFont;

ArrayList<menuOpt> menuOptions = new ArrayList<menuOpt>();

void draw()
{
  background(0);
  screenControl();
}

void screenControl()
{  
  switch(screenIndex)
  {
    case 0://Splash Screen
    {
      if(splashOp >=0 && splashOp <255 && splashCheck == false)
      {
       splashOp += 2;
      }
      else if(splashOp > 255)
      {
        splashCheck = true;
        splashOp -= 2;
      }
      else if(splashOp >= 0)
      {
       splashOp -= 2; 
      }
      else
      {
       screenIndex = 1;//go to menu 
      }
      drawSplash();
      
      break;
    }
    case 1://Menu Screen
    {
      menuControl();
      
      break;
    }
    case 2://Game Screen
    {
      
      break;
    }
  }
}

void menuControl()
{
  //things common to all menu options
  textFont(menuFont,50);
  drawMainMenu();
  
  switch(menuIndex)
  {
    case 0://Play - game options
    {
     
      break;
    }
    case 1://High Scores 
    {
      
      break;
    }
    case 2://Options
    {
      
      break;
    }
    case 3://Acheivements
    {
      
      break;
    }
  }
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
  }
}

void dataInit()
{
  textFont(menuFont,50);
  String[] menuNames = {"Play","High Scores","Achievements","Options"};
  
  for(int i=0;i<menuNames.length;i++)
  {
    float optionX = (width/3)-textWidth(menuNames[i]);
    float optionY = (height/3)+((textDescent()+textAscent())*i);
    menuOpt o = new menuOpt(menuNames[i],optionX,optionY);
    menuOptions.add(o);
    
  }
}