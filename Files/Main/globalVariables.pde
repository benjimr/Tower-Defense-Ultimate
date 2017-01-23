int screenIndex = 0;
int menuIndex = 4;
int splashOp = 0;
boolean splashCheck = false;
boolean titleCheck = false;

float menuLineX = 0;
float menuBoxWidth = 0;
float menuBoxHeight = 0;
float menuBoxY = 0;
float startX =0;
float goWidth = 0;
float goHeight = 0;
  
float goX = 0;
float goY = 0;

PFont splashFont;
PFont menuFont;

ArrayList<menuOpt> menuOptions = new ArrayList<menuOpt>();
menuOpt selectedMenu = new menuOpt();
ArrayList<map> maps = new ArrayList<map>();

String selectedMap = "zigzag";