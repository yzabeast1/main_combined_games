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
boolean pong=false;
boolean gamesPage2=false;
boolean minesweeper=false;
color[] GameColors=new color[12];
textBox name1box;
textBox name2box;
String[] defaultPlayerNames={"Player 1", "Player 2"};
String OS = platformNames[platform];
String saveLocation = System.getProperty("user.home")+"/library/Application Support/Combined Games/";
int gamesPerRow=4;
int gamesPerColumn=3;
void setup() {
  update();
  if (OS=="macosx") {
    saveLocation = System.getProperty("user.home")+"/library/Application Support/Combined Games/";
  } else if (OS!="macosx") {
    saveLocation = System.getProperty("user.home")+"/documents/Combined Games/";
  }
  yahtzeeStartup();
  name1box=new textBox(-1, -1, 0, 0);
  name2box=new textBox(-1, -1, 0, 0);
  name1box.text=defaultPlayerNames[0];
  name2box.text=defaultPlayerNames[1];
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
  pongSetup();
  minesweeperSetup();
  loadConfig();
}
void draw() {
  if (gameSelection)gameSelectionScreen();
  if (gamesPage2)gamesPage2Draw();
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
  if (pong)pongDraw();
  if (minesweeper)minesweeperDraw();
}
void mousePressed() {
  if (mancala)mancalaMousePressed();
  if (connectFour)connectFourMousePressed();
  if (ticTacToe)tttMousePressed();
  if (yahtzee)yahtzeeMousePressed();
  if (pente)penteMousePressed();
  if (snakemultiplayer||mirrorMovements||snakeNoWalls||snakeNoWallsMirrorMovements) snakeMousePressed();
  if (snakeselection)snakeSelectionMousePressed();
  if (minesweeper)minesweeperMousePressed();
  if (gameSelection)gameSelectionMousePressed();
  if (gamesPage2)gamesPage2MousePressed();
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
  if (pong)pongKeyPressed();
  if (minesweeper)minesweeperKeyPressed();
  if (gameSelection||gamesPage2)gameSelectionKeyPressed();
}
