char dirrection='n';
char dirrection1='n';
boolean snakedead=false;
int tailSize=5;
int tailSize1=5;
boolean[][] grid=new boolean[40][40];
boolean[][] grid1=new boolean[40][40];
int squareSize=20;
int headx=20;
int heady=20;
int headx1=10;
int heady1=20;
int time=0;
int applex=floor(random(0, 40));
int appley=floor(random(0, 40));
int speed=5;//higher is slower
int[] tailx=new int[tailSize];
int[] taily=new int[tailSize];
int[] tailx1=new int[tailSize];
int[] taily1=new int[tailSize];
int[] temp={0};
boolean twoplayer=false;
boolean snakepaused=false;
int snakescore=0;//normal
int snakehscore=0;//normal
int mmsnakehscore=0;//mirror movements
int mmsnakescore=0;//mirror movements
int msnakehscore=0;//mirror mode
int msnakescore=0;//mirror mode
int nwsnakescore=0;//no walls
int nwsnakehscore=0;//no walls
int nwmmsnakescore=0;
int nwmmsnakehscore=0;
color snakeColor=#000000;
color snakeColor1=#0000FF;
color appleColor=#FF0000;
void snakeSetup() {
  for (int a=0; a<=tailSize-1; a++) {
    tailx[a]=20;
    taily[a]=20+a;
  }
  for (int a=0; a<=tailSize1-1; a++) {
    tailx1[a]=10;
    taily1[a]=20+a;
  }
}
void snakeDraw() {
  background(128);
  grid=new boolean[40][40];
  grid1=new boolean[40][40];
  grid[headx][heady]=true;      
  if (twoplayer) {
    grid1[headx1][heady1]=true;
  }
  if (!snakedead) {
    time++;

    if (time%speed==0&&!snakepaused) {
      for (int a=tailx.length-2; a>=0; a--) {
        tailx[a+1]=tailx[a];
        taily[a+1]=taily[a];
      }
      if (tailx.length>0) {
        tailx[0]=headx;
        taily[0]=heady;
      }      
      if (twoplayer) {
        for (int a=tailx1.length-2; a>=0; a--) {
          tailx1[a+1]=tailx1[a];
          taily1[a+1]=taily1[a];
        }
        if (tailx1.length>0) {
          tailx1[0]=headx1;
          taily1[0]=heady1;
        }
      }
      if (!snakeNoWalls&&!snakeNoWallsMirrorMovements) {
        if (dirrection=='n'&&heady>0) {
          heady--;
        } else if (dirrection=='n'&&heady==0) {
          snakedead=true;
        } else if (dirrection=='s'&&heady<39) {
          heady++;
        } else if (dirrection=='s'&&heady==39) {
          snakedead=true;
        } else if (dirrection=='e'&&headx<39) {
          headx++;
        } else if (dirrection=='e'&&headx==39) {
          snakedead=true;
        } else if (dirrection=='w'&&headx>0) {
          headx--;
        } else if (dirrection=='w'&&headx==0) {
          snakedead=true;
        }
      } else if (snakeNoWalls||snakeNoWallsMirrorMovements) {
        if (dirrection=='n'&&heady>0) {
          heady--;
        } else if (dirrection=='n'&&heady==0) {
          heady=39;
        } else if (dirrection=='s'&&heady<39) {
          heady++;
        } else if (dirrection=='s'&&heady==39) {
          heady=0;
        } else if (dirrection=='e'&&headx<39) {
          headx++;
        } else if (dirrection=='e'&&headx==39) {
          headx=0;
        } else if (dirrection=='w'&&headx>0) {
          headx--;
        } else if (dirrection=='w'&&headx==0) {
          headx=39;
        }
      }
      if (twoplayer) {
        if (!snakeNoWalls&&!snakeNoWallsMirrorMovements) {
          if (dirrection1=='n'&&heady1>0) {
            heady1--;
          } else if (dirrection1=='n'&&heady1==0) {
            snakedead=true;
          } else if (dirrection1=='s'&&heady1<39) {
            heady1++;
          } else if (dirrection1=='s'&&heady1==39) {
            snakedead=true;
          } else if (dirrection1=='e'&&headx1<39) {
            headx1++;
          } else if (dirrection1=='e'&&headx1==39) {
            snakedead=true;
          } else if (dirrection1=='w'&&headx1>0) {
            headx1--;
          } else if (dirrection1=='w'&&headx1==0) {
            snakedead=true;
          }
        } else if (snakeNoWalls||snakeNoWallsMirrorMovements) {
          if (dirrection1=='n'&&heady1>0) {
            heady1--;
          } else if (dirrection1=='n'&&heady1==0) {
            heady1=39;
          } else if (dirrection1=='s'&&heady1<39) {
            heady1++;
          } else if (dirrection1=='s'&&heady1==39) {
            heady1=0;
          } else if (dirrection1=='e'&&headx1<39) {
            headx1++;
          } else if (dirrection1=='e'&&headx1==39) {
            headx1=0;
          } else if (dirrection1=='w'&&headx1>0) {
            headx1--;
          } else if (dirrection1=='w'&&headx1==0) {
            headx1=39;
          }
        }
      }
      for (int a=0; a<tailx.length; a++) {
        if (headx==tailx[a]&&heady==taily[a]) {
          snakedead=true;
        }
      }      
      if (twoplayer) {
        for (int a=0; a<tailx1.length; a++) {
          if (headx==tailx1[a]&&heady==taily1[a]) {
            snakedead=true;
          }
        }
        for (int a=0; a<tailx1.length; a++) {
          if (headx1==tailx1[a]&&heady1==taily1[a]) {
            snakedead=true;
          }
        }
        for (int a=0; a<tailx.length; a++) {
          if (headx1==tailx[a]&&heady1==taily[a]) {
            snakedead=true;
          }
        }
      }
    }
    if (headx==applex&&heady==appley) {
      applex=floor(random(0, 40));
      appley=floor(random(0, 40));
      if (snakemultiplayer) {
        snakescore++;
      } else if (mirrorMovements) {
        mmsnakescore++;
      } else if (mirrorMode) {
        msnakescore++;
      } else if (snakeNoWalls) {
        nwsnakescore++;
      } else if (snakeNoWallsMirrorMovements) {
        nwmmsnakescore++;
      }
      tailSize++;
      if (snakescore>snakehscore) {
        snakehscore=snakescore;
      }
      if (mmsnakescore>mmsnakehscore) {
        mmsnakehscore=mmsnakescore;
      }
      if (msnakescore>msnakehscore) {
        msnakehscore=msnakescore;
      }
      if (nwsnakescore>nwsnakehscore) {
        nwsnakehscore=nwsnakescore;
      }
      if (nwmmsnakescore>nwmmsnakehscore) {
        nwmmsnakehscore=nwmmsnakescore;
      }
      int[] temp1={40};
      tailx=concat(tailx, temp1);
      temp1[0]=0;
      taily=concat(taily, temp1);
    }      
    if (twoplayer) {
      if (headx1==applex&&heady1==appley) {
        applex=floor(random(0, 40));
        appley=floor(random(0, 40));
        if (snakemultiplayer) {
          snakescore++;
        } else if (mirrorMovements) {
          mmsnakescore++;
        } else if (mirrorMode) {
          msnakescore++;
        } else if (snakeNoWalls) {
          nwsnakescore++;
        } else if (snakeNoWallsMirrorMovements) {
          nwmmsnakescore++;
        }
        tailSize1++;
        if (snakescore>snakehscore) {
          snakehscore=snakescore;
        }
        if (mmsnakescore>mmsnakehscore) {
          mmsnakehscore=mmsnakescore;
        }
        if (msnakescore>msnakehscore) {
          msnakehscore=msnakescore;
        }
        if (nwsnakescore>nwsnakehscore) {
          nwsnakehscore=nwsnakescore;
        }
        if (nwmmsnakescore>nwmmsnakehscore) {
          nwmmsnakehscore=nwmmsnakescore;
        }
        int[] temp1={40};
        tailx1=concat(tailx1, temp1);
        temp1[0]=0;
        taily1=concat(taily1, temp1);
      }
    }
  }
  for (int a=0; a<=39; a++) {
    for (int b=0; b<=39; b++) {
      if (grid[a][b]) {
        fill(snakeColor);
      } else if (grid1[a][b]) {
        fill(snakeColor1);
      } else if (a==applex&&b==appley) {
        fill(appleColor);
      } else {
        fill(255);
      }
      square(squareSize*a, squareSize*b, squareSize);
      for (int c=0; c<tailx.length; c++) {
        if (a==tailx[c]&&b==taily[c]) {
          fill(snakeColor);
          square(squareSize*a, squareSize*b, squareSize);
        }
      }
      if (twoplayer) {
        for (int c=0; c<tailx1.length; c++) {
          if (a==tailx1[c]&&b==taily1[c]) {
            fill(snakeColor1);
            square(squareSize*a, squareSize*b, squareSize);
          }
        }
      }
    }
  }
  fill(0);
  textSize(50);
  if (snakemultiplayer) {
    text("Score: "+snakescore, 250, 850);
    text("High Score: "+snakehscore, 750, 850);
  } else if (mirrorMovements) {
    text("Score: "+mmsnakescore, 250, 850);
    text("High Score: "+mmsnakehscore, 750, 850);
  } else if (mirrorMode) {
    text("Score: "+msnakescore, 250, 850);
    text("High Score: "+msnakehscore, 750, 850);
  } else if (snakeNoWalls) {
    text("Score: "+nwsnakescore, 250, 850);
    text("High Score: "+nwsnakehscore, 750, 850);
  } else if (snakeNoWallsMirrorMovements) {
    text("Score: "+nwmmsnakescore, 250, 850);
    text("High Score: "+nwmmsnakehscore, 750, 850);
  }
  textAlign(CENTER, CENTER);
  text("Two Snakes", 1200, 175);
  if (snakedead) {
    text("You Died", 1100, 450);
  }
  if (!mirrorMode) {
    fill(255);
    rect(1100, 200, 200, 200);
    if (twoplayer) {
      strokeWeight(10);
      line(1130, 330, 1180, 380);
      line(1180, 380, 1270, 250);
      strokeWeight(1);
    }
  }
}
void snakeKeyPressed() {      
  if (twoplayer&&(snakemultiplayer||snakeNoWalls)) {
    if (key=='w') {
      dirrection1='n';
    }
    if (key=='s') {
      dirrection1='s';
    }
    if (key=='d') {
      dirrection1='e';
    }
    if (key=='a') {
      dirrection1='w';
    }
  } else if (twoplayer&&(mirrorMovements||snakeNoWallsMirrorMovements)) {
    if (key=='w') {
      dirrection1='s';
    }
    if (key=='s') {
      dirrection1='n';
    }
    if (key=='d') {
      dirrection1='w';
    }
    if (key=='a') {
      dirrection1='e';
    }
  }
  if (key==' ') {
    snakepaused=!snakepaused;
  }
  if (snakemultiplayer||snakeNoWalls) {
    if (keyCode==UP) {
      dirrection='n';
    }
    if (keyCode==DOWN) {
      dirrection='s';
    }
    if (keyCode==RIGHT) {
      dirrection='e';
    }
    if (keyCode==LEFT) {
      dirrection='w';
    }
  } else if (mirrorMode) {
    if (keyCode==UP) {
      dirrection='n';
      dirrection1='s';
    }
    if (keyCode==DOWN) {
      dirrection='s';
      dirrection1='n';
    }
    if (keyCode==RIGHT) {
      dirrection='e';
      dirrection1='w';
    }
    if (keyCode==LEFT) {
      dirrection='w';
      dirrection1='e';
    }
  } else if (mirrorMovements||snakeNoWallsMirrorMovements) {
    if (keyCode==UP) {
      dirrection='s';
    }
    if (keyCode==DOWN) {
      dirrection='n';
    }
    if (keyCode==RIGHT) {
      dirrection='w';
    }
    if (keyCode==LEFT) {
      dirrection='e';
    }
  }
  if (key=='r') {
    dirrection='n';
    dirrection1='n';
    snakedead=false;
    tailSize=5;
    tailSize1=5;
    grid=new boolean[40][40];
    grid1=new boolean[40][40];
    headx=20;
    heady=20;
    headx1=10;
    heady1=20;
    time=0;
    applex=floor(random(0, 40));
    appley=floor(random(0, 40));
    if (snakemultiplayer) {
      snakescore=0;
    } else if (mirrorMovements) {
      mmsnakescore=0;
    } else if (mirrorMode) {
      msnakescore=0;
    } else if (snakeNoWalls) {
      nwsnakescore=0;
    } else if (snakeNoWallsMirrorMovements) {
      nwmmsnakescore=0;
    }
    tailx=new int[tailSize];
    for (int a=0; a<=tailSize-1; a++) {
      tailx[a]=20;
      taily[a]=20+a;
    }
    tailx1=new int[tailSize1];
    for (int a=0; a<=tailSize1-1; a++) {
      tailx1[a]=10;
      taily1[a]=20+a;
    }
  }

  if (key=='g') {
    gameSelectionScreen();
    snakemultiplayer=false;
    mirrorMovements=false;
    mirrorMode=false;
    snakeNoWalls=false;
    snakeNoWallsMirrorMovements=false;
  }
}
void snakeMousePressed() {
  if (!mirrorMode) {
    if (mouseX>1100&&mouseX<1300&&mouseY>200&&mouseY<400&&snakedead) {
      twoplayer=!twoplayer;
    }
  }
}
