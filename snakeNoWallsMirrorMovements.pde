char nwmmdirrection='n';
char nwmmdirrection1='n';
boolean nwmmsnakedead=false;
int nwmmtailSize=5;
int nwmmtailSize1=5;
boolean[][] nwmmgrid=new boolean[40][40];
boolean[][] nwmmgrid1=new boolean[40][40];
int nwmmsquareSize=20;
int nwmmheadx=20;
int nwmmheady=20;
int nwmmheadx1=10;
int nwmmheady1=20;
color nwmmsnakeColor=#000000;
color nwmmsnakeColor1=#0000FF;
int nwmmtime=0;
int nwmmapplex=floor(random(0, 40));
int nwmmappley=floor(random(0, 40));
int nwmmsnakescore=0;
int nwmmspeed=5;//higher is slower
int nwmmsnakehscore=0;
int[] nwmmtailx=new int[nwmmtailSize];
int[] nwmmtaily=new int[nwmmtailSize];
int[] nwmmtailx1=new int[nwmmtailSize];
int[] nwmmtaily1=new int[nwmmtailSize];
int[] nwmmtemp={0};
boolean nwmmtwoplayer=false;
void nwmmsnakeSetup() {
  fullScreen();
  for (int a=0; a<=nwmmtailSize-1; a++) {
    nwmmtailx[a]=20;
    nwmmtaily[a]=20+a;
  }
  for (int a=0; a<=nwmmtailSize1-1; a++) {
    nwmmtailx1[a]=10;
    nwmmtaily1[a]=20+a;
  }
}
void nwmmsnakeDraw() {
  background(128);
  nwmmgrid=new boolean[40][40];
  nwmmgrid1=new boolean[40][40];
  nwmmgrid[nwmmheadx][nwmmheady]=true;      
  if (nwmmtwoplayer) {
    nwmmgrid1[nwmmheadx1][nwmmheady1]=true;
  }
  if (!nwmmsnakedead) {
    nwmmtime++;

    if (nwmmtime%nwmmspeed==0) {
      for (int a=nwmmtailx.length-2; a>=0; a--) {
        nwmmtailx[a+1]=nwmmtailx[a];
        nwmmtaily[a+1]=nwmmtaily[a];
      }
      if (nwmmtailx.length>0) {
        nwmmtailx[0]=nwmmheadx;
        nwmmtaily[0]=nwmmheady;
      }      
      if (nwmmtwoplayer) {
        for (int a=nwmmtailx1.length-2; a>=0; a--) {
          nwmmtailx1[a+1]=nwmmtailx1[a];
          nwmmtaily1[a+1]=nwmmtaily1[a];
        }
        if (nwmmtailx1.length>0) {
          nwmmtailx1[0]=nwmmheadx1;
          nwmmtaily1[0]=nwmmheady1;
        }
      }
      if (nwmmdirrection=='n'&&nwmmheady>0) {
        nwmmheady--;
      } else if (nwmmdirrection=='n'&&nwmmheady==0) {
        nwmmheady=39;
      } else if (nwmmdirrection=='s'&&nwmmheady<39) {
        nwmmheady++;
      } else if (nwmmdirrection=='s'&&nwmmheady==39) {
        nwmmheady=0;
      } else if (nwmmdirrection=='e'&&nwmmheadx<39) {
        nwmmheadx++;
      } else if (nwmmdirrection=='e'&&nwmmheadx==39) {
        nwmmheadx=0;
      } else if (nwmmdirrection=='w'&&nwmmheadx>0) {
        nwmmheadx--;
      } else if (nwmmdirrection=='w'&&nwmmheadx==0) {
        nwmmheadx=39;
      }
      if (nwmmtwoplayer) {
        if (nwmmdirrection1=='n'&&nwmmheady1>0) {
          nwmmheady1--;
        } else if (nwmmdirrection1=='n'&&nwmmheady1==0) {
          nwmmheady1=39;
        } else if (nwmmdirrection1=='s'&&nwmmheady1<39) {
          nwmmheady1++;
        } else if (nwmmdirrection1=='s'&&nwmmheady1==39) {
          nwmmheady1=0;
        } else if (nwmmdirrection1=='e'&&nwmmheadx1<39) {
          nwmmheadx1++;
        } else if (nwmmdirrection1=='e'&&nwmmheadx1==39) {
          nwmmheadx1=0;
        } else if (nwmmdirrection1=='w'&&nwmmheadx1>0) {
          nwmmheadx1--;
        } else if (nwmmdirrection1=='w'&&nwmmheadx1==0) {
          nwmmheadx1=39;
        }
      }
      for (int a=0; a<nwmmtailx.length; a++) {
        if (nwmmheadx==nwmmtailx[a]&&nwmmheady==nwmmtaily[a]) {
          nwmmsnakedead=true;
        }
      }      
      if (nwmmtwoplayer) {
        for (int a=0; a<nwmmtailx1.length; a++) {
          if (nwmmheadx==nwmmtailx1[a]&&nwmmheady==nwmmtaily1[a]) {
            nwmmsnakedead=true;
          }
        }
        for (int a=0; a<nwmmtailx1.length; a++) {
          if (nwmmheadx1==nwmmtailx1[a]&&nwmmheady1==nwmmtaily1[a]) {
            nwmmsnakedead=true;
          }
        }
        for (int a=0; a<nwmmtailx.length; a++) {
          if (nwmmheadx1==nwmmtailx[a]&&nwmmheady1==nwmmtaily[a]) {
            nwmmsnakedead=true;
          }
        }
      }
    }
    if (nwmmheadx==nwmmapplex&&nwmmheady==nwmmappley) {
      nwmmapplex=floor(random(0, 40));
      nwmmappley=floor(random(0, 40));
      nwmmsnakescore++;
      nwmmtailSize++;
      if (nwmmsnakescore>nwmmsnakehscore) {
        nwmmsnakehscore=nwmmsnakescore;
      }
      int[] temp1={40};
      nwmmtailx=concat(nwmmtailx, temp1);
      temp1[0]=0;
      nwmmtaily=concat(nwmmtaily, temp1);
    }      
    if (nwmmtwoplayer) {
      if (nwmmheadx1==nwmmapplex&&nwmmheady1==nwmmappley) {
        nwmmapplex=floor(random(0, 40));
        nwmmappley=floor(random(0, 40));
        nwmmsnakescore++;
        nwmmtailSize1++;
        if (nwmmsnakescore>nwmmsnakehscore) {
          nwmmsnakehscore=nwmmsnakescore;
        }
        int[] temp1={40};
        nwmmtailx1=concat(nwmmtailx1, temp1);
        temp1[0]=0;
        nwmmtaily1=concat(nwmmtaily1, temp1);
      }
    }
  }
  for (int a=0; a<=39; a++) {
    for (int b=0; b<=39; b++) {
      if (nwmmgrid[a][b]) {
        fill(nwmmsnakeColor);
      } else if (nwmmgrid1[a][b]) {
        fill(nwmmsnakeColor1);
      } else if (a==nwmmapplex&&b==nwmmappley) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      square(nwmmsquareSize*a, nwmmsquareSize*b, nwmmsquareSize);
      for (int c=0; c<nwmmtailx.length; c++) {
        if (a==nwmmtailx[c]&&b==nwmmtaily[c]) {
          fill(nwmmsnakeColor);
          square(nwmmsquareSize*a, nwmmsquareSize*b, nwmmsquareSize);
        }
      }
      if (nwmmtwoplayer) {
        for (int c=0; c<nwmmtailx1.length; c++) {
          if (a==nwmmtailx1[c]&&b==nwmmtaily1[c]) {
            fill(nwmmsnakeColor1);
            square(nwmmsquareSize*a, nwmmsquareSize*b, nwmmsquareSize);
          }
        }
      }
    }
  }
  fill(0);
  textSize(50);
  text("Score: "+nwmmsnakescore, 250, 850);
  text("High Score: "+nwmmsnakehscore, 750, 850);
  textAlign(CENTER, CENTER);
  text("Two Snakes", 1200, 175);
  if (nwmmsnakedead) {
    text("You Died", 1100, 450);
  }
  fill(255);
  rect(1100, 200, 200, 200);
  if (nwmmtwoplayer) {
    strokeWeight(10);
    line(1130, 330, 1180, 380);
    line(1180, 380, 1270, 250);
    strokeWeight(1);
  }
}
void nwmmsnakeKeyPressed() {      
  if (nwmmtwoplayer) {
    if (key=='w') {
      nwmmdirrection1='s';
    }
    if (key=='s') {
      nwmmdirrection1='n';
    }
    if (key=='d') {
      nwmmdirrection1='w';
    }
    if (key=='a') {
      nwmmdirrection1='e';
    }
  }
  if (keyCode==UP) {
    nwmmdirrection='s';
  }
  if (keyCode==DOWN) {
    nwmmdirrection='n';
  }
  if (keyCode==RIGHT) {
    nwmmdirrection='w';
  }
  if (keyCode==LEFT) {
    nwmmdirrection='e';
  }
  if (key=='r') {
    nwmmdirrection='n';
    nwmmdirrection1='n';
    nwmmsnakedead=false;
    nwmmtailSize=5;
    nwmmtailSize1=5;
    nwmmgrid=new boolean[40][40];
    nwmmgrid1=new boolean[40][40];
    nwmmheadx=20;
    nwmmheady=20;
    nwmmheadx1=10;
    nwmmheady1=20;
    nwmmtime=0;
    nwmmapplex=floor(random(0, 40));
    nwmmappley=floor(random(0, 40));
    nwmmsnakescore=0;
    //nwmmtailx=new int[nwmmtailSize];
    //for (int a=0; a<=nwmmtailSize-1; a++) {
    //  nwmmtailx[a]=20;
    //  nwmmtaily[a]=20+a;
    //}
    //nwmmtailx1=new int[nwmmtailSize1];
    //for (int a=0; a<=nwmmtailSize1-1; a++) {
    //  nwmmtailx1[a]=10;
    //  nwmmtaily1[a]=20+a;
    //}
  }
  if (key=='g') {
    gameSelectionScreen();
    snakeNoWallsMirrorMovements=false;
  }
}
void nwmmsnakeMousePressed() {
  if (mouseX>1100&&mouseX<1300&&mouseY>200&&mouseY<400&&nwmmsnakedead) {
    nwmmtwoplayer=!nwmmtwoplayer;
  }
}
