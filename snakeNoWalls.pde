char nwdirrection='n';
char nwdirrection1='n';
boolean nwsnakedead=false;
int nwtailSize=5;
int nwtailSize1=5;
boolean[][] nwgrid=new boolean[40][40];
boolean[][] nwgrid1=new boolean[40][40];
int nwsquareSize=20;
int nwheadx=20;
int nwheady=20;
int nwheadx1=10;
int nwheady1=20;
color nwsnakeColor=#000000;
color nwsnakeColor1=#0000FF;
int nwtime=0;
int nwapplex=floor(random(0, 40));
int nwappley=floor(random(0, 40));
int nwsnakescore=0;
int nwspeed=5;//higher is slower
int nwsnakehscore=0;
int[] nwtailx=new int[nwtailSize];
int[] nwtaily=new int[nwtailSize];
int[] nwtailx1=new int[nwtailSize];
int[] nwtaily1=new int[nwtailSize];
int[] nwtemp={0};
boolean nwtwoplayer=false;
void nwsnakeSetup() {
  fullScreen();
  for (int a=0; a<=nwtailSize-1; a++) {
    nwtailx[a]=20;
    nwtaily[a]=20+a;
  }
  for (int a=0; a<=nwtailSize1-1; a++) {
    nwtailx1[a]=10;
    nwtaily1[a]=20+a;
  }
}
void nwsnakeDraw() {
  background(128);
  nwgrid=new boolean[40][40];
  nwgrid1=new boolean[40][40];
  nwgrid[nwheadx][nwheady]=true;      
  if (nwtwoplayer) {
    nwgrid1[nwheadx1][nwheady1]=true;
  }
  if (!nwsnakedead) {
    nwtime++;

    if (nwtime%nwspeed==0) {
      for (int a=nwtailx.length-2; a>=0; a--) {
        nwtailx[a+1]=nwtailx[a];
        nwtaily[a+1]=nwtaily[a];
      }
      if (nwtailx.length>0) {
        nwtailx[0]=nwheadx;
        nwtaily[0]=nwheady;
      }      
      if (nwtwoplayer) {
        for (int a=nwtailx1.length-2; a>=0; a--) {
          nwtailx1[a+1]=nwtailx1[a];
          nwtaily1[a+1]=nwtaily1[a];
        }
        if (nwtailx1.length>0) {
          nwtailx1[0]=nwheadx1;
          nwtaily1[0]=nwheady1;
        }
      }
      if (nwdirrection=='n'&&nwheady>0) {
        nwheady--;
      } else if (nwdirrection=='n'&&nwheady==0) {
        nwheady=39;
      } else if (nwdirrection=='s'&&nwheady<39) {
        nwheady++;
      } else if (nwdirrection=='s'&&nwheady==39) {
        nwheady=0;
      } else if (nwdirrection=='e'&&nwheadx<39) {
        nwheadx++;
      } else if (nwdirrection=='e'&&nwheadx==39) {
        nwheadx=0;
      } else if (nwdirrection=='w'&&nwheadx>0) {
        nwheadx--;
      } else if (nwdirrection=='w'&&nwheadx==0) {
        nwheadx=39;
      }
      if (nwtwoplayer) {
        if (nwdirrection1=='n'&&nwheady1>0) {
          nwheady1--;
        } else if (nwdirrection1=='n'&&nwheady1==0) {
          nwheady1=39;
        } else if (nwdirrection1=='s'&&nwheady1<39) {
          nwheady1++;
        } else if (nwdirrection1=='s'&&nwheady1==39) {
          nwheady1=0;
        } else if (nwdirrection1=='e'&&nwheadx1<39) {
          nwheadx1++;
        } else if (nwdirrection1=='e'&&nwheadx1==39) {
          nwheadx1=0;
        } else if (nwdirrection1=='w'&&nwheadx1>0) {
          nwheadx1--;
        } else if (nwdirrection1=='w'&&nwheadx1==0) {
          nwheadx1=39;
        }
      }
      for (int a=0; a<nwtailx.length; a++) {
        if (nwheadx==nwtailx[a]&&nwheady==nwtaily[a]) {
          nwsnakedead=true;
        }
      }      
      if (nwtwoplayer) {
        for (int a=0; a<nwtailx1.length; a++) {
          if (nwheadx==nwtailx1[a]&&nwheady==nwtaily1[a]) {
            nwsnakedead=true;
          }
        }
        for (int a=0; a<nwtailx1.length; a++) {
          if (nwheadx1==nwtailx1[a]&&nwheady1==nwtaily1[a]) {
            nwsnakedead=true;
          }
        }
        for (int a=0; a<nwtailx.length; a++) {
          if (nwheadx1==nwtailx[a]&&nwheady1==nwtaily[a]) {
            nwsnakedead=true;
          }
        }
      }
    }
    if (nwheadx==nwapplex&&nwheady==nwappley) {
      nwapplex=floor(random(0, 40));
      nwappley=floor(random(0, 40));
      nwsnakescore++;
      nwtailSize++;
      if (nwsnakescore>nwsnakehscore) {
        nwsnakehscore=nwsnakescore;
      }
      int[] temp1={40};
      nwtailx=concat(nwtailx, temp1);
      temp1[0]=0;
      nwtaily=concat(nwtaily, temp1);
    }      
    if (nwtwoplayer) {
      if (nwheadx1==nwapplex&&nwheady1==nwappley) {
        nwapplex=floor(random(0, 40));
        nwappley=floor(random(0, 40));
        nwsnakescore++;
        nwtailSize1++;
        if (nwsnakescore>nwsnakehscore) {
          nwsnakehscore=nwsnakescore;
        }
        int[] temp1={40};
        nwtailx1=concat(nwtailx1, temp1);
        temp1[0]=0;
        nwtaily1=concat(nwtaily1, temp1);
      }
    }
  }
  for (int a=0; a<=39; a++) {
    for (int b=0; b<=39; b++) {
      if (nwgrid[a][b]) {
        fill(nwsnakeColor);
      } else if (nwgrid1[a][b]) {
        fill(nwsnakeColor1);
      } else if (a==nwapplex&&b==nwappley) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      square(nwsquareSize*a, nwsquareSize*b, nwsquareSize);
      for (int c=0; c<nwtailx.length; c++) {
        if (a==nwtailx[c]&&b==nwtaily[c]) {
          fill(nwsnakeColor);
          square(nwsquareSize*a, nwsquareSize*b, nwsquareSize);
        }
      }
      if (nwtwoplayer) {
        for (int c=0; c<nwtailx1.length; c++) {
          if (a==nwtailx1[c]&&b==nwtaily1[c]) {
            fill(nwsnakeColor1);
            square(nwsquareSize*a, nwsquareSize*b, nwsquareSize);
          }
        }
      }
    }
  }
  fill(0);
  textSize(50);
  text("Score: "+nwsnakescore, 250, 850);
  text("High Score: "+nwsnakehscore, 750, 850);
  textAlign(CENTER, CENTER);
  text("Two Snakes", 1200, 175);
  if (nwsnakedead) {
    text("You Died", 1100, 450);
  }
  fill(255);
  rect(1100, 200, 200, 200);
  if (nwtwoplayer) {
    strokeWeight(10);
    line(1130, 330, 1180, 380);
    line(1180, 380, 1270, 250);
    strokeWeight(1);
  }
}
void nwsnakeKeyPressed() {      
  if (nwtwoplayer) {
    if (key=='w') {
      nwdirrection1='n';
    }
    if (key=='s') {
      nwdirrection1='s';
    }
    if (key=='d') {
      nwdirrection1='e';
    }
    if (key=='a') {
      nwdirrection1='w';
    }
  }
  if (keyCode==UP) {
    nwdirrection='n';
  }
  if (keyCode==DOWN) {
    nwdirrection='s';
  }
  if (keyCode==RIGHT) {
    nwdirrection='e';
  }
  if (keyCode==LEFT) {
    nwdirrection='w';
  }
  if (key=='r') {
    nwdirrection='n';
    nwdirrection1='n';
    nwsnakedead=false;
    nwtailSize=5;
    nwtailSize1=5;
    nwgrid=new boolean[40][40];
    nwgrid1=new boolean[40][40];
    nwheadx=20;
    nwheady=20;
    nwheadx1=10;
    nwheady1=20;
    nwtime=0;
    nwapplex=floor(random(0, 40));
    nwappley=floor(random(0, 40));
    nwsnakescore=0;
    //nwtailx=new int[nwtailSize];
    //for (int a=0; a<=nwtailSize-1; a++) {
    //  nwtailx[a]=20;
    //  nwtaily[a]=20+a;
    //}
    //nwtailx1=new int[nwtailSize1];
    //for (int a=0; a<=nwtailSize1-1; a++) {
    //  nwtailx1[a]=10;
    //  nwtaily1[a]=20+a;
    //}
  }
  if (key=='g') {
    gameSelectionScreen();
    snakeNoWalls=false;
  }
}
void nwsnakeMousePressed() {
  if (mouseX>1100&&mouseX<1300&&mouseY>200&&mouseY<400&&nwsnakedead) {
    nwtwoplayer=!nwtwoplayer;
  }
}
