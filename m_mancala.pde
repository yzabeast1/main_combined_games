int chole;
int holemove=0;
boolean bottomNameSelect;
int[] holes={4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4};
int[] mancalas=new int[2];
void mancalaSetup() {
  name1box.changeLocation(width/2-200,75,400,50);
  name2box.changeLocation(width/2-200,800,400,50);
  name1box.changing=false;
  name2box.changing=false;
  name1box.boxVisible=true;
  name2box.boxVisible=true;
}
void mancalaDraw() {
  textSize(50);
  textAlign(CENTER, CENTER);
  background(176, 150, 79);
  fill(255);
  for (int a=0; a<=1; a++) {
    for (int b=0; b<=5; b++) {
      fill(255);
      circle(300+150*b, 200+500*a, 100);
      fill(0);
      text(holes[a*6+b], 300+150*b, 200+500*a);
      fill(255);
    }
  }
  ellipse(100, 450, 100, 800);
  ellipse(1250, 450, 100, 800);
  fill(0);
  text(mancalas[0], 100, 450);
  text(mancalas[1], 1250, 450);
  movePieces();
  winText();
  name1box.show();
  name2box.show();
}
void mancalaMousePressed() {
  movingup();
  movingdown();
  name1box.mousePressed();
  name2box.mousePressed();
}
void mancalaKeyPressed() {
  if (key == 'g'&&!name1box.changing&&!name2box.changing) {
    gameSelectionScreen();
  }
  if (key=='r'&&!name1box.changing&&!name2box.changing) {
    mancalas[0] = 0;
    mancalas[1] = 0;
    for (int a=0; a<=11; a++) {
      holes[a]=4;
    }
  }
  name1box.keyPressed();
  name2box.keyPressed();
}
void movePieces() {
  if (holes[0]==0&&holes[1]==0&&holes[2]==0&holes[3]==0&holes[4]==0&&holes[5]==0) {
    for (int a=11; a>=6; a--) {
      while (holes[a]>0) {
        holes[a]--;
        mancalas[0]++;
      }
    }
  }
  if (holes[6]==0&&holes[7]==0&&holes[8]==0&holes[9]==0&holes[10]==0&&holes[11]==0) {
    for (int a=0; a<=5; a++) {
      while (holes[a]>0) {
        holes[a]--;
        mancalas[1]++;
      }
    }
  }
}
void winText() {
  if (holes[0]==0&&holes[1]==0&&holes[2]==0&holes[3]==0&holes[4]==0&&holes[5]==0&&holes[6]==0&&holes[7]==0&&holes[8]==0&holes[9]==0&holes[10]==0&&holes[11]==0) {
    fill(0);
    if (mancalas[0]>mancalas[1]) {
      textAlign(CENTER, CENTER);
      text(name1box.text+" Wins!!", width/2, height/2);
    }
    if (mancalas[0]<mancalas[1]) {
      textAlign(CENTER, CENTER);
      text(name2box.text+" Wins!!", width/2, height/2);
    }
    if (mancalas[0]==mancalas[1]) {
      textAlign(CENTER, CENTER);
      text("Tie Game!!", width/2, height/2);
    }
  }
}
