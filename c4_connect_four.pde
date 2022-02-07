int[][] board={
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}};
boolean player1win=false;
boolean player2win=false;
boolean redTurn=true;
void connectFourSetup() {
  textSize(50);
  background(255, 255, 0);
  board();
  fill(c4_red);
  circle(width/2, height*8/9, 150);
  textAlign(CENTER, CENTER);
}
void connectFourDraw() {
  gravity();
  background(255, 255, 0);
  board();//done
  if (redTurn) {
    fill(c4_red);
  } else if (!redTurn) {
    fill(c4_black);
  }
  circle(width/2, 800, 150);
  C4_win();
  fill(0);
  if (player1win) {
    text("Red Wins!", 1150, 800);
  }
  if (player2win) {    
    text("Black Wins!", 1150, 800);
  }
}
void connectFourMousePressed() {
  clickCircles();//done
  resetCircles();//done
}
void connectFourKeyPressed() {
  if (key=='r') {
    reset();//done
    redTurn=true;
  }
  if (key=='g') {
    gameSelectionScreen();
  }
}
void reset() {
  for (int b=0; b<=6; b++) {
    for (int a=0; a<=6; a++) {
      board[b][a]=0;
    }
  }
  board();
  redTurn=true;
  player1win=false;
  player2win=false;
}
void C4_win() {
  for (int a=0; a<=3; a++) {
    for (int b=0; b<=6; b++) {
      if (board[a][b]==board[a+1][b]&&board[a][b]==board[a+2][b]&&board[a][b]==board[a+3][b]&&board[a][b]==1) {
        player1win=true;
      }
      if (board[a][b]==board[a+1][b]&&board[a][b]==board[a+2][b]&&board[a][b]==board[a+3][b]&&board[a][b]==2) {
        player2win=true;
      }
    }
  }
  for (int a=0; a<=6; a++) {
    for (int b=0; b<=3; b++) {
      if (board[a][b]==board[a][b+1]&&board[a][b]==board[a][b+2]&&board[a][b]==board[a][b+3]&&board[a][b]==1) {
        player1win=true;
      }
      if (board[a][b]==board[a][b+1]&&board[a][b]==board[a][b+2]&&board[a][b]==board[a][b+3]&&board[a][b]==2) {
        player2win=true;
      }
    }
  }
  for (int a=0; a<=3; a++) {
    for (int b=0; b<=3; b++) {
      if (board[a][b]==board[a+1][b+1]&&board[a][b]==board[a+2][b+2]&&board[a][b]==board[a+3][b+3]&&board[a][b]==1) {
        player1win=true;
      }
      if (board[a][b]==board[a+1][b+1]&&board[a][b]==board[a+2][b+2]&&board[a][b]==board[a+3][b+3]&&board[a][b]==2) {
        player2win=true;
      }
    }
  }
  for (int a=0; a<=3; a++) {
    for (int b=3; b<=6; b++) {
      if (board[a][b]==board[a+1][b-1]&&board[a][b]==board[a+2][b-2]&&board[a+3][b]==board[a][b-3]&&board[a][b]==1) {
        player1win=true;
      }
      if (board[a][b]==board[a+1][b-1]&&board[a][b]==board[a+2][b-2]&&board[a][b]==board[a+3][b-3]&&board[a][b]==2) {
        player2win=true;
      }
    }
  }
  for (int a=3; a<=6; a++) {
    for (int b=3; b<=6; b++) {
      if (board[a][b]==board[a-1][b-1]&&board[a][b]==board[a-2][b-2]&&board[a][b]==board[a-3][b-3]&&board[a][b]==1) {
        player1win=true;
      }
      if (board[a][b]==board[a-1][b-1]&&board[a][b]==board[a-2][b-2]&&board[a][b]==board[a-3][b-3]&&board[a][b]==2) {
        player2win=true;
      }
    }
  }
  for (int a=3; a<=6; a++) {
    for (int b=0; b<=3; b++) {
      if (board[a][b]==board[a-1][b+1]&&board[a][b]==board[a-2][b+2]&&board[a][b]==board[a-3][b+3]&&board[a][b]==1) {
        player1win=true;
      }
      if (board[a][b]==board[a-1][b+1]&&board[a][b]==board[a-2][b+2]&&board[a][b]==board[a-3][b+3]&&board[a][b]==2) {
        player2win=true;
      }
    }
  }
}
void board() {
  for (int a=1; a<=6; a++) {
    for (int b=0; b<=6; b++) {
      colorCircles(b, a);
      circle(width/2-450+(150*b), a*100, 100);
    }
  }
}
void colorCircles(int cols, int rows) {
  if (board[cols][rows]==0) {
    fill(128);
  } else if (board[cols][rows]==1) {
    fill(c4_red);
  } else if (board[cols][rows]==2) {
    fill(0);
  }
}
void clickCircles() {
  if (!player1win&&!player2win) {
    for (int a=1; a<=6; a++) {
      for (int b=0; b<=6; b++) {
        if (redTurn) {
          if (dist(mouseX, mouseY, width/2-450+(150*b), a*100)<50) {
            board[b][a]++;
            switchTurn();
          }
        } else if (!redTurn) {
          if (dist(mouseX, mouseY, width/2-450+(150*b), a*100)<50) {
            board[b][a] += 2;
            switchTurn();
          }
        }
      }
    }
  }
}
void gravity() {
  for (int a=0; a<=6; a++) {
    if (board[a][1]>0&&board[a][2]==0) {
      board[a][2]=board[a][1];
      board[a][1]=0;
    }
    if (board[a][2]>0&&board[a][3]==0) {
      board[a][3]=board[a][2];
      board[a][2]=0;
    }
    if (board[a][3]>0&&board[a][4]==0) {
      board[a][4]=board[a][3];
      board[a][3]=0;
    }
    if (board[a][4]>0&&board[a][5]==0) {
      board[a][5]=board[a][4];
      board[a][4]=0;
    }
    if (board[a][5]>0&&board[a][6]==0) {
      board[a][6]=board[a][5];
      board[a][5]=0;
    }
  }
}
void resetCircles() {
  for (int a=0; a<=6; a++) {
    for (int b=0; b<=6; b++) {
      if (board[a][b]>=3) {
        board[a][b]=0;
      }
    }
  }
}
void switchTurn() {
  if (redTurn) {
    redTurn=false;
    fill(c4_black);
  } else if (!redTurn) {
    redTurn=true;
    fill(c4_red);
  }
  circle(width/2, 800, 150);
}
