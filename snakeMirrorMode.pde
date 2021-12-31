char mdirrection='n';
char mdirrection1='s';
boolean msnakedead=false;
int mtailSize=5;
int mtailSize1=5;
boolean[][] mgrid=new boolean[40][40];
boolean[][] mgrid1=new boolean[40][40];
int msquareSize=20;
int mheadx=29;
int mheady=20;
int mheadx1=10;
int mheady1=20;
color msnakeColor=#000000;
color msnakeColor1=#0000FF;
int mtime=0;
int mapplex=floor(random(0, 40));
int mappley=floor(random(0, 40));
int msnakescore=0;
int mspeed=5;//higher is slower
int msnakehscore=0;
int[] mtailx=new int[mtailSize];
int[] mtaily=new int[mtailSize];
int[] mtailx1=new int[mtailSize];
int[] mtaily1=new int[mtailSize];
int[] mtemp={0};
boolean mpaused=false;
void msetup() {
  fullScreen();
  for (int a=0; a<=mtailSize-1; a++) {
    mtailx[a]=29;
    mtaily[a]=20+a;
  }
  for (int a=0; a<=mtailSize1-1; a++) {
    mtailx1[a]=10;
    mtaily1[a]=20-a;
  }
}
void mdraw() {
  background(128);
  mgrid=new boolean[40][40];
  mgrid1=new boolean[40][40];
  mgrid[mheadx][mheady]=true;      
  mgrid1[mheadx1][mheady1]=true;
  if (!msnakedead&&!mpaused) {
    mtime++;

    if (mtime%mspeed==0) {
      for (int a=mtailx.length-2; a>=0; a--) {
        mtailx[a+1]=mtailx[a];
        mtaily[a+1]=mtaily[a];
      }
      if (mtailx.length>0) {
        mtailx[0]=mheadx;
        mtaily[0]=mheady;
      }
      for (int a=mtailx1.length-2; a>=0; a--) {
        mtailx1[a+1]=mtailx1[a];
        mtaily1[a+1]=mtaily1[a];
      }
      if (mtailx1.length>0) {
        mtailx1[0]=mheadx1;
        mtaily1[0]=mheady1;
      }
      if (mdirrection=='n'&&mheady>0) {
        mheady--;
      } else if (mdirrection=='n'&&mheady==0) {
        msnakedead=true;
      } else if (mdirrection=='s'&&mheady<39) {
        mheady++;
      } else if (mdirrection=='s'&&mheady==39) {
        msnakedead=true;
      } else if (mdirrection=='e'&&mheadx<39) {
        mheadx++;
      } else if (mdirrection=='e'&&mheadx==39) {
        msnakedead=true;
      } else if (mdirrection=='w'&&mheadx>0) {
        mheadx--;
      } else if (mdirrection=='w'&&mheadx==0) {
        msnakedead=true;
      }
      if (mdirrection1=='n'&&mheady1>0) {
        mheady1--;
      } else if (mdirrection1=='n'&&mheady1==0) {
        msnakedead=true;
      } else if (mdirrection1=='s'&&mheady1<39) {
        mheady1++;
      } else if (mdirrection1=='s'&&mheady1==39) {
        msnakedead=true;
      } else if (mdirrection1=='e'&&mheadx1<39) {
        mheadx1++;
      } else if (mdirrection1=='e'&&mheadx1==39) {
        msnakedead=true;
      } else if (mdirrection1=='w'&&mheadx1>0) {
        mheadx1--;
      } else if (mdirrection1=='w'&&mheadx1==0) {
        msnakedead=true;
      }
      for (int a=0; a<mtailx.length; a++) {
        if (mheadx==mtailx[a]&&mheady==mtaily[a]) {
          msnakedead=true;
        }
      }      
      for (int a=0; a<mtailx1.length; a++) {
        if (mheadx==mtailx1[a]&&mheady==mtaily1[a]) {
          msnakedead=true;
        }
      }
      for (int a=0; a<mtailx1.length; a++) {
        if (mheadx1==mtailx1[a]&&mheady1==mtaily1[a]) {
          msnakedead=true;
        }
      }
      for (int a=0; a<mtailx.length; a++) {
        if (mheadx1==mtailx[a]&&mheady1==mtaily[a]) {
          msnakedead=true;
        }
      }
    }
    if ((mheadx==mapplex&&mheady==mappley)||(mheadx1==mapplex&&mheady1==mappley)) {
      mapplex=floor(random(0, 40));
      mappley=floor(random(0, 40));
      msnakescore++;
      mtailSize++;
      mtailSize1++;
      if (msnakescore>msnakehscore) {
        msnakehscore=msnakescore;
      }
      int[] temp1={40};
      mtailx=concat(mtailx, temp1);
      mtailx1=concat(mtailx1, temp1);
      temp1[0]=0;
      mtaily=concat(mtaily, temp1);
      mtaily1=concat(mtaily1, temp1);
    }
  }
  for (int a=0; a<=39; a++) {
    for (int b=0; b<=39; b++) {
      if (mgrid[a][b]) {
        fill(msnakeColor);
      } else if (mgrid1[a][b]) {
        fill(msnakeColor1);
      } else if (a==mapplex&&b==mappley) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      square(msquareSize*a, msquareSize*b, msquareSize);
      for (int c=0; c<mtailx.length; c++) {
        if (a==mtailx[c]&&b==mtaily[c]) {
          fill(msnakeColor);
          square(msquareSize*a, msquareSize*b, msquareSize);
        }
      }
      for (int c=0; c<mtailx1.length; c++) {
        if (a==mtailx1[c]&&b==mtaily1[c]) {
          fill(msnakeColor1);
          square(msquareSize*a, msquareSize*b, msquareSize);
        }
      }
    }
  }
  fill(0);
  textSize(50);
  text("Score: "+msnakescore, 250, 850);
  text("High Score: "+msnakehscore, 750, 850);
  if (msnakedead) {
    text("You Died", 1100, 450);
  }
}
void mkeyPressed() {
  if (key=='g') {
    gameSelectionScreen();
    mirrorMode=false;
  }
  if (key==' ') {
    mpaused=!mpaused;
  }
  if (keyCode==UP) {
    mdirrection='n';
    mdirrection1='s';
  }
  if (keyCode==DOWN) {
    mdirrection='s';
    mdirrection1='n';
  }
  if (keyCode==RIGHT) {
    mdirrection='e';
    mdirrection1='w';
  }
  if (keyCode==LEFT) {
    mdirrection='w';
    mdirrection1='e';
  }
  if (key=='r') {
    mdirrection='n';
    mdirrection1='s';
    msnakedead=false;
    mtailSize=5;
    mtailSize1=5;
    mgrid=new boolean[40][40];
    mgrid1=new boolean[40][40];
    mheadx=29;
    mheady=20;
    mheadx1=10;
    mheady1=20;
    mtime=0;
    mapplex=floor(random(0, 40));
    mappley=floor(random(0, 40));
    msnakescore=0;
    //mtailx=new int[mtailSize];
    //for (int a=0; a<=mtailSize-1; a++) {
    //  mtailx[a]=29;
    //  mtaily[a]=20+a;
    //}
    //mtailx1=new int[mtailSize1];
    //for (int a=0; a<=mtailSize1-1; a++) {
    //  mtailx1[a]=10;
    //  mtaily1[a]=20-a;
    //}
  }
  //if (key=='g') {
  //  gameSelectionScreen();
  //}
}
