char mmdirrection='n';
char mmdirrection1='n';
boolean mmsnakedead=false;
int mmtailSize=5;
int mmtailSize1=5;
boolean[][] mmgrid=new boolean[40][40];
boolean[][] mmgrid1=new boolean[40][40];
int mmsquareSize=20;
int mmheadx=20;
int mmheady=20;
int mmheadx1=10;
int mmheady1=20;
color mmsnakeColor=#000000;
color mmsnakeColor1=#0000FF;
int mmtime=0;
int mmapplex=floor(random(0, 40));
int mmappley=floor(random(0, 40));
int mmsnakescore=0;
int mmspeed=5;//higher is slower
int mmsnakehscore=0;
int[] mmtailx=new int[mmtailSize];
int[] mmtaily=new int[mmtailSize];
int[] mmtailx1=new int[mmtailSize1];
int[] mmtaily1=new int[mmtailSize1];
int[] mmtemp={0};
boolean mmtwoplayer=false;
boolean mmpaused=false;
void mmSetup() {
  fullScreen();
  for (int a=0; a<=mmtailSize-1; a++) {
    mmtailx[a]=20;
    mmtaily[a]=20+a;
  }
  for (int a=0; a<=mmtailSize1-1; a++) {
    mmtailx1[a]=10;
    mmtaily1[a]=20+a;
  }
}
void mmDraw() {
  background(128);
  mmgrid=new boolean[40][40];
  mmgrid1=new boolean[40][40];
  mmgrid[mmheadx][mmheady]=true;      
  if (mmtwoplayer) {
    mmgrid1[mmheadx1][mmheady1]=true;
  }
  if (!mmsnakedead&&!mmpaused) {
    mmtime++;

    if (mmtime%mmspeed==0) {
      for (int a=mmtailx.length-2; a>=0; a--) {
        mmtailx[a+1]=mmtailx[a];
        mmtaily[a+1]=mmtaily[a];
      }
      if (mmtailx.length>0) {
        mmtailx[0]=mmheadx;
        mmtaily[0]=mmheady;
      }      
      if (mmtwoplayer) {
        for (int a=mmtailx1.length-2; a>=0; a--) {
          mmtailx1[a+1]=mmtailx1[a];
          mmtaily1[a+1]=mmtaily1[a];
        }
        if (mmtailx1.length>0) {
          mmtailx1[0]=mmheadx1;
          mmtaily1[0]=mmheady1;
        }
      }
      if (mmdirrection=='n'&&mmheady>0) {
        mmheady--;
      } else if (mmdirrection=='n'&&mmheady==0) {
        mmsnakedead=true;
      } else if (mmdirrection=='s'&&mmheady<39) {
        mmheady++;
      } else if (mmdirrection=='s'&&mmheady==39) {
        mmsnakedead=true;
      } else if (mmdirrection=='e'&&mmheadx<39) {
        mmheadx++;
      } else if (mmdirrection=='e'&&mmheadx==39) {
        mmsnakedead=true;
      } else if (mmdirrection=='w'&&mmheadx>0) {
        mmheadx--;
      } else if (mmdirrection=='w'&&mmheadx==0) {
        mmsnakedead=true;
      }
      if (mmtwoplayer) {
        if (mmdirrection1=='n'&&mmheady1>0) {
          mmheady1--;
        } else if (mmdirrection1=='n'&&mmheady1==0) {
          mmsnakedead=true;
        } else if (mmdirrection1=='s'&&mmheady1<39) {
          mmheady1++;
        } else if (mmdirrection1=='s'&&mmheady1==39) {
          mmsnakedead=true;
        } else if (mmdirrection1=='e'&&mmheadx1<39) {
          mmheadx1++;
        } else if (mmdirrection1=='e'&&mmheadx1==39) {
          mmsnakedead=true;
        } else if (mmdirrection1=='w'&&mmheadx1>0) {
          mmheadx1--;
        } else if (mmdirrection1=='w'&&mmheadx1==0) {
          mmsnakedead=true;
        }
      }
      for (int a=0; a<mmtailx.length; a++) {
        if (mmheadx==mmtailx[a]&&mmheady==mmtaily[a]) {
          mmsnakedead=true;
        }
      }      
      if (mmtwoplayer) {
        for (int a=0; a<mmtailx1.length; a++) {
          if (mmheadx==mmtailx1[a]&&mmheady==mmtaily1[a]) {
            mmsnakedead=true;
          }
        }
        for (int a=0; a<mmtailx1.length; a++) {
          if (mmheadx1==mmtailx1[a]&&mmheady1==mmtaily1[a]) {
            mmsnakedead=true;
          }
        }
        for (int a=0; a<mmtailx.length; a++) {
          if (mmheadx1==mmtailx[a]&&mmheady1==mmtaily[a]) {
            mmsnakedead=true;
          }
        }
      }
    }
    if (mmheadx==mmapplex&&mmheady==mmappley) {
      mmapplex=floor(random(0, 40));
      mmappley=floor(random(0, 40));
      mmsnakescore++;
      mmtailSize++;
      if (mmsnakescore>mmsnakehscore) {
        mmsnakehscore=mmsnakescore;
      }
      int[] temp1={40};
      mmtailx=concat(mmtailx, temp1);
      temp1[0]=0;
      mmtaily=concat(mmtaily, temp1);
    }      
    if (mmtwoplayer) {
      if (mmheadx1==mmapplex&&mmheady1==mmappley) {
        mmapplex=floor(random(0, 40));
        mmappley=floor(random(0, 40));
        mmsnakescore++;
        mmtailSize1++;
        if (mmsnakescore>mmsnakehscore) {
          mmsnakehscore=mmsnakescore;
        }
        int[] temp1={40};
        mmtailx1=concat(mmtailx1, temp1);
        temp1[0]=0;
        mmtaily1=concat(mmtaily1, temp1);
      }
    }
  }
  for (int a=0; a<=39; a++) {
    for (int b=0; b<=39; b++) {
      if (mmgrid[a][b]) {
        fill(mmsnakeColor);
      } else if (mmgrid1[a][b]) {
        fill(mmsnakeColor1);
      } else if (a==mmapplex&&b==mmappley) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      square(mmsquareSize*a, mmsquareSize*b, mmsquareSize);
      for (int c=0; c<mmtailx.length; c++) {
        if (a==mmtailx[c]&&b==mmtaily[c]) {
          fill(mmsnakeColor);
          square(mmsquareSize*a, mmsquareSize*b, mmsquareSize);
        }
      }
      if (mmtwoplayer) {
        for (int c=0; c<mmtailx1.length; c++) {
          if (a==mmtailx1[c]&&b==mmtaily1[c]) {
            fill(mmsnakeColor1);
            square(mmsquareSize*a, mmsquareSize*b, mmsquareSize);
          }
        }
      }
    }
  }
  fill(0);
  textSize(50);
  text("Score: "+mmsnakescore, 250, 850);
  text("High Score: "+mmsnakehscore, 750, 850);
  textAlign(CENTER, CENTER);
  text("Two Snakes", 1200, 175);
  if (mmsnakedead) {
    text("You Died", 1100, 450);
  }
  fill(255);
  rect(1100, 200, 200, 200);
  if (mmtwoplayer) {
    strokeWeight(10);
    line(1130, 330, 1180, 380);
    line(1180, 380, 1270, 250);
    strokeWeight(1);
  }
}
void mmKeyPressed() {
  if (key=='g') {
    gameSelectionScreen();
    mirrorMovements=false;
  }
  if (key==' ') {
    mmpaused=!mmpaused;
  }
  if (mmtwoplayer) {
    if (key=='w') {
      mmdirrection1='s';
    }
    if (key=='s') {
      mmdirrection1='w';
    }
    if (key=='d') {
      mmdirrection1='w';
    }
    if (key=='a') {
      mmdirrection1='e';
    }
  }
  if (keyCode==UP) {
    mmdirrection='s';
  }
  if (keyCode==DOWN) {
    mmdirrection='n';
  }
  if (keyCode==RIGHT) {
    mmdirrection='w';
  }
  if (keyCode==LEFT) {
    mmdirrection='e';
  }
  if (key=='r') {
    mmdirrection='n';
    mmdirrection1='n';
    mmsnakedead=false;
    mmtailSize=5;
    mmtailSize1=5;
    mmgrid=new boolean[40][40];
    mmgrid1=new boolean[40][40];
    mmheadx=20;
    mmheady=20;
    mmheadx1=10;
    mmheady1=20;
    mmtime=0;
    mmapplex=floor(random(0, 40));
    mmappley=floor(random(0, 40));
    mmsnakescore=0;
    //mmtailx=new int[mmtailSize];
    //for (int a=0; a<=mmtailSize-1; a++) {
    //  mmtailx[a]=20;
    //  mmtaily[a]=20+a;
    //}
    //mmtailx1=new int[mmtailSize1];
    //for (int a=0; a<=mmtailSize1-1; a++) {
    //  mmtailx1[a]=10;
    //  mmtaily1[a]=20+a;
    //}
  }
  //if (key=='g') {
  //  gameSelectionScreen();
  //}
}
void mmMousePressed() {
  if (mouseX>1100&&mouseX<1300&&mouseY>200&&mouseY<400&&mmsnakedead) {
    mmtwoplayer=!mmtwoplayer;
  }
}
