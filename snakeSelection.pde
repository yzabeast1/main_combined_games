int snakeGamesPerRow=4;
int snakeGamesPerColumn=3;
void snakeSelectionDraw() {
  background(0, 255, 255);
  fill(0, 255, 0);
  rect(0, 0, width/snakeGamesPerRow, height/snakeGamesPerColumn);
  fill(0, 0, 255);
  rect(width/snakeGamesPerRow, 0, width/snakeGamesPerRow, height/snakeGamesPerColumn);
  fill(255, 0, 0);
  rect(0, height/snakeGamesPerColumn, width/snakeGamesPerRow, height/snakeGamesPerColumn);
  fill(255, 255, 0);
  rect(width/snakeGamesPerRow, height/snakeGamesPerColumn, width/snakeGamesPerRow, height/snakeGamesPerColumn);
  fill(255, 165, 0);
  rect(width/snakeGamesPerRow*2, 0, width/snakeGamesPerRow, height/snakeGamesPerColumn);
  fill(0);
  textSize(width/snakeGamesPerRow/10);
  textAlign(CENTER, CENTER);
  text("Multiplayer", width/snakeGamesPerRow/2, height/snakeGamesPerColumn/2);
  text("Mirror Mode", width/snakeGamesPerRow+(width/snakeGamesPerRow/2), height/snakeGamesPerColumn/2);
  text("Mirror Movements"+ENTER+"(Multiplayer)", width/snakeGamesPerRow/2, height/snakeGamesPerColumn+(height/snakeGamesPerColumn/2));
  text("No Walls"+ENTER+"(Multiplayer)", width/snakeGamesPerRow+(width/snakeGamesPerRow/2), height/snakeGamesPerColumn+(height/snakeGamesPerColumn/2));
  text("No Walls"+ENTER+"Mirror Movements"+ENTER+"(Multiplayer)", width/snakeGamesPerRow*2+(width/snakeGamesPerRow/2), height/snakeGamesPerColumn/2);
}
void snakeSelectionMousePressed() {
  if (mouseX<width/snakeGamesPerRow&&mouseY<height/snakeGamesPerColumn&&snakeselection) {
    snakemultiplayer=true;
    snakeselection=false;
  }
  if (mouseX>width/snakeGamesPerRow&&mouseX<width/snakeGamesPerRow*2&&mouseY<height/snakeGamesPerColumn&&snakeselection) {
    mirrorMode=true;
    snakeselection=false;
  }
  if (mouseX<width/snakeGamesPerRow&&mouseY>height/snakeGamesPerColumn&&mouseY<height/snakeGamesPerColumn*2&&snakeselection) {
    mirrorMovements=true;
    snakeselection=false;
  }
  if (mouseX>width/snakeGamesPerRow&&mouseX<width/snakeGamesPerRow*2&&mouseY>height/snakeGamesPerColumn&&mouseY<height/snakeGamesPerColumn*2&&snakeselection) {
    snakeNoWalls=true;
    snakeselection=false;
  }
  if (mouseX>width/snakeGamesPerRow*2&&mouseX<width/snakeGamesPerRow*3&&mouseY<height/snakeGamesPerColumn&&snakeselection) {
    snakeNoWallsMirrorMovements=true;
    snakeselection=false;
  }
}
void snakeSelectionKeyPressed() {
  if (key=='g') {
    snakeselection=false;
    gameSelection=true;
    gameSelectionScreen();
  }
}
