void movePieces() {
  if (holes[0]==0&&holes[1]==0&&holes[2]==0&holes[3]==0&holes[4]==0&&holes[5]==0) {
    while (holes[11]!=0) {
      holes[11]--;
      mancalas[0]++;
    }
    while (holes[10]!=0) {
      holes[10]--;
      mancalas[0]++;
    }
    while (holes[9]!=0) {
      holes[9]--;
      mancalas[0]++;
    }
    while (holes[8]!=0) {
      holes[8]--;
      mancalas[0]++;
    }
    while (holes[7]!=0) {
      holes[7]--;
      mancalas[0]++;
    }
    while (holes[6]!=0) {
      holes[6]--;
      mancalas[0]++;
    }
  }
  if (holes[6]==0&&holes[7]==0&&holes[8]==0&holes[9]==0&holes[10]==0&&holes[11]==0) {
    while (holes[0]!=0) {
      holes[0]--;
      mancalas[1]++;
    }
    while (holes[1]!=0) {
      holes[1]--;
      mancalas[1]++;
    }
    while (holes[2]!=0) {
      holes[2]--;
      mancalas[1]++;
    }
    while (holes[3]!=0) {
      holes[3]--;
      mancalas[1]++;
    }
    while (holes[4]!=0) {
      holes[4]--;
      mancalas[1]++;
    }
    while (holes[5]!=0) {
      holes[5]--;
      mancalas[1]++;
    }
  }
}
void winText() {
  if (holes[0]==0&&holes[1]==0&&holes[2]==0&holes[3]==0&holes[4]==0&&holes[5]==0&&holes[6]==0&&holes[7]==0&&holes[8]==0&holes[9]==0&holes[10]==0&&holes[11]==0) {
    fill(0);
    if (mancalas[0]>mancalas[1]) {
      textAlign(CENTER, CENTER);
      text(name1+" wins!!", width/2, height/2);
    }
    if (mancalas[0]<mancalas[1]) {
      textAlign(CENTER, CENTER);
      text(name2+" wins!!", width/2, height/2);
    }
    if (mancalas[0]==mancalas[1]) {
      textAlign(CENTER, CENTER);
      text("tie game!!", width/2, height/2);
    }
  }
}
