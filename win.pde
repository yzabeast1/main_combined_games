int redtest=0;
int blacktest=0;
void win() {
  for (int a=0; a<=11; a++) {
    if (redx[a]==1000&&redy[a]==1000) {
      redtest++;
    }
    if (blackx[a]==1000&&blacky[a]==1000) {
      blacktest++;
    }
  }
  if (blacktest==12) {
    redWins=true;
  }
  if (redtest==12) {
    blackWins=true;
  }
  redtest=0;
  blacktest=0;
}
