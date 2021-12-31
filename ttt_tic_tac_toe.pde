int[][] TTTboard={
  {1, 1, 1}, 
  {1, 1, 1}, 
  {1, 1, 1}};
boolean turns;
boolean welcomeScreen = true;
boolean xTurn=false;

void tttSetup() {
  stroke(1);
}
void tttDraw() {
  background(0);
  fill(255);
  rect(0, 195, 600, 10);
  rect(0, 395, 600, 10);
  rect(195, 0, 10, 600);
  rect(395, 0, 10, 600);
  pieces();
  tttReset();
}
void tttReset() {
  for (int x=0; x<=2; x++) {
    for (int y=0; y<=2; y++) {
      if (TTTboard[x][y]>=4) {
        TTTboard[x][y]=1;
      }
    }
  }
}
void tttKeyPressed() {
  if (key == 'r') {
    for (int x=0; x<=2; x++) {
      for (int y=0; y<=2; y++) {
        TTTboard[x][y]=1;
      }
    }
  }
  if (key=='g') {
    gameSelectionScreen();
  }
}
void tttMousePressed() {
  if (mouseX<195 && mouseY<195) {
    tttboard(0, 0);
  }
  if (mouseX>205 && mouseY<195 && mouseX<395) {
    tttboard(1, 0);
  }
  if (mouseX>405 && mouseY<195 && mouseX<600) {
    tttboard(2, 0);
  }
  if (mouseX<195 && mouseY>405) {
    tttboard(0, 2);
  }
  if (mouseX>205 && mouseY>405 && mouseX<395) {
    tttboard(1, 2);
  }
  if (mouseX>405 && mouseY>405 && mouseX<600) {
    tttboard(2, 2);
  }
  if (mouseX<195 && mouseY>205 && mouseY <395) {
    tttboard(0, 1);
  }
  if (mouseX>205 && mouseY<405 && mouseX<395 && mouseY>205) {
    tttboard(1, 1);
  }
  if (mouseX>405 && mouseY<395 && mouseY>205 && mouseX<600) {
    tttboard(2, 1);
  }
}
void tttboard(int column, int row) {
  /*if (xTurn) {
   TTTboard[column][row]+=2;
   xTurn=false;
   }
   else if (xTurn) {
   TTTboard[column][row]++;
   xTurn=true;
   }*/
  TTTboard[column][row]++;
}
