char[][] TTTCboard={
  {'t', 't', 't'}, 
  {'t', 't', 't'}, 
  {'t', 't', 't'}};
boolean turns;
boolean xTurn=false;
HashMap<Character, Integer> scores;
import java.util.HashMap;
char ai = 'O';
char human = 'X';
void tttSetup() {
  stroke(1);
  scores = new HashMap<Character, Integer>();
  scores.put('X', 10);
  scores.put('O', -10);
  scores.put('t', 0);
  bestMove();
}
void tttDraw() {
  background(0);
  fill(255);
  rect(0, 195, 600, 10);
  rect(0, 395, 600, 10);
  rect(195, 0, 10, 600);
  rect(395, 0, 10, 600);
  pieces();
}
void tttKeyPressed() {
  if (key == 'r') {
    for (int x=0; x<=2; x++) {
      for (int y=0; y<=2; y++) {
        TTTCboard[x][y]='t';
      }
    }
    xTurn=true;
  }
  if (key=='g') {
    gameSelectionScreen();
  }
}
void tttMousePressed() {
  for (int a=0; a<=2; a++) {
    for (int b=0; b<=2; b++) {
      if (mouseX>200*a-5&&mouseX<200*a+195&&mouseY>200*b-5&&mouseY<200*b+195) {
        println(a, b);
        if (xTurn) {
          TTTCboard[a][b]='X';
          xTurn=false;
          bestMove();
          printArray(TTTCboard[0]);
          printArray(TTTCboard[1]);
          printArray(TTTCboard[2]);
        }
      }
    }
  }
  //  if (mouseX<195 && mouseY<195) {
  //    tttboard(0, 0);
  //  }
  //  if (mouseX>205 && mouseY<195 && mouseX<395) {
  //    tttboard(1, 0);
  //  }
  //  if (mouseX>405 && mouseY<195 && mouseX<600) {
  //    tttboard(2, 0);
  //  }
  //  if (mouseX<195 && mouseY>405) {
  //    tttboard(0, 2);
  //  }
  //  if (mouseX>205 && mouseY>405 && mouseX<395) {
  //    tttboard(1, 2);
  //  }
  //  if (mouseX>405 && mouseY>405 && mouseX<600) {
  //    tttboard(2, 2);
  //  }
  //  if (mouseX<195 && mouseY>205 && mouseY <395) {
  //    tttboard(0, 1);
  //  }
  //  if (mouseX>205 && mouseY<405 && mouseX<395 && mouseY>205) {
  //    tttboard(1, 1);
  //  }
  //  if (mouseX>405 && mouseY<395 && mouseY>205 && mouseX<600) {
  //    tttboard(2, 1);
  //  }
}
//void tttboard(int column, int row) {
//  if (xTurn) {
//    TTTCboard[column][row]='X';
//    xTurn=false;
//    bestMove();
//    printArray(TTTCboard[0]);
//    printArray(TTTCboard[1]);
//    printArray(TTTCboard[2]);
//  }
//}
boolean equals3(char a, char b, char c) {
  return a == b && b == c && a != 't';
}

char checkWinner() {
  // Must use 'n' for "null" since Java doesn't allow primitive data types to be null
  char winner = 'n';

  // horizontal
  for (int i = 0; i < 3; i++) {
    if (equals3(TTTCboard[i][0], TTTCboard[i][1], TTTCboard[i][2])) {
      winner = TTTCboard[i][0];
    }
  }

  // Vertical
  for (int i = 0; i < 3; i++) {
    if (equals3(TTTCboard[0][i], TTTCboard[1][i], TTTCboard[2][i])) {
      winner = TTTCboard[0][i];
    }
  }

  // Diagonal
  if (equals3(TTTCboard[0][0], TTTCboard[1][1], TTTCboard[2][2])) {
    winner = TTTCboard[0][0];
  }
  if (equals3(TTTCboard[2][0], TTTCboard[1][1], TTTCboard[0][2])) {
    winner = TTTCboard[2][0];
  }

  int openSpots = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (TTTCboard[i][j] == 't') {
        openSpots++;
      }
    }
  }

  if (winner == 'n' && openSpots == 0) {
    return 't';
  } else {
    return 'X';
  }
}
void bestMove() {
  // AI to make its turn
  int bestScore = Integer.MIN_VALUE;
  int[] move = {0, 0};
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      // Is the spot available?
      if (TTTCboard[i][j] == 't') {
        println(1);
        TTTCboard[i][j] = ai;
        int score = minimax(TTTCboard, 0, false);
        TTTCboard[i][j] = 't';
        if (score > bestScore) {
          bestScore = score;
          move[0] = i;
          move[1] = j;
        }
      }
    }
  }
  TTTCboard[move[0]][move[1]] = ai;
  xTurn = true;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (TTTCboard[i][j]!='X'&&TTTCboard[i][j]!='O') {
        TTTCboard[i][j]='t';
      }
    }
  }
}

int minimax(char[][] TTTCboard, int depth, boolean isMaximizing) {
  char result = checkWinner();
  if (result != 'n') {
    println(str(result), result, checkWinner());
    return scores.get((result));
  }

  if (isMaximizing) {
    int bestScore = Integer.MIN_VALUE;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (TTTCboard[i][j] == 't') {
          TTTCboard[i][j] = ai;
          int score = minimax(TTTCboard, depth + 1, false);
          TTTCboard[i][j] = 't';
          bestScore = max(score, bestScore);
        }
      }
    }
    return bestScore;
  } else {
    int bestScore = Integer.MAX_VALUE;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Is the spot available?
        if (TTTCboard[i][j] == 't') {
          TTTCboard[i][j] = human;
          int score = minimax(TTTCboard, depth + 1, true);
          TTTCboard[i][j] = 't';
          bestScore = min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}
