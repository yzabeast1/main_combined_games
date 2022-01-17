int chole;
int holemove=0;
int total;
boolean bottomNameSelect;
int[] holes={4,4,4,4,4,4,4,4,4,4,4,4};
int[] mancalas=new int[2];
void mancalaSetup() {
  nameChange[0]=false;
  nameChange[1]=false;
}
void mancalaDraw() {
  textSize(50);
  textAlign(CENTER, CENTER);
  background(176, 150, 79);
  fill(255);
  rect(width/2-200, 75, 400, 50);
  rect(width/2-200, 800, 400, 50);
  fill(0);
  text(name1, width/2, 100);
  text(name2, width/2, 825);
  fill(255);
  circle(300, 200, 100);
  circle(450, 200, 100);
  circle(600, 200, 100);
  circle(750, 200, 100);
  circle(900, 200, 100);
  circle(1050, 200, 100);
  circle(300, 700, 100);
  circle(450, 700, 100);
  circle(600, 700, 100);
  circle(750, 700, 100);
  circle(900, 700, 100);
  circle(1050, 700, 100);
  ellipse(100, 450, 100, 800);
  ellipse(1250, 450, 100, 800);
  fill(0);
  text(holes[0], 300, 200);
  text(holes[1], 450, 200);
  text(holes[2], 600, 200);
  text(holes[3], 750, 200);
  text(holes[4], 900, 200);
  text(holes[5], 1050, 200);
  text(holes[6], 1050, 700);
  text(holes[7], 900, 700);
  text(holes[8], 750, 700);
  text(holes[9], 600, 700);
  text(holes[10], 450, 700);
  text(holes[11], 300, 700);
  text(mancalas[0], 100, 450);
  text(mancalas[1], 1250, 450);
  total=holes[0]+holes[1]+holes[2]+holes[3]+holes[4]+holes[5]+holes[6]+holes[7]+holes[8]+holes[9]+holes[10]+holes[11]+mancalas[0]+mancalas[1];
  //  text(total, 600, 100);
  movePieces();
  winText();
}
void mancalaMousePressed() {
  movingup();
  movingdown();
  if (mouseX>width/2-200&&mouseY>75&&mouseX<width/2+200&&mouseY<125) {
    nameChange[0]=true;
  } else {
    nameChange[0]=false;
  }
  if (mouseX>width/2-200&&mouseY>800&&mouseX<width/2+200&&mouseY<850) {
    bottomNameSelect=true;
  } else {
    bottomNameSelect=false;
  }
}
void mancalaKeyPressed() {
  if (key == 'g'&&!nameChange[0]&&!bottomNameSelect) {
    gameSelectionScreen();
  }
  if (key=='r'&& !nameChange[0]&&!bottomNameSelect) {
    mancalas[0] = 0;
    mancalas[1] = 0;
    holes[0] = 4;
    holes[1] = 4;
    holes[2] = 4;
    holes[3] = 4;
    holes[4] = 4;
    holes[5] = 4;
    holes[6] = 4;
    holes[7] = 4;
    holes[8] = 4;
    holes[9] = 4;
    holes[10] = 4;
    holes[11] = 4;
  }
  if (key == BACKSPACE&&nameChange[0]) {
    if (name1.length() > 0) {
      name1 = name1.substring(0, name1.length()-1);
    }
  } else if (key == CODED&&nameChange[0]) {
    return;
  } else if (nameChange[0]) {
    name1 += key;
  }
  if (key == BACKSPACE&&bottomNameSelect) {
    if (name2.length() > 0) {
      name2 = name2.substring(0, name2.length()-1);
    }
  } else if (key == CODED&&bottomNameSelect) {
    return;
  } else if (bottomNameSelect) {
    name2 += key;
  }
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
      text(name1+" Wins!!", width/2, height/2);
    }
    if (mancalas[0]<mancalas[1]) {
      textAlign(CENTER, CENTER);
      text(name2+" Wins!!", width/2, height/2);
    }
    if (mancalas[0]==mancalas[1]) {
      textAlign(CENTER, CENTER);
      text("Tie Game!!", width/2, height/2);
    }
  }
}
