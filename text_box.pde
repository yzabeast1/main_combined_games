class textBox {
  protected CollisionBox myCB;
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected String text="";
  color textColor=#000000;
  color boxColor=#FFFFFF;
  color changingColor=#FF0000;
  boolean click;
  boolean pressed;
  boolean changing;
  boolean boxVisible=true;
  textBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    myCB = new CollisionBox(x, y, w, h);
  }
  void changeColor(color text, color box, color changing) {
    this.textColor=text;
    this.boxColor=box;
    this.changingColor=changing;
  }
  boolean clicked() {
    if (myCB.mouseOverBox() && mousePressed) {
      pressed = true;
    }
    if (pressed == true && !mousePressed) {
      click = true;
      pressed = false;
    } else {
      click = false;
    }
    return click;
  }
  void changeLocation(float x1, float y1, float w1, float h1) {
    this.x=x1;
    this.y=y1;
    this.w=w1;
    this.h=h1;
    myCB = new CollisionBox(x, y, w, h);
  }
  void show() {
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
    text(text, x+w/2, y+h/2);
    pop();
  }
  void mousePressed() {
    changing=false;
    if (myCB.mouseOverBox())changing=true;
  }
  void keyPressed() {
    if (changing) {
      if (key == BACKSPACE) {
        if (text.length() > 0) {
          text = text.substring(0, text.length()-1);
        }
      } else if (key == CODED) {
        return;
      } else {
        text += key;
      }
    }
  }
}
