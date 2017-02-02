import java.util.Collections;
import processing.video.*;

Movie eventHorizon;

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
PFont gameFont;

ArrayList<menuOpt> menuOptions = new ArrayList<menuOpt>();
menuOpt selectedMenu = new menuOpt();
ArrayList<map> maps = new ArrayList<map>();
ArrayList<round> rounds = new ArrayList<round>();

ArrayList<basic> basics = new ArrayList<basic>();
ArrayList<heavy> heavys  = new ArrayList<heavy>();
ArrayList<fast>  fasts = new ArrayList<fast>();

ArrayList<enemy> enemies = new ArrayList<enemy>();
ArrayList<enemy> activeEnemies = new ArrayList<enemy>();

String selectedMap = "zigzag";

ArrayList<tower> towerMenu = new ArrayList<tower>();
ArrayList<tower> activeTowers = new ArrayList<tower>();

boolean placing = false;
tower selectedTower = null;

boolean priorityCheck = false;

boolean roundStarted = false;
boolean roundInitialised = false;
int currentRound = 0;
boolean roundEnded = false;
int enemyTotal;

float roundStartX;
float roundStartY;
float roundStartWidth;
float roundStartHeight;

float menuWidth;

int k=0;


String[] preferences = {"first","last","strongest","weakest","basic","heavy","fast"};
ArrayList<button> prefButtons = new ArrayList<button>();