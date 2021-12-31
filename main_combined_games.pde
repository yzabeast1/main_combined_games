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
int gamesPerRow=4;
int gamesPerColumn=3;
int mainTime;
int autosaveTime=1000;
String[] update;
String userHome = System.getProperty("user.home")+"/documents/combined/";
boolean updating;
PImage update1;
void setup() {
  backup();
  updating=boolean(loadBytes(userHome+"updating.bin")[0]);
  if (updating) {
    surface.setVisible(false);
    update();
    updating=false;
    byte[] temp={byte(updating)};
    saveBytes(userHome+"updating.bin", temp);
    exit();
  }
  reset();
  for (int x=0; x<=2; x++) {
    for (int y=0; y<=2; y++) {
      TTTboard[x][y]=1;
    }
  }
  fullScreen();
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
  mmSetup();
  msetup();
  nwsnakeSetup();  
  nwmmsnakeSetup();
}
void draw() {
  mainTime++;
  if (mainTime%autosaveTime==0) {
    save();
  }
  if (mancala) {
    mancalaDraw();
  }
  if (connectFour) {
    connectFourDraw();
  }
  if (gameOfLife) {
    gameOfLifeDraw();
  }
  if (ticTacToe) {
    tttDraw();
  }
  if (yahtzee) {
    yahtzeeDraw();
  }
  if (flappyBird) {
    FBdraw();
  }
  if (pente) {
    penteDraw();
  }
  if (snakemultiplayer) {
    snakeDraw();
  }
  if (snakeselection) {
    snakeSelectionDraw();
  }
  if (mirrorMovements) {
    mmDraw();
  }
  if (mirrorMode) {
    mdraw();
  }
  if (snakeNoWalls) {
    nwsnakeDraw();
  }
  if (snakeNoWallsMirrorMovements) {
    nwmmsnakeDraw();
  }
  if (checkers) {
    CheckersDraw();
  }
}
void mousePressed() {
  if (mancala) {
    mancalaMousePressed();
  }
  if (connectFour) {
    connectFourMousePressed();
  }
  if (ticTacToe) {
    tttMousePressed();
  }
  if (yahtzee) {
    yahtzeeMousePressed();
  }
  if (pente) {
    penteMousePressed();
  }
  if (snakemultiplayer) {
    snakeMousePressed();
  }
  if (mirrorMovements) {
    mmMousePressed();
  }
  if (snakeselection) {
    snakeSelectionMousePressed();
  }
  if (snakeNoWalls) {
    nwsnakeMousePressed();
  }
  if (snakeNoWallsMirrorMovements) {
    nwmmsnakeMousePressed();
  }
  if (mouseX<width/gamesPerRow&&mouseY<height/gamesPerColumn&&gameSelection) {
    mancala=true;
    gameSelection=false;
    mancalaSetup();
  }
  if (mouseX>width/gamesPerRow&&mouseX<width/gamesPerRow*2&&mouseY<height/gamesPerColumn&&gameSelection) {
    connectFour=true;
    gameSelection=false;
    connectFourSetup();
  }
  if (mouseX<width/gamesPerRow&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gameSelection) {
    gameOfLife=true;
    gameSelection=false;
    gameOfLifeSetup();
  }
  if (mouseX>width/gamesPerRow&&mouseX<width/gamesPerRow*2&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gameSelection) {
    ticTacToe=true;
    gameSelection=false;
    tttSetup();
  }
  if (mouseX>width/gamesPerRow*2&&mouseX<width/gamesPerRow*3&&mouseY<height/gamesPerColumn&&gameSelection) {
    yahtzee=true;
    gameSelection=false;
    yahtzeeSetup();
  }
  if (mouseX>width/gamesPerRow*2&&mouseX<width/gamesPerRow*3&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gameSelection) {
    load();
  }
  if (mouseX>width/gamesPerRow&&mouseX<width/gamesPerRow*2&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    flappyBird=true;
    gameSelection=false;
  }
  if (mouseX<width/gamesPerRow&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    save();
  }
  if (mouseX>width/gamesPerRow*2&&mouseX<width/gamesPerRow*3&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    pente=true;
    penteSetup();
    gameSelection=false;
  }
  if (mouseX>width/gamesPerRow*3&&mouseX<width/gamesPerRow*4&&mouseY<height/gamesPerColumn&&gameSelection) {
    snakeselection=true;
    gameSelection=false;
  }
  if (mouseX>width/gamesPerRow*3&&mouseX<width/gamesPerRow*4&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gameSelection&&loadBytes(userHome+"updating.bin")[1]!=1) {
    update1();
    updating=true;
    byte[] temp={byte(updating)};
    saveBytes(userHome+"updating.bin", temp);
    exit();
  }
  if (mouseX>width/gamesPerRow*3&&mouseX<width/gamesPerRow*4&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    checkers=true;
    gameSelection=false;
  }
}
void keyPressed() {
  if (mancala) {
    mancalaKeyPressed();
  }
  if (flappyBird) {
    FBkeyPressed();
  }
  if (connectFour) {
    connectFourKeyPressed();
  }
  if (gameOfLife) {
    gameOfLifeKeyPressed();
  }
  if (ticTacToe) {
    tttKeyPressed();
  }
  if (yahtzee) {
    yahtzeeKeyPressed();
  }
  if (pente) {
    penteKeyPressed();
  }
  if (snakemultiplayer) {
    snakeKeyPressed();
  }
  if (mirrorMovements) {
    mmKeyPressed();
  }
  if (mirrorMode) {
    mkeyPressed();
  }
  if (snakeselection) {
    snakeSelectionKeyPressed();
  }
  if (snakeNoWalls) {
    nwsnakeKeyPressed();
  }
  if (snakeNoWallsMirrorMovements) {
    nwmmsnakeKeyPressed();
  }
  if (checkers) {
    CheckersKeyPressed();
  }
}
void gameSelectionScreen() {
  mancala=false;
  connectFour=false;
  gameOfLife=false;
  gameSelection=true;
  ticTacToe=false;
  yahtzee=false;
  pente=false;
  checkers=false;
  snakemultiplayer=false;
  snakeselection=false;
  background(0, 255, 255);
  fill(0, 255, 0);
  rect(0, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(0, 0, 255);
  rect(width/gamesPerRow, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(255, 0, 0);
  rect(0, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(255, 255, 0);
  rect(width/gamesPerRow, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(255, 165, 0);
  rect(width/gamesPerRow*2, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(#026401);
  rect(width/gamesPerRow*2, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(#FFCD00);
  rect(width/gamesPerRow, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(#00FFCA);
  rect(0, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(#FF03FB);
  rect(width/gamesPerRow*2, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(#A09DAD);
  rect(width/gamesPerRow*3, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(#AA03FF);
  rect(width/gamesPerRow*3, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(#24EDA7);
  rect(width/gamesPerRow*3, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(0);
  textSize(width/gamesPerRow/10);
  textAlign(CENTER, CENTER);
  text("Mancala", width/gamesPerRow/2, height/gamesPerColumn/2);
  text("Connect Four", width/gamesPerRow+(width/gamesPerRow/2), height/gamesPerColumn/2);
  text("Conway's "+ENTER+"Game Of Life", width/gamesPerRow/2, height/gamesPerColumn+(height/gamesPerColumn/2));
  text("Tic Tac Toe", width/gamesPerRow+(width/gamesPerRow/2), height/gamesPerColumn+(height/gamesPerColumn/2));
  text("Yahtzee", width/gamesPerRow*2+(width/gamesPerRow/2), height/gamesPerColumn/2);
  text("Load(only use if "+ENTER+"you have save)", width/gamesPerRow*2+(width/gamesPerRow/2), height/gamesPerColumn+(height/gamesPerColumn/2));
  text("Save", width/gamesPerRow/2, height/gamesPerColumn*2+(height/gamesPerColumn/2));
  text("Flappy Bird", width/gamesPerRow/2+width/gamesPerRow, height/gamesPerColumn*2+(height/gamesPerColumn/2));
  text("Pente", width/gamesPerRow*2+(width/gamesPerRow/2), height/gamesPerColumn*2+(height/gamesPerColumn/2));
  text("Snake", width/gamesPerRow*3+(width/gamesPerRow/2), height/gamesPerColumn/2);
  text("Update"+ENTER+"Will Close Game", width/gamesPerRow*3+(width/gamesPerRow/2), height/gamesPerColumn+(height/gamesPerColumn/2));
  text("Checkers", width/gamesPerRow*3+(width/gamesPerRow/2), height/gamesPerColumn*2+(height/gamesPerColumn/2));
}
void save() {
  String[] names={name1, name2};
  byte[] boardByte;
  saveStrings(userHome+"names.txt", names);
  int[] mancalaHoles={holes[0], holes[1], holes[2], holes[3], holes[4], holes[5], holes[6], holes[7], holes[8], holes[9], holes[10], holes[11], mancalas[0], mancalas[1]};
  byte[] mancalaholes=byte(mancalaHoles);
  byte[] pente=byte(P_board[0]);
  for (int a=1; a<=18; a++) {
    pente=concat(pente, byte(P_board[a]));
  }
  saveBytes(userHome+"penteBoard.bin", pente);
  byte[] penteGeneral={byte(P_redTurn), byte(P_redTaken), byte(P_blackTaken)};
  saveBytes(userHome+"penteGeneral.bin", penteGeneral);
  byte[] temp={byte(redTurn)};
  boardByte=byte(board[0]);
  boardByte=concat(boardByte, byte(board[1]));
  boardByte=concat(boardByte, byte(board[2]));
  boardByte=concat(boardByte, byte(board[3]));
  boardByte=concat(boardByte, byte(board[4]));
  boardByte=concat(boardByte, byte(board[5]));
  boardByte=concat(boardByte, byte(board[6]));
  boardByte=concat(boardByte, temp);
  saveBytes(userHome+"mancala.bin", mancalaholes);
  saveBytes(userHome+"c4board.bin", boardByte);
  byte[] ttt=byte(TTTboard[0]);
  ttt=concat(ttt, byte(TTTboard[1]));
  ttt=concat(ttt, byte(TTTboard[2]));
  saveBytes(userHome+"ttt.bin", ttt);
  int[] bhscore={hscore};
  saveBytes(userHome+"fbhighscore.bin", byte(bhscore));
  byte[] snakehs={byte(snakehscore), byte(msnakehscore), byte(mmsnakehscore), byte(nwsnakehscore)};  
  saveBytes(userHome+"snakehighscore.bin", snakehs);
}
void load() {
  for (int a=0; a<=2; a++) {
    for (int b=0; b<=2; b++) {
      TTTboard[a][b]=int(loadBytes(userHome+"ttt.bin"))[a*3+b];
    }
  }
  name1=loadStrings(userHome+"names.txt")[0];
  name2=loadStrings(userHome+"names.txt")[1];
  mancalas[0]=loadBytes(userHome+"mancala.bin")[12];
  mancalas[1]=loadBytes(userHome+"mancala.bin")[13];
  for (int a=0; a<=11; a++) {
    holes[a]=loadBytes(userHome+"mancala.bin")[a];
  }
  for (int a=0; a<=6; a++) {
    for (int b=0; b<=6; b++) {
      board[a][b]=loadBytes(userHome+"c4board.bin")[(a*7+b)];
    }
  }
  for (int a=0; a<=18; a++) {
    for (int b=0; b<=18; b++) {
      P_board[a][b]=loadBytes(userHome+"penteBoard.bin")[(a*19+b)];
    }
  }
  hscore=loadBytes(userHome+"fbhighscore.bin")[0];
  snakehscore=loadBytes(userHome+"snakehighscore.bin")[0];
  redTurn=boolean(loadBytes(userHome+"c4board.bin")[49]);
  msnakehscore=loadBytes(userHome+"snakehighscore.bin")[1];
  mmsnakehscore=loadBytes(userHome+"snakehighscore.bin")[2];
  nwsnakehscore=loadBytes(userHome+"snakehighscore.bin")[3];
}
