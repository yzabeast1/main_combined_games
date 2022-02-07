boolean mancala=false;
boolean connectFour=false;
boolean gameSelection=true;
boolean gameOfLife=false;
boolean yahtzee=false;
boolean ticTacToe=false;
boolean flappyBird=false;
boolean pente=false;
boolean snakemultiplayer=false;
boolean snakeselection=false;
boolean mirrorMovements=false;
boolean mirrorMode=false;
boolean snakeNoWalls=false;
boolean snakeNoWallsMirrorMovements=false;
boolean checkers=false; 
int mainTime;
String[] update;
boolean updating;
PImage update1;
textBox name1box;
textBox name2box;
void setup() {
  yahtzeeStartup();
  name1box=new textBox(-1, -1, 0, 0);
  name2box=new textBox(-1, -1, 0, 0);
  name1box.text=defaultPlayerNames[0];
  name2box.text=defaultPlayerNames[1];
  //backup();
  //updating=boolean(loadBytes(saveLocation+"updating.bin")[0]);
  //if (updating) {
  //  surface.setVisible(false);
  //  update();
  //  updating=false;
  //  byte[] temp={byte(updating)};
  //saveBytes(saveLocation+"updating.bin", temp);
  //  exit();
  //}
  reset();
  //size(displayWidth, displayHeight);
  //surface.setResizable(true);
  fullScreen();
  //surface.setTitle("Combined Games Made By Yzabeast1");
  gameSelectionScreen();
  pipeBottom=loadImage("pipe bottom.png");
  pipeTop=loadImage("pipe top.png");
  bird=loadImage("bird.png");
  background=loadImage("background.png");
  bottom=loadImage("bottom.png");
  for (int a=0; a<5; a++) {
    x[a]=600+a*distanceBetweenPairs;
    xh[a]=ceil(random(50, 400));
  }
  snakeSetup();
}
void draw() {
  mainTime++;
  if (mainTime%autosaveTime==0) {
    //  save();
    println("autoSave", millis());
  }
  if (gameSelection)gameSelectionScreen();
  if (mancala)mancalaDraw();
  if (connectFour)connectFourDraw();
  if (gameOfLife)gameOfLifeDraw();
  if (ticTacToe)tttDraw();
  if (yahtzee)yahtzeeDraw();
  if (flappyBird)FBdraw();
  if (pente)penteDraw();
  if (snakemultiplayer||mirrorMovements||mirrorMode||snakeNoWalls||snakeNoWallsMirrorMovements)snakeDraw();
  if (snakeselection)snakeSelectionDraw();
  if (checkers)CheckersDraw();
}
void mousePressed() {
  if (mancala)mancalaMousePressed();
  if (connectFour)connectFourMousePressed();
  if (ticTacToe)tttMousePressed();
  if (yahtzee)yahtzeeMousePressed();
  if (pente)penteMousePressed();
  if (snakemultiplayer||mirrorMovements||snakeNoWalls||snakeNoWallsMirrorMovements) snakeMousePressed();
  if (snakeselection)snakeSelectionMousePressed();
  if (gameSelection)gameSelectionMousePressed();
}
void keyPressed() {
  if (mancala)mancalaKeyPressed();
  if (flappyBird)FBkeyPressed();
  if (connectFour)connectFourKeyPressed();
  if (gameOfLife)gameOfLifeKeyPressed();
  if (ticTacToe)tttKeyPressed();
  if (yahtzee)yahtzeeKeyPressed();
  if (pente)penteKeyPressed();
  if (snakemultiplayer||mirrorMovements||mirrorMode||snakeNoWalls||snakeNoWallsMirrorMovements)snakeKeyPressed();
  if (snakeselection)snakeSelectionKeyPressed();
  if (checkers)CheckersKeyPressed();
}
