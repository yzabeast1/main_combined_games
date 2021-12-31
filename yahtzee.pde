int[] dice=new int[5];
PImage[] diceImages=new PImage[6];
PImage yahtzeeBoard;
String name1="player 1";
String name2="player 2";
int[][] score=new int[2][18];
boolean[][] valueChange=new boolean[2][18];
boolean[] nameChange={false, false};
int lastAdded=0;
boolean[] diceLocked=new boolean[5];
PImage locked;
PImage unlocked;
void yahtzeeSetup() {
  locked=loadImage("locked.png");
  unlocked=loadImage("unlocked.png");
  yahtzeeBoard=loadImage("board.png");
  int b=1;
  fullScreen();
  background(255, 165, 0);
  for (int a=0; a<=5; a++) {
    diceImages[a]=loadImage("dice-"+b+".png");
    b++;
  }
}
void yahtzeeDraw() {
  score[0][6]=score[0][0]+score[0][1]+score[0][2]+score[0][3]+score[0][4]+score[0][5];
  score[0][16]=score[0][9]+score[0][10]+score[0][11]+score[0][12]+score[0][13]+score[0][14]+score[0][15];
  score[1][6]=score[1][0]+score[1][1]+score[1][2]+score[1][3]+score[1][4]+score[1][5];
  score[1][16]=score[1][9]+score[1][10]+score[1][11]+score[1][12]+score[1][13]+score[1][14]+score[1][15];
  if (score[0][6]>=63) {
    score[0][7]=35;
  } else {
    score[0][7]=0;
  }
  if (score[1][6]>=63) {
    score[1][7]=35;
  } else {
    score[1][7]=0;
  }
  score[0][8]=score[0][6]+score[0][7];
  score[1][8]=score[1][6]+score[1][7];
  score[0][17]=score[0][16]+score[0][8];
  score[1][17]=score[1][16]+score[1][8];
  background(255, 165, 0);
  textSize(50);
  textAlign(CENTER, CENTER);
  for (int a=0; a<=4; a++) {
    for (int b=0; b<=5; b++) {
      if (dice[a]==b) {
        image(diceImages[b], width/2-90, a*110+height/2-275, 100, 100);
      }
    }
    if (diceLocked[a]==true) {
      image(unlocked, width/2+15, a*110+height/2-275, 75, 75);
    } else {
      image(locked, width/2+15, a*110+height/2-275, 75, 75);
    }
  }
  image(yahtzeeBoard, 10, 110);
  image(yahtzeeBoard, 812, 110);
  textSize(20);
  for (int a=0; a<=8; a++) {
    if (valueChange[0][a]) {
      fill(255, 0, 0);
    }
    text(score[0][a], 300, 30*a+255);
    fill(0);
  }
  for (int a=9; a<=15; a++) {
    if (valueChange[0][a]) {
      fill(255, 0, 0);
    }
    text(score[0][a], 300, 280+30*a);
    fill(0);
  }
  text(score[0][16], 300, 815);
  text(score[0][8], 300, 845);
  text(score[0][17], 300, 875);
  for (int a=0; a<=8; a++) {
    if (valueChange[1][a]) {
      fill(255, 0, 0);
    }
    text(score[1][a], 1100, 30*a+255);
    fill(0);
  }
  for (int a=9; a<=15; a++) {
    if (valueChange[1][a]) {
      fill(255, 0, 0);
    }
    text(score[1][a], 1100, 280+30*a);
    fill(0);
  }
  text(score[1][16], 1100, 815);
  text(score[1][8], 1100, 845);
  text(score[1][17], 1100, 875);
  fill(0);
  if (nameChange[0]) {
    fill(255, 0, 0);
  }
  text(name1, 500, 160);
  fill(0);
  if (nameChange[1]) {
    fill(255, 0, 0);
  }
  text(name2, 1300, 160);
  fill(0, 255, 0);
  rect(width/2-50, 750, 100, 100);
  fill(0);
  textSize(30);
  text("Full"+ENTER+"Roll", 720, 800);
}

void yahtzeeMousePressed() {
  noValueChange();
  if (mouseX>670&&mouseX<770&&mouseY>750&&mouseY<850) {
    diceLocked=new boolean[5];
    for (int a=0; a<=4; a++) {
      dice[a]=floor(random(0, 6));
    }
  }
  if (mouseX>400&&mouseX<600&&mouseY>150&&mouseY<180) {
    nameChange[0]=true;
    nameChange[1]=false;
  }
  if (mouseX>1200&&mouseX<1400&&mouseY>150&&mouseY<180) {    
    nameChange[0]=false;
    nameChange[1]=true;
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
  for (int a=0; a<=5; a++) {
    if (mouseY>=240+(a*30)&&mouseY<=270+(a*30)&&mouseX>=277&&mouseX<=333) {
      noValueChange();
      valueChange[0][a]=true;
    }
  }
  for (int a=9; a<=15; a++) {
    if (mouseY>=540+((a-9)*30)&&mouseY<=570+((a-9)*30)&&mouseX>=277&&mouseX<=333) {
      noValueChange();
      valueChange[0][a]=true;
    }
  }
  for (int a=0; a<=5; a++) {
    if (mouseY>=240+(a*30)&&mouseY<=270+(a*30)&&mouseX>=1080&&mouseX<=1133) {
      noValueChange();
      valueChange[1][a]=true;
    }
  }
  for (int a=9; a<=15; a++) {
    if (mouseY>=540+((a-9)*30)&&mouseY<=570+((a-9)*30)&&mouseX>=1080&&mouseX<=1133) {
      noValueChange();
      valueChange[1][a]=true;
    }
  }
}

void yahtzeeKeyPressed() {
  if ( key==' '/*&&!nameChange[0]&&!nameChange[1]*/) {
    for (int a=0; a<=4; a++) {
      if (diceLocked[a]==false) {
        dice[a]=floor(random(0, 6));
      }
    }
  }
  if (key=='r') {
    score=new int[2][18];
    valueChange=new boolean[2][18];
    diceLocked=new boolean[5];
    dice=new int[5];
  }
  if (key == BACKSPACE&&nameChange[0]&&!nameChange[1]) {
    if (name1.length() > 0) {
      name1 = name1.substring(0, name1.length()-1);
    }
  } else if (key == CODED&&nameChange[0]&&!nameChange[1]) {
    return;
  } else if (nameChange[0]&&!nameChange[1]) {
    name1 += key;
  }
  if (key == BACKSPACE&&!nameChange[0]&&nameChange[1]) {
    if (name2.length() > 0) {
      name2 = name2.substring(0, name2.length()-1);
    }
  } else if (key == CODED&&!nameChange[0]&&nameChange[1]) {
    return;
  } else if (!nameChange[0]&&nameChange[1]) {
    name2 += key;
  }
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      if (valueChange[b][a]&&(key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9')) {
        score[b][a] += (int(key)-48);
        lastAdded=int(key)-48;
      }
      if (valueChange[b][a]&&key==BACKSPACE) {
        score[b][a]-=lastAdded;
      }
    }
  }
  if (key=='g'&&!nameChange[0]&&!nameChange[1]) {
    gameSelectionScreen();
  }
}
void typing(String stringName, boolean changingName) {
  if (key == BACKSPACE&&changingName) {
    if (stringName.length() > 0) {
      stringName = stringName.substring(0, stringName.length()-1);
    }
  } else if (key == CODED&&changingName) {
    return;
  } else if (changingName) {
    stringName += key;
  }
}
void noValueChange() {
  for (int a=0; a<=17; a++) {
    for (int b=0; b<=1; b++) {
      valueChange[b][a]=false;
    }
  }
  nameChange[0]=false;
  nameChange[1]=false;
}
