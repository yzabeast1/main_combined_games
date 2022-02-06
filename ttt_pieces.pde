void pieces() {
  for (int x=0; x<=2; x++) {
    for (int y=0; y<=2; y++) {
      if (TTTCboard[x][y]=='O') {
        fill(255);
        circle(100+x*200, 100+y*200, 150);
        fill(0);
        circle(100+x*200, 100+y*200, 130);
      }
    }
  }
  if (TTTCboard[0][0] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(10, 70, 20, 150);
    rect(-60, 130, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[2][2] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(10, 620, 20, 150);
    rect(-60, 680, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[0][1] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(-130, 220, 20, 150);
    rect(-200, 280, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[0][2] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(-300, 390, 20, 150);
    rect(-370, 450, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[2][0] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(280, 370, 20, 150);
    rect(210, 430, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[1][1] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(10, 340, 20, 150);
    rect(-60, 400, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[1][0] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(150, 210, 20, 150);
    rect(80, 270, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[2][1] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(170, 500, 20, 150);
    rect(100, 560, 150, 20);
    rotate(radians(45));
  }
  if (TTTCboard[1][2] == 'X') {
    fill(255);
    rotate(radians(315));
    rect(-130, 500, 20, 150);
    rect(-200, 560, 150, 20);
    rotate(radians(45));
  }
}
