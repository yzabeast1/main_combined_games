Cell[][] mgrid;
int rows;
int cols;
PImage emptyimage;
PImage mineimage;
PImage flaggedimage;
PImage revealedimage;
PImage[] numbers=new PImage[8];
int minecount=1;
void minesweeperSetup() {
  cols = floor(width / spacing);
  rows = floor(height / spacing);
  minecount=floor((cols*rows)*(minePercent)/100);
  emptyimage=loadImage("empty.png");
  mineimage=loadImage("mine.png");
  flaggedimage=loadImage("flag.png");
  revealedimage=loadImage("revealed.png");
  for (int i=0; i<numbers.length; i++) {
    numbers[i]=loadImage((i+1)+".png");
  }
  mgrid=new Cell[cols][rows];
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      mgrid[i][j]=new Cell(i, j, spacing);
    }
  }
  ArrayList<int[]> options = new ArrayList<int[]>();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int[] option = new int[2];
      option[0] = i;
      option[1] = j;
      options.add(option);
    }
  }
  for (int n = 0; n < minecount; n++) {
    int index = floor(random(options.size()));
    int[] choice = options.get(index);
    int i = choice[0];
    int j = choice[1];
    options.remove(index);
    mgrid[i][j].mine = true;
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      mgrid[i][j].countMines();
    }
  }
}
void minesweeperDraw() {
  background(255);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      mgrid[i][j].show();
    }
  }
  if (checkwin()) {
    fill(0);
    textSize(50);
    stroke(255);
    strokeWeight(10);
    text("YOU WIN!!", width/2, height/2);
  }
}
void minesweeperMousePressed() {
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      if (mgrid[i][j].contains(mouseX, mouseY)) {
        if (!keyPressed) {
          mgrid[i][j].reveal();
          if (mgrid[i][j].mine) {
            gameOver();
          }
        } else if (keyPressed) {
          mgrid[i][j].flagged=true;
        }
      }
    }
  }
}
void gameOver() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      mgrid[i][j].revealed = true;
      mgrid[i][j].flagged=false;
    }
  }
}
void minesweeperKeyPressed() {
  if (key=='r') {
    minesweeperSetup();
  }
  if (key=='g') {
    minesweeper=false;
    gameSelection=true;
  }
}
boolean checkwin() {
  boolean win=true;
  int flagCount=0;
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      if (mgrid[j][i].flagged)flagCount++;
    }
  }
  if (flagCount==minecount) {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (!mgrid[j][i].revealed&&!mgrid[j][i].flagged) {
          win=false;
        }
      }
    }
  } else win=false;
  return win;
}
