void setup()
{
  fullScreen(P3D,1);
  smooth(8);  
  splashFont = createFont("spektakel.otf",200);
  menuFont = createFont("CH-Thin.otf",200);
  
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
 
 String splashVal = "TD GAMES";
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
    
    if(menuOptions.get(i).hover == true)
    {
      print("here");
      titleCheck = true; 
    }
  }

  if(titleCheck == false && mousePressed)
  {
    menuIndex = 4;
    
    for(int i=0;i<menuOptions.size();i++)
    {
      menuOptions.get(i).clicked = false;
      menuOptions.get(i).hover = false;
    }
  }
  else
  {
   titleCheck =false; 
  }
  print(menuIndex+"\n");
}

void drawPlay()
{
  text(selected.value,width/2,height/2);
}

void drawTitle()
{
  
  textFont(splashFont,150);
  String name1 = "TOWER";
  String name2 = "DEFENSE";
  String name3 = "ULTIMATE";
  float xVal = (width*0.60);
  float yVal = height*0.30;
  
  text(name1,xVal-(textWidth(name1)/2),yVal);
  text(name2,xVal-(textWidth(name2)/2),yVal+(textAscent()+textDescent())*1.4);
  text(name3,xVal-(textWidth(name3)/2),yVal+(textAscent()+textDescent())*2.8);

}