float[] redx={50, 250, 450, 650, 150, 350, 550, 750, 50, 250, 450, 650};
float[] redy={50, 50, 50, 50, 150, 150, 150, 150, 250, 250, 250, 250};
float[] blackx={150, 350, 550, 750, 50, 250, 450, 650, 150, 350, 550, 750};
float[] blacky={750, 750, 750, 750, 650, 650, 650, 650, 550, 550, 550, 550};
int[] validx={50, 250, 450, 650, 150, 350, 550, 750, 50, 250, 450, 650, 150, 350, 550, 750, 50, 250, 450, 650, 150, 350, 550, 750, 50, 250, 450, 650, 150, 350, 550, 750};
int[] validy={50, 50, 50, 50, 150, 150, 150, 150, 250, 250, 250, 250, 350, 350, 350, 350, 450, 450, 450, 450, 550, 550, 550, 550, 650, 650, 650, 650, 750, 750, 750, 750};
boolean draging=false;
char colorDragging;
int numberDragging;
boolean redWins=false;
boolean blackWins=false;
boolean[] blackkings=new boolean[12];
boolean[] redkings=new boolean[12];
void CheckersDraw() {
  textSize(40);
  textAlign(CENTER, CENTER);
  background(128);
  Cboard();
  circles();
  numbers();
  if (!redWins&&!blackWins) {
    dragable();
  }
  autoAlign();
  autotaking();
  win();
  kings();
  if (redWins) {
    text("Red Wins!", 1200, 400);
  } else if (blackWins) {    
    text("Black Wins!!", 1200, 400);
  }
}
void mouseReleased() {
  draging=false;
}
void Cboard() {
  fill(0);
  for (int y=0; y<=3; y++) {
    for (int x=0; x<=3; x++) {
      rect(200*x+100, 200*y, 100, 100);
      rect(200*x, 200*y+100, 100, 100);
    }
  }
  fill(255);
  for (int y=0; y<=3; y++) {
    for (int x=0; x<=3; x++) {
      rect(200*x+100, 100+200*y, 100, 100);
      rect(200*x, 200*y, 100, 100);
    }
  }
}
void circles() {
  fill(0);
  for (int a=0; a<=11; a++) {
    stroke(255);
    circle(blackx[a], blacky[a], 80);
  }
  fill(255, 0, 0);
  for (int a=0; a<=11; a++) {
    stroke(0);
    circle(redx[a], redy[a], 80);
  }
}
void numbers() {
  fill(255);
  for (int a=0; a<=11; a++) {
    text(a, redx[a], redy[a]);
    text(a, blackx[a], blacky[a]);
    textSize(20);
    if (redkings[a]) {
      text("K", redx[a], redy[a]-30);
    }
    if (blackkings[a]) {
      text("K", blackx[a], blacky[a]-30);
    }
    textSize(40);
  }
}
void CheckersKeyPressed() {
  if (key=='g') {
    gameSelectionScreen();
  }
  if (key == 'r') {
    for (int a=0; a<=3; a++) {
      blackx[4+a]=200*a+50;
      for (int b=0; b<=1; b++) {
        redx[a+8*b]=200*a+50;
      }
    }
    redy[0] = 50;
    redy[1] = 50;
    redy[2] = 50;
    redy[3] = 50;
    redy[4] = 150;
    redy[5] = 150;
    redy[6] = 150;
    redy[7] = 150;
    redy[8] = 250;
    redy[9] = 250;
    redy[10] = 250;
    redy[11] = 250;
    redx[4] = 150;
    redx[5] = 350;
    redx[6] = 550;
    redx[7] = 750;
    blackx[0] = 150;
    blacky[0] = 750;
    blackx[1] = 350;
    blacky[1] = 750;
    blackx[2] = 550;
    blacky[2] = 750;
    blackx[3] = 750;
    blacky[3] = 750;
    blacky[4] = 650;
    blacky[5] = 650;
    blacky[6] = 650;
    blacky[7] = 650;
    blackx[8] = 150;
    blacky[8] = 550;
    blackx[9] = 350;
    blacky[9] = 550;
    blackx[10] = 550;
    blacky[10] = 550;
    blackx[11] = 750;
    blacky[11] = 550;
    blackkings=new boolean[12];
    redkings=new boolean[12];
    redWins=false;
    blackWins=false;
  }
}
void kings() {
  for (int a=0; a<=11; a++) {
    if (redy[a]==750) {
      redkings[a]=true;
    }
    if (blacky[a]==50) {
      blackkings[a]=true;
    }
  }
}
void autotaking() {
  for (int a=0; a<=11; a++) {
    for (int b=0; b<=11; b++) {
      if (blackx[a]==redx[b]&&blacky[a]==redy[b]&&draging&&colorDragging=='b'&&numberDragging==a) {
        redx[b]=1000;
        redy[b]=1000;
      }
      if (redx[a]==blackx[b]&&redy[a]==blacky[b]&&draging&&colorDragging=='r'&&numberDragging==a) {
        blackx[b]=1000;
        blacky[b]=1000;
      }
    }
  }
}
int redtest=0;
int blacktest=0;
void win() {
  for (int a=0; a<=11; a++) {
    if (redx[a]==1000&&redy[a]==1000) {
      redtest++;
    }
    if (blackx[a]==1000&&blacky[a]==1000) {
      blacktest++;
    }
  }
  if (blacktest==12) {
    redWins=true;
  }
  if (redtest==12) {
    blackWins=true;
  }
  redtest=0;
  blacktest=0;
}
