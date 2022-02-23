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
  pong=false;
  background(0, 255, 255);
  fill(GameColors[0]);
  rect(0, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[1]);
  rect(width/gamesPerRow, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[2]);
  rect(width/gamesPerRow*2, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[3]);
  rect(width/gamesPerRow*3, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[4]);
  rect(0, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[5]);
  rect(width/gamesPerRow, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[6]);
  rect(width/gamesPerRow*2, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[7]);
  rect(width/gamesPerRow*3, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[8]);
  rect(0, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[9]);
  rect(width/gamesPerRow, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[10]);
  rect(width/gamesPerRow*2, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[11]);
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
  text("Pong", width/gamesPerRow*3+(width/gamesPerRow/2), height/gamesPerColumn+(height/gamesPerColumn/2));
  text("Page 2", width/gamesPerRow*3+(width/gamesPerRow/2), height/gamesPerColumn*2+(height/gamesPerColumn/2));
}
void gameSelectionMousePressed() {
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
  if (mouseX>width/gamesPerRow*2&&mouseX<width/gamesPerRow*3&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gameSelection)load();
  if (mouseX>width/gamesPerRow&&mouseX<width/gamesPerRow*2&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    flappyBird=true;
    gameSelection=false;
  }
  if (mouseX<width/gamesPerRow&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection)save();
  if (mouseX>width/gamesPerRow*2&&mouseX<width/gamesPerRow*3&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    pente=true;
    penteSetup();
    gameSelection=false;
  }
  if (mouseX>width/gamesPerRow*3&&mouseX<width/gamesPerRow*4&&mouseY<height/gamesPerColumn&&gameSelection) {
    snakeselection=true;
    gameSelection=false;
  }
  if (mouseX>width/gamesPerRow*3&&mouseX<width/gamesPerRow*4&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gameSelection) {
    gamesPage2=true;
    gameSelection=false;
  }
  if (mouseX>width/gamesPerRow*3&&mouseX<width/gamesPerRow*4&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gameSelection) {
    pong=true;
    gameSelection=false;
  }
}
void gamesPage2MousePressed() {
  if (mouseX<width/gamesPerRow&&mouseY<height/gamesPerColumn&&gamesPage2) {
    checkers=true;
    gamesPage2=false;
  }
  if (mouseX<width/gamesPerRow&&mouseY>height/gamesPerColumn*2&&mouseY<height/gamesPerColumn*3&&gamesPage2) {
    gameSelection=true;
    gamesPage2=false;
  }  
  if (mouseX<width/gamesPerRow&&mouseY>height/gamesPerColumn&&mouseY<height/gamesPerColumn*2&&gamesPage2) {
    minesweeper=true;
    gamesPage2=false;
  }
}
void gameSelectionKeyPressed() {
  changePage();
}
void gamesPage2Draw() {
  background(0, 255, 255);
  fill(GameColors[0]);
  rect(0, 0, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[4]);
  rect(0, height/gamesPerColumn, width/gamesPerRow, height/gamesPerColumn);
  fill(GameColors[8]);
  rect(0, height/gamesPerColumn*2, width/gamesPerRow, height/gamesPerColumn);
  fill(0);
  text("Checkers", width/gamesPerRow/2, height/gamesPerColumn/2);
  text("Page 1", width/gamesPerRow/2, height/gamesPerColumn*2+(height/gamesPerColumn/2));
  text("Minesweeper", width/gamesPerRow/2, height/gamesPerColumn+(height/gamesPerColumn/2));
}
void changePage() {
  if (key=='1') {
    resetAll();
    gameSelection=true;
  }
  if (key=='2') {
    resetAll();
    gamesPage2=true;
  }
}
void resetAll() {
  gameSelection=false;
  gamesPage2=false;
}
