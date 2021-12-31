int[][] P_board=new int[19][19];
boolean P_player1win=false;
boolean P_player2win=false;
boolean P_redTurn=false;
int P_redTaken=0;
int P_blackTaken=0;
color P_red=#FF0000;
color P_black=#000000;
void penteSetup() {
  textSize(50);
  fullScreen();
  background(255, 255, 0);
  P_board();
  fill(P_black);
  circle(width/2, 800, 150);
  textAlign(CENTER, CENTER);
  P_board[9][9]=1;
}
void penteDraw() {
  background(255, 255, 0);
  P_board();
  if (P_redTurn) {
    fill(P_red);
  } else if (!P_redTurn) {
    fill(P_black);
  }
  circle(width/2, 800, 150);
  fill(0);
  text("red has taken "+P_redTaken/2+" sets", 1100, 250);
  text("black has taken "+P_blackTaken/2+" sets", 1100, 500);
  if (P_player1win) {
    text("Red Wins!", 1100, 375);
  }
  if (P_player2win) {
    text("Black Wins!", 1100, 375);
  }
  if (P_redTaken>=10) {
    P_player1win=true;
  }
  if (P_blackTaken>=10) {
    P_player2win=true;
  }
}
void penteMousePressed() {
  P_clickCircles();
  P_resetCircles();
  P_winTest();
}
void penteKeyPressed() {
  if (key=='r') {
    P_reset();
  }
  if (key=='g') {
    gameSelectionScreen();
    gameSelection=true;
    pente=false;
  }
}
void P_reset() {
  for (int b=0; b<=18; b++) {
    for (int a=0; a<=18; a++) {
      P_board[b][a]=0;
    }
  }
  P_board();
  P_redTurn=false;
  P_player1win=false;
  P_player2win=false;
  P_redTaken=0;
  P_blackTaken=0;
  P_board[9][9]=1;
}
void P_clickCircles() {
  if (!P_player1win&&!P_player2win) {
    for (int a=0; a<=18; a++) {
      for (int b=0; b<=18; b++) {
        if (dist(mouseX, mouseY, width/2-450+(30*b), a*30)<15) {
          if (P_redTurn&&P_board[b][a]==0) {
            P_board[b][a]=1;
            P_taking(a, b);
            P_switchTurn();
          } else if (!P_redTurn&&P_board[b][a]==0) {
            P_board[b][a] = 2;
            P_taking(a, b);
            P_switchTurn();
          }
        }
      }
    }
  }
}
void P_board() {
  for (int a=1; a<=18; a++) {
    for (int b=0; b<=18; b++) {
      P_colorCircles(b, a);
      circle(width/2-450+(30*b), a*30, 30);
    }
  }
}
void P_colorCircles(int cols, int rows) {
  if (P_board[cols][rows]==0) {
    fill(128);
  } else if (P_board[cols][rows]==1) {
    fill(P_red);
  } else if (P_board[cols][rows]==2) {
    fill(P_black);
  }
}
void P_resetCircles() {
  for (int a=0; a<=18; a++) {
    for (int b=0; b<=18; b++) {
      if (P_board[a][b]>=3) {
        P_board[a][b]=0;
      }
    }
  }
}
void P_switchTurn() {
  if (P_redTurn) {
    P_redTurn=false;
    fill(P_black);
  } else if (!P_redTurn) {
    P_redTurn=true;
    fill(P_red);
  }
  circle(width/2, 800, 150);
}
void P_taking(int b, int a) {
  if (a<=15) {
    if (P_board[a][b]==P_board[a+3][b]&&P_board[a+1][b]==P_board[a+2][b]&&P_board[a][b]==1&&P_board[a+1][b]==2) {
      P_board[a+1][b]=0;
      P_board[a+2][b]=0;
      P_redTaken+=2;
    }
  }
  if (a>=3) {
    if (P_board[a][b]==P_board[a-3][b]&&P_board[a-1][b]==P_board[a-2][b]&&P_board[a][b]==1&&P_board[a-1][b]==2) {
      P_board[a-1][b]=0;
      P_board[a-2][b]=0;
      P_redTaken+=2;
    }
  }
  if (b<=15) {
    if (P_board[a][b]==P_board[a][b+3]&&P_board[a][b+1]==P_board[a][b+2]&&P_board[a][b]==1&&P_board[a][b+1]==2) {
      P_board[a][b+1]=0;
      P_board[a][b+2]=0;
      P_redTaken+=2;
    }
  }
  if (b>=3) {
    if (P_board[a][b]==P_board[a][b-3]&&P_board[a][b-1]==P_board[a][b-2]&&P_board[a][b]==1&&P_board[a][b-1]==2) {
      P_board[a][b-1]=0;
      P_board[a][b-2]=0;
      P_redTaken+=2;
    }
  }
  if (a<=15&&b<=15) {
    if (P_board[a][b]==P_board[a+3][b+3]&&P_board[a+1][b+1]==P_board[a+2][b+2]&&P_board[a][b]==1&&P_board[a+1][b+1]==2) {
      P_board[a+1][b+1]=0;
      P_board[a+2][b+2]=0;
      P_redTaken+=2;
    }
  }
  if (a>=3&&b>=3) {
    if (P_board[a][b]==P_board[a-3][b-3]&&P_board[a-1][b-1]==P_board[a-2][b-2]&&P_board[a][b]==1&&P_board[a-1][b-1]==2) {
      P_board[a-1][b-1]=0;
      P_board[a-2][b-2]=0;
      P_redTaken+=2;
    }
  }
  if (a>=3&&b<=15) {
    if (P_board[a][b]==P_board[a-3][b+3]&&P_board[a-1][b+1]==P_board[a-2][b+2]&&P_board[a][b]==1&&P_board[a-1][b+1]==2) {
      P_board[a-1][b+1]=0;
      P_board[a-2][b+2]=0;
      P_redTaken+=2;
    }
  }
  if (a<=15&&b>=3) {
    if (P_board[a][b]==P_board[a+3][b-3]&&P_board[a+1][b-1]==P_board[a+2][b-2]&&P_board[a][b]==1&&P_board[a+1][b-1]==2) {
      P_board[a+1][b-1]=0;
      P_board[a+2][b-2]=0;
      P_redTaken+=2;
    }
  }
  if (a<=15) {
    if (P_board[a][b]==P_board[a+3][b]&&P_board[a+1][b]==P_board[a+2][b]&&P_board[a][b]==2&&P_board[a+1][b]==1) {
      P_board[a+1][b]=0;
      P_board[a+2][b]=0;
      P_blackTaken+=2;
      print("taken3");
    }
  }
  if (a>=3) {
    if (P_board[a][b]==P_board[a-3][b]&&P_board[a-1][b]==P_board[a-2][b]&&P_board[a][b]==2&&P_board[a-1][b]==1) {
      P_board[a-1][b]=0;
      P_board[a-2][b]=0;
      P_blackTaken+=2;
      print("taken3");
    }
  }
  if (b<=15) {
    if (P_board[a][b]==P_board[a][b+3]&&P_board[a][b+1]==P_board[a][b+2]&&P_board[a][b]==2&&P_board[a][b+1]==1) {
      P_board[a][b+1]=0;
      P_board[a][b+2]=0;
      P_blackTaken+=2;
      print("taken4");
    }
  }
  if (b>=3) {
    if (P_board[a][b]==P_board[a][b-3]&&P_board[a][b-1]==P_board[a][b-2]&&P_board[a][b]==2&&P_board[a][b-1]==1) {
      P_board[a][b-1]=0;
      P_board[a][b-2]=0;
      P_blackTaken+=2;
      print("taken4");
    }
  }
  if (a<=15&&b<=15) {
    println(P_board[a][b], P_board[a+1][b+1], P_board[a+2][b+2], P_board[a+3][b+3]);
    if (P_board[a][b]==P_board[a+3][b+3]&&P_board[a+1][b+1]==P_board[a+2][b+2]&&P_board[a][b]==2&&P_board[a+1][b+1]==1) {
      P_board[a+1][b+1]=0;
      P_board[a+2][b+2]=0;
      P_blackTaken+=2;
    }
  }
  if (a>=3&&b>=3) {
    if (P_board[a][b]==P_board[a-3][b-3]&&P_board[a-1][b-1]==P_board[a-2][b-2]&&P_board[a][b]==2&&P_board[a-1][b-1]==1) {
      P_board[a-1][b-1]=0;
      P_board[a-2][b-2]=0;
      P_blackTaken+=2;
    }
  }
  if (a>=3&&b<=15) {
    if (P_board[a][b]==P_board[a-3][b+3]&&P_board[a-1][b+1]==P_board[a-2][b+2]&&P_board[a][b]==2&&P_board[a-1][b+1]==1) {
      P_board[a-1][b+1]=0;
      P_board[a-2][b+2]=0;
      P_blackTaken+=2;
    }
  }
  if (a<=15&&b>=3) {
    if (P_board[a][b]==P_board[a+3][b-3]&&P_board[a+1][b-1]==P_board[a+2][b-2]&&P_board[a][b]==2&&P_board[a+1][b-1]==1) {
      P_board[a+1][b-1]=0;
      P_board[a+2][b-2]=0;
      P_blackTaken+=2;
    }
  }
}
void P_winTest() {
  for (int a=0; a<=14; a++) {
    for (int b=0; b<=18; b++) {
      if (P_board[a][b]==P_board[a+1][b]&&P_board[a][b]==P_board[a+2][b]&&P_board[a][b]==P_board[a+3][b]&&P_board[a][b]==P_board[a+4][b]&&P_board[a][b]==1) {
        P_player1win=true;
      }
    }
  }
  for (int a=0; a<=18; a++) {
    for (int b=0; b<=14; b++) {
      if (P_board[a][b]==P_board[a][b+1]&&P_board[a][b]==P_board[a][b+2]&&P_board[a][b]==P_board[a][b+3]&&P_board[a][b]==P_board[a][b+4]&&P_board[a][b]==1) {
        P_player1win=true;
      }
    }
  }
  for (int a=0; a<=14; a++) {
    for (int b=0; b<=14; b++) {
      if (P_board[a][b]==P_board[a+1][b+1]&&P_board[a][b]==P_board[a+2][b+2]&&P_board[a][b]==P_board[a+3][b+3]&&P_board[a][b]==P_board[a+4][b+4]&&P_board[a][b]==1) {
        P_player1win=true;
      }
    }
  }
  for (int a=4; a<=18; a++) {
    for (int b=0; b<=14; b++) {
      if (P_board[a][b]==P_board[a-1][b+1]&&P_board[a][b]==P_board[a-2][b+2]&&P_board[a][b]==P_board[a-3][b+3]&&P_board[a][b]==P_board[a-4][b+4]&&P_board[a][b]==1) {
        P_player1win=true;
      }
    }
  }
  for (int a=0; a<=14; a++) {
    for (int b=0; b<=18; b++) {
      if (P_board[a][b]==P_board[a+1][b]&&P_board[a][b]==P_board[a+2][b]&&P_board[a][b]==P_board[a+3][b]&&P_board[a][b]==P_board[a+4][b]&&P_board[a][b]==2) {
        P_player2win=true;
      }
    }
  }
  for (int a=0; a<=14; a++) {
    for (int b=0; b<=14; b++) {
      if (P_board[a][b]==P_board[a][b+1]&&P_board[a][b]==P_board[a][b+2]&&P_board[a][b]==P_board[a][b+3]&&P_board[a][b]==P_board[a][b+4]&&P_board[a][b]==2) {
        P_player2win=true;
      }
    }
  }
  for (int a=0; a<=14; a++) {
    for (int b=0; b<=14; b++) {
      if (P_board[a][b]==P_board[a+1][b+1]&&P_board[a][b]==P_board[a+2][b+2]&&P_board[a][b]==P_board[a+3][b+3]&&P_board[a][b]==P_board[a+4][b+4]&&P_board[a][b]==2) {
        P_player2win=true;
      }
    }
  }
  for (int a=4; a<=18; a++) {
    for (int b=0; b<=14; b++) {
      if (P_board[a][b]==P_board[a-1][b+1]&&P_board[a][b]==P_board[a-2][b+2]&&P_board[a][b]==P_board[a-3][b+3]&&P_board[a][b]==P_board[a-4][b+4]&&P_board[a][b]==2) {
        P_player2win=true;
      }
    }
  }
}
