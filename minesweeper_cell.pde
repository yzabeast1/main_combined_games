class Cell {
  float x;
  float y;
  float w;
  int indexX;
  int indexY;
  boolean revealed=false;
  boolean mine=false;
  int neighborCount=0;
  boolean flagged;
  Cell(int i, int j, float w) {
    this.x=i*w;
    this.y=j*w;
    this.w=w;
    this.indexX=i;
    this.indexY=j;
  }
  void show() {
    if (flagged) {
      image(flaggedimage, x, y, w, w);
    } else if (!revealed) {
      image(emptyimage, x, y, w, w);
      //fill(64);
      //rect(x, y, w, w);
    } else if (revealed&&mine) {
      image(mineimage, x+1, y+1, w-2, w-2);
      //fill(127);
      //ellipse(x + w * 0.5, y + w * 0.5, w * 0.5, w * 0.5);
    } else if (revealed&&!mine) {
      //fill(127);
      //rect(x, y, w, h);
      fill(200);
      imageMode(CENTER);
      image(revealedimage, x+w*.5, y+w*.5, w, w);
      if (neighborCount > 0) {
        textAlign(CENTER);
        fill(0);
        image(numbers[neighborCount-1], x+w*0.5, y+w*0.5, w, w);
        //text(neighborCount, x + w * 0.5, y + w - 6);
      }
      imageMode(CORNER);
    }
    //textMode(CENTER);
    //text(neighbors, x+w/2, y+h/2);
  }
  void mousePressed() {
    if (mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+w&&!checkwin()) {
      revealed=true;
    }
  }
  void reveal() {
    revealed = true;
    if (neighborCount == 0) {
      // flood fill time
      floodFill();
    }
  }
  void countMines() {
    if (mine) {
      neighborCount = -1;
      return;
    }
    int total = 0;
    for (int xoff = -1; xoff <= 1; xoff++) {
      int celli = indexX + xoff;
      if (celli < 0 || celli >= cols) continue;

      for (int yoff = -1; yoff <= 1; yoff++) {
        int cellj = indexY + yoff;
        if (cellj < 0 || cellj >= rows) continue;

        Cell neighbor = mgrid[celli][cellj];
        if (neighbor.mine) {
          total++;
        }
      }
    }
    neighborCount = total;
  }
  boolean contains(int x_, int y_) {
    return (x_ > x && x_ < x + w && y_ > y && y_ < y + w);
  }
  void floodFill() {
    for (int xoff = -1; xoff <= 1; xoff++) {
      int celli = indexX + xoff;
      if (celli < 0 || celli >= cols) continue;

      for (int yoff = -1; yoff <= 1; yoff++) {
        int cellj = indexY + yoff;
        if (cellj < 0 || cellj >= rows) continue;

        Cell neighbor = mgrid[celli][cellj];
        if (!neighbor.revealed) {
          neighbor.reveal();
        }
      }
    }
  }
}
