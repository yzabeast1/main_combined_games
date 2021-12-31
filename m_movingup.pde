void movingup() {
  if (dist(mouseX, mouseY, 1050, 200)<50) {
    holemove=0;
    chole=5;
    while (holes[5]!=0) {
      if (chole==0) {
        chole=20;
      }
      if (chole==19) {
        chole=12;
      }
      holes[5]--;
      if (chole == 1) {
        holes[0]++;
        chole--;
      }
      if (chole == 2) {
        holes[1]++;
        chole--;
      }
      if (chole == 3) {
        holes[2]++;
        chole--;
      }
      if (chole == 4) {
        holes[3]++;
        chole--;
      }
      if (chole == 5) {
        holes[4]++;
        chole--;
      }
      if (chole == 20) {
        mancalas[0]++;
        chole--;
      }
      if (chole == 6) {
        holemove++;
        chole--;
      }
      if (chole == 7) {
        holes[6]++;
        chole--;
      }
      if (chole == 8) {
        holes[7]++;
        chole--;
      }
      if (chole == 9) {
        holes[8]++;
        chole--;
      }
      if (chole == 10) {
        holes[9]++;
        chole--;
      }
      if (chole == 11) {
        holes[10]++;
        chole--;
      }
      if (chole == 12) {
        holes[11]++;
        chole--;
      }
    }
    holes[5]=holemove;
  }
  if (dist(mouseX, mouseY, 900, 200)<50) {
    holemove=0;
    chole=4;
    while (holes[4]!=0) {
      holes[4]--;
      if (chole==0) {
        chole=20;
      }
      if (chole==19) {
        chole=12;
      }
      if (chole == 1) {
        holes[0]++;
        chole--;
      }
      if (chole == 2) {
        holes[1]++;
        chole--;
      }
      if (chole == 3) {
        holes[2]++;
        chole--;
      }
      if (chole == 4) {
        holes[3]++;
        chole--;
      }
      if (chole == 5) {
        holemove++;
        chole--;
      }
      if (chole == 20) {
        mancalas[0]++;
        chole--;
      }
      if (chole == 6) {
        holes[5]++;
        chole--;
      }
      if (chole == 7) {
        holes[6]++;
        chole--;
      }
      if (chole == 8) {
        holes[7]++;
        chole--;
      }
      if (chole == 9) {
        holes[8]++;
        chole--;
      }
      if (chole == 10) {
        holes[9]++;
        chole--;
      }
      if (chole == 11) {
        holes[10]++;
        chole--;
      }
      if (chole == 12) {
        holes[11]++;
        chole--;
      }
    }
    holes[4]=holemove;
  }
  if (dist(mouseX, mouseY, 750, 200)<50) {
    holemove=0;
    chole=3;
    while (holes[3]!=0) {
      holes[3]--;
      if (chole==0) {
        chole=20;
      }
      if (chole==19) {
        chole=12;
      }
      if (chole == 1) {
        holes[0]++;
        chole--;
      }
      if (chole == 2) {
        holes[1]++;
        chole--;
      }
      if (chole == 3) {
        holes[2]++;
        chole--;
      }
      if (chole == 4) {
        holemove++;
        chole--;
      }
      if (chole == 5) {
        holes[4]++;
        chole--;
      }
      if (chole == 20) {
        mancalas[0]++;
        chole--;
      }
      if (chole == 6) {
        holes[5]++;
        chole--;
      }
      if (chole == 7) {
        holes[6]++;
        chole--;
      }
      if (chole == 8) {
        holes[7]++;
        chole--;
      }
      if (chole == 9) {
        holes[8]++;
        chole--;
      }
      if (chole == 10) {
        holes[9]++;
        chole--;
      }
      if (chole == 11) {
        holes[10]++;
        chole--;
      }
      if (chole == 12) {
        holes[11]++;
        chole--;
      }
    }
    holes[3]=holemove;
  }
  if (dist(mouseX, mouseY, 600, 200)<50) {
    holemove=0;
    chole=2;
    while (holes[2]!=0) {
      holes[2]--;
      if (chole==0) {
        chole=20;
      }
      if (chole==19) {
        chole=12;
      }
      if (chole == 1) {
        holes[0]++;
        chole--;
      }
      if (chole == 2) {
        holes[1]++;
        chole--;
      }
      if (chole == 3) {
        holemove++;
        chole--;
      }
      if (chole == 4) {
        holes[3]++;
        chole--;
      }
      if (chole == 5) {
        holes[4]++;
        chole--;
      }
      if (chole == 20) {
        mancalas[0]++;
        chole--;
      }
      if (chole == 6) {
        holes[5]++;
        chole--;
      }
      if (chole == 7) {
        holes[6]++;
        chole--;
      }
      if (chole == 8) {
        holes[7]++;
        chole--;
      }
      if (chole == 9) {
        holes[8]++;
        chole--;
      }
      if (chole == 10) {
        holes[9]++;
        chole--;
      }
      if (chole == 11) {
        holes[10]++;
        chole--;
      }
      if (chole == 12) {
        holes[11]++;
        chole--;
      }
    }
    holes[2]=holemove;
  }
  if (dist(mouseX, mouseY, 450, 200)<50) {
    holemove=0;
    chole=1;
    while (holes[1]!=0) {
      holes[1]--;
      if (chole==0) {
        chole=20;
      }
      if (chole==19) {
        chole=12;
      }
      if (chole == 1) {
        holes[0]++;
        chole--;
      }
      if (chole == 2) {
        holemove++;
        chole--;
      }
      if (chole == 3) {
        holes[2]++;
        chole--;
      }
      if (chole == 4) {
        holes[3]++;
        chole--;
      }
      if (chole == 5) {
        holes[4]++;
        chole--;
      }
      if (chole == 20) {
        mancalas[0]++;
        chole--;
      }
      if (chole == 6) {
        holes[5]++;
        chole--;
      }
      if (chole == 7) {
        holes[6]++;
        chole--;
      }
      if (chole == 8) {
        holes[7]++;
        chole--;
      }
      if (chole == 9) {
        holes[8]++;
        chole--;
      }
      if (chole == 10) {
        holes[9]++;
        chole--;
      }
      if (chole == 11) {
        holes[10]++;
        chole--;
      }
      if (chole == 12) {
        holes[11]++;
        chole--;
      }
    }
    holes[1]=holemove;
  }
  if (dist(mouseX, mouseY, 300, 200)<50) {
    holemove=0;
    chole=20;
    while (holes[0]!=0) {
      holes[0]--;
      if (chole==0) {
        chole=20;
      }
      if (chole==19) {
        chole=12;
      }
      if (chole == 1) {
        holemove++;
        chole--;
      }
      if (chole == 2) {
        holes[1]++;
        chole--;
      }
      if (chole == 3) {
        holes[2]++;
        chole--;
      }
      if (chole == 4) {
        holes[3]++;
        chole--;
      }
      if (chole == 5) {
        holes[4]++;
        chole--;
      }
      if (chole == 20) {
        mancalas[0]++;
        chole--;
      }
      if (chole == 6) {
        holes[5]++;
        chole--;
      }
      if (chole == 7) {
        holes[6]++;
        chole--;
      }
      if (chole == 8) {
        holes[7]++;
        chole--;
      }
      if (chole == 9) {
        holes[8]++;
        chole--;
      }
      if (chole == 10) {
        holes[9]++;
        chole--;
      }
      if (chole == 11) {
        holes[10]++;
        chole--;
      }
      if (chole == 12) {
        holes[11]++;
        chole--;
      }
    }
    holes[0]=holemove;
  }
}
