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

int currentRound = 0;

ArrayList<menuOpt> menuOptions = new ArrayList<menuOpt>();
menuOpt selectedMenu = new menuOpt();
ArrayList<map> maps = new ArrayList<map>();
ArrayList<round> rounds = new ArrayList<round>();

ArrayList<basic> basics = new ArrayList<basic>();
ArrayList<heavy> heavys  = new ArrayList<heavy>();
ArrayList<fast>  fasts = new ArrayList<fast>();

ArrayList<enemy> enemies = new ArrayList<enemy>();

String selectedMap = "S";

ArrayList<tower> towerMenu = new ArrayList<tower>();
ArrayList<tower> activeTowers = new ArrayList<tower>();

boolean placing = false;
tower selectedTower = null;

boolean priorityCheck = false;

boolean roundStarted = false;
boolean roundInitialised = false;

float roundStartX;
float roundStartY;
float roundStartWidth;
float roundStartHeight;

float menuWidth;