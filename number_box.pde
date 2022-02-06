class numberBox extends textBox {
  private int value;
  numberBox(float x, float y, float w, float h) {
    super(x, y, w, h);
  }
  void shownumber() {
    push();
    textAlign(CENTER, CENTER);
    textSize(h);
    noStroke();
    if (boxVisible) {
      fill(boxColor);
      if (myCB.mouseOverBox()) rect(x-5, y-5, w+10, h+10);
      else rect(x, y, w, h);
    }
    if (changing)fill(changingColor);
    else fill(textColor);
    text(value, x+w/2, y+h/2);
    pop();
  }
  void keyPressedNumber() {
    if (changing&&(key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='0')) {
      value*=10;
      value+=int(key)-48;
    }
    if (changing&&key==BACKSPACE) {
      value=floor(value/10);
    }
  }
}
