void dragable () {
  if (mousePressed&&keyPressed&&keyCode==SHIFT) {
    for (int a=0; a<=11; a++) {
      if (dist(mouseX, mouseY, redx[a], redy[a]) < 40) {
        redx[a]=1000;
        redy[a]=1000;
        draging=false;
      }
      if (dist(mouseX, mouseY, blackx[a], blacky[a]) < 40) {
        blackx[a]=1000;
        blacky[a]=1000;
        draging=false;
      }
    }
  }
  if ((mousePressed&&!keyPressed)||(mousePressed&&keyPressed&&key!=SHIFT)) {
    if (!draging) {
      if (colorDragging=='r') {
        if (dist(mouseX, mouseY, redx[numberDragging], redy[numberDragging]) < 40) {
          if (mousePressed) {
            fill(64, 256, 64);
            redx[numberDragging] = mouseX;
            redy[numberDragging] = mouseY;
            draging=true;
          } else {
            fill(128, 256, 128);
          }
        }
      }
      if (colorDragging=='b') {
        if (dist(mouseX, mouseY, blackx[numberDragging], blacky[numberDragging]) < 40) {
          if (mousePressed) {
            fill(64, 256, 64);
            blackx[numberDragging] = mouseX;
            blacky[numberDragging] = mouseY;
            draging=true;
          } else {
            fill(128, 256, 128);
          }
        }
      }
      for (int a=0; a<=11; a++) {
        if (dist(mouseX, mouseY, redx[a], redy[a]) < 40&&!draging) {

          if (mousePressed) {
            fill(64, 256, 64);
            redx[a] = mouseX;
            redy[a] = mouseY;
            draging=true;
            colorDragging='r';
            numberDragging=a;
          } else {
            fill(128, 256, 128);
          }
        }
      }
      for (int a=0; a<=11; a++) {
        if (dist(mouseX, mouseY, blackx[a], blacky[a]) < 40&&!draging) {
          if (mousePressed) {
            fill(64, 256, 64);
            blackx[a] = mouseX;
            blacky[a] = mouseY;
            draging=true;
            colorDragging='b';
            numberDragging=a;
          } else {
            fill(128, 256, 128);
          }
        }
      }
    }
  }
  if (draging) {
    if (colorDragging=='r'&&(redkings[numberDragging]||(!redkings[numberDragging]&&mouseY>redy[numberDragging]))&&validMoveTest()) {
      redy[numberDragging]=mouseY;
    }
    if (colorDragging=='r'&&validMoveTest()) {      
      redx[numberDragging]=mouseX;
    }
    if (colorDragging=='b'&&validMoveTest()) {
      blackx[numberDragging]=mouseX;
    }
    if (colorDragging=='b'&&(blackkings[numberDragging]||(!blackkings[numberDragging]&&mouseY<blacky[numberDragging]))&&validMoveTest()) {
      blacky[numberDragging]=mouseY;
    }
  }
  autotaking();
}
boolean validMoveTest() {
  int possiblex;
  int possibley;
  int temp=int(mouseX);
  temp-=50;
  possiblex=temp+100/2;
  possiblex-=mouseX%100;
  possiblex+=50;
  temp=int(mouseY);
  temp-=50;
  possibley=temp+100/2;
  possibley-=mouseY%100;
  possibley+=50;
  boolean valid=false;
  for (int b=0; b<=validx.length-1; b++) {
    if (possiblex==validx[b]&&possibley==validy[b]) {
      valid=true;
    }
  }
  return valid;
}
