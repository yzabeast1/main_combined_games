int[] x=new int[5];
int[] xh=new int[5];
int distanceBetweenPairs=300;
int y=600/2-25;
int gravity=-1;
PImage bird;
PImage pipeTop;
PImage pipeBottom;
PImage background;
PImage bottom;
boolean FBdead=false;
int FBscore=0;
int hscore=0;

void FBdraw() {
  background(0, 255, 0);
  image(background, 0, 0, 600, 800);
  image(background, 600, -2, 600, 800);
  image(background, 1200, -4, 600, 800);
  image(bird, 100, y, 50, 35);
  for (int a=0; a<5; a++) {
    if (x[a]<width) {
      image(pipeTop, x[a]-25, -20, 100, xh[a]+40);
      image(pipeBottom, x[a]-25, xh[a]+100, 100, height-xh[a]-80);
    }
  }
  if (!FBdead) {
    for (int a=0; a<5; a++) {
      x[a]-=4;
      if (x[a]<-60) {
        x[a]+=distanceBetweenPairs*5;
        xh[a]=ceil(random(50, 500));
      }
      if (x[a]==65||x[a]==64) {
        FBscore++;
      }
    }
    fill(255);
    y-=gravity;
    if (gravity<-2) {
      gravity++;
    }
    if (gravity>-2) {
      gravity--;
    }
    if (y<0) {
      FBdead=true;
    }
    if (y>600-35) {
      FBdead=true;
    }
    for (int a=0; a<5; a++) {
      if (y<xh[a]&&x[a]<150&&x[a]>50) {
        FBdead=true;
      }
      if (y>xh[a]+100&&x[a]<150&&x[a]>50) {
        FBdead=true;
      }
    }
  }
  image(bottom, 0, 600, width, 300);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Score: "+FBscore, 120, 750);
  text("High Score: "+hscore, 420, 750);
  if (FBdead) {
    if (FBscore>hscore) {
      hscore=FBscore;
    }
  }
}
void FBkeyPressed() {
  if (!FBdead) {
    if (key=='w'||keyCode==UP) {
      gravity=4;
    }
    if (key=='s'||keyCode==DOWN) {
      gravity=-8;
    }
    if (key=='g') {
      gameSelectionScreen();
      flappyBird=false;
    }
  }
  if (key=='r') {
    FBdead=false;
    y=600/2-25;
    for (int a=0; a<5; a++) {
      x[a]=600+a*distanceBetweenPairs;
      xh[a]=ceil(random(50, 400));
    }
    FBscore=0;
  }
}
