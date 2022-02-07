int[][] TTTboard=new int[3][3];
boolean turns;
boolean xTurn=false;
boolean xwin;
boolean owin;
void tttSetup() {
  stroke(1);
}
void tttDraw() {
  wincheck();
  background(0);
  fill(255);
  rect(0, 195, 600, 10);
  rect(0, 395, 600, 10);
  rect(195, 0, 10, 600);
  rect(395, 0, 10, 600);
  stroke(10);
  pieces();
  stroke(1);
  if(xwin)text("X Wins!!",width*1000/1440,height/2);
  if(owin)text("O Wins!!",width*1000/1440,height/2);
}
void tttKeyPressed() {
  if (key == 'r') {
    xwin=false;
    owin=false;
    for (int x=0; x<=2; x++) {
      for (int y=0; y<=2; y++) {
        TTTboard[x][y]=0;
      }
    }
  }
  if (key=='g') {
    gameSelectionScreen();
  }
}
void tttMousePressed() {
  if (!xwin&&!owin) {
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
}
void tttboard(int column, int row) {
  if (xTurn) {
    TTTboard[column][row]=2;
    xTurn=false;
  } else if (!xTurn) {
    TTTboard[column][row]=1;
    xTurn=true;
  }
}
boolean equals3(int a, int b, int c) {
  return a==b&&b==c;
}
void wincheck() {
  for (int a=0; a<3; a++) {
    if (equals3(TTTboard[a][0], TTTboard[a][1], TTTboard[a][2])) {
      if (TTTboard[a][0]==1)xwin=true;
      if (TTTboard[a][0]==2)owin=true;
    } else if (equals3(TTTboard[0][a], TTTboard[1][a], TTTboard[2][a])) {
      if (TTTboard[0][a]==1)xwin=true;
      if (TTTboard[0][a]==2)owin=true;
    } else if (equals3(TTTboard[0][0], TTTboard[1][1], TTTboard[2][2])) {
      if (TTTboard[0][0]==1)xwin=true;
      if (TTTboard[0][0]==2)owin=true;
    } else if (equals3(TTTboard[2][0], TTTboard[1][1], TTTboard[0][2])) {
      if (TTTboard[0][2]==1)xwin=true;
      if (TTTboard[0][2]==2)owin=true;
    }
  }
}
