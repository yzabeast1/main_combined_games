int[] dice=new int[5];
PImage[] diceImages=new PImage[6];
PImage yahtzeeBoard;
numberBox[][] yscores=new numberBox[2][18];
boolean[] diceLocked=new boolean[5];
PImage locked;
PImage unlocked;
int[] dicex=new int[5];
int[] dicey=new int[5];
int[] spintime=new int[5];
int[] rotation=new int[5];
int startingRollTime=-999999999;
int defaultRotation=20;
int defaultSpinTime=1000;
void yahtzeeStartup() {
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a]=new numberBox(-1, -1, 0, 0);
    }
  }
  for (int a=0; a<9; a++) {
    yscores[0][a]=new numberBox(277, 240+(a*30), 56, 30);
    yscores[1][a]=new numberBox(1080, 240+(a*30), 56, 30);
  }
  for (int a=9; a<16; a++) {
    yscores[0][a]=new numberBox(277, 535+((a-9)*30), 56, 30);
    yscores[1][a]=new numberBox(1080, 535+((a-9)*30), 56, 30);
  }
  for (int a=16; a<18; a++) {
    yscores[0][a]=new numberBox(277, 805+((a-16)*30), 56, 30);
    yscores[1][a]=new numberBox(1080, 805+((a-16)*30), 56, 30);
  }
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a].boxVisible=false;
    }
  }
}
void yahtzeeSetup() {
  name1box.changing=false;
  name2box.changing=false;
  name1box.boxVisible=false;
  name2box.boxVisible=false;
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a].boxVisible=false;
    }
  }
  name1box.changeLocation(400, 150, 200, 30);
  name2box.changeLocation(1200, 150, 200, 30);
  for (int a=0; a<=4; a++) {
    dicex[a]=width/2-32;
    dicey[a]=a*110+height/2-225;
  }
  locked=loadImage("locked.png");
  unlocked=loadImage("unlocked.png");
  yahtzeeBoard=loadImage("board.png");
  int b=1;
  background(255, 165, 0);
  for (int a=0; a<=5; a++) {
    diceImages[a]=loadImage("dice-"+b+".png");
    b++;
  }
}
void yahtzeeDraw() {
  yscores[0][6].value=yscores[0][0].value+yscores[0][1].value+yscores[0][2].value+yscores[0][3].value+yscores[0][4].value+yscores[0][5].value;
  yscores[0][16].value=yscores[0][9].value+yscores[0][10].value+yscores[0][11].value+yscores[0][12].value+yscores[0][13].value+yscores[0][14].value+yscores[0][15].value;
  yscores[1][6].value=yscores[1][0].value+yscores[1][1].value+yscores[1][2].value+yscores[1][3].value+yscores[1][4].value+yscores[1][5].value;
  yscores[1][16].value=yscores[1][9].value+yscores[1][10].value+yscores[1][11].value+yscores[1][12].value+yscores[1][13].value+yscores[1][14].value+yscores[1][15].value;
  if (yscores[0][6].value>=63) {
    yscores[0][7].value=35;
  } else {
    yscores[0][7].value=0;
  }
  if (yscores[1][6].value>=63) {
    yscores[1][7].value=35;
  } else {
    yscores[1][7].value=0;
  }
  yscores[0][8].value=yscores[0][6].value+yscores[0][7].value;
  yscores[1][8].value=yscores[1][6].value+yscores[1][7].value;
  yscores[0][17].value=yscores[0][16].value+yscores[0][8].value;
  yscores[1][17].value=yscores[1][16].value+yscores[1][8].value;
  background(255, 165, 0);
  textSize(50);
  textAlign(CENTER, CENTER);
  image(yahtzeeBoard, 10, 110);
  image(yahtzeeBoard, 812, 110);
  textSize(20);
  fill(0, 255, 0);
  rect(width/2-50, 750, 100, 100);
  fill(0);
  textSize(30);
  text("Full"+ENTER+"Roll", 720, 800);
  for (int a=0; a<=4; a++) {
    if (diceLocked[a]==true) {
      image(unlocked, width/2+15, a*110+height/2-275, 75, 75);
    } else {
      image(locked, width/2+15, a*110+height/2-275, 75, 75);
    }
  }
  for (int a=0; a<=4; a++) {
    pushMatrix();
    imageMode(CENTER);
    if (millis()-startingRollTime<defaultSpinTime) {
      translate(float(dicex[a]), float(dicey[a]));
      if (a%2==0&&!diceLocked[a]) {
        rotate(rotation[a]);
      } else if (a%2==1&&!diceLocked[a]) {
        rotate(-rotation[a]);
      }
      translate(float(-dicex[a]), float(-dicey[a]));
      rotation[a]+=defaultRotation;
      spintime[a]--;
    }
    if (spintime[a]==0) {
      rotation[a]=0;
    }
    for (int b=0; b<=5; b++) {
      if (dice[a]==b) {
        image(diceImages[b], dicex[a], dicey[a], 100, 100);
      }
    }
    if (a%2==0&&!diceLocked[a]) {
      rotate(-rotation[a]);
    } else if (a%2==1&&!diceLocked[a]) {
      rotate(rotation[a]);
    }    
    imageMode(CORNER);
    popMatrix();
  }
  name1box.show();
  name2box.show();
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a].shownumber();
    }
  }
  text(yscores[0][17].value, 305, 880);
  text(yscores[1][17].value, 1108, 880);
}

void yahtzeeMousePressed() {
  name1box.mousePressed();
  name2box.mousePressed();
  for (int a=0; a<=5; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a].mousePressed();
    }
  }
  for (int a=9; a<=15; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a].mousePressed();
    }
  }
  noValueChange();
  if (mouseX>670&&mouseX<770&&mouseY>750&&mouseY<850) {
    diceLocked=new boolean[5];
    for (int a=0; a<=4; a++) {
      dice[a]=floor(random(0, 6));
      spintime[a]=defaultSpinTime;
    }
    startingRollTime=millis();
  }
  for (int a=0; a<=4; a++) {
    if (dist(mouseX, mouseY, width/2+52.5, a*110+height/2-237.5)<=37.5) {
      if (diceLocked[a]==true) {
        diceLocked[a]=false;
      } else {
        diceLocked[a]=true;
      }
    }
  }
}

void yahtzeeKeyPressed() {
  if ( key==' ') {
    for (int a=0; a<=4; a++) {
      if (diceLocked[a]==false) {
        dice[a]=floor(random(0, 6));
        spintime[a]=defaultSpinTime;
      }
      startingRollTime=millis();
    }
  }
  if (key=='r') {
    yscores=new numberBox[2][18];
    yahtzeeStartup();
    diceLocked=new boolean[5];
    dice=new int[5];
  }
  name1box.keyPressed();
  name2box.keyPressed();
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      yscores[b][a].keyPressedNumber();
    }
  }
  if ( key=='g') {
    gameSelectionScreen();
  }
}
void noValueChange() {
  name1box.changing=false;
  name2box.changing=false;
}
