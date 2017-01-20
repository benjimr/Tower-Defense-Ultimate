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