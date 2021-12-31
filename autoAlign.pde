void autoAlign() {
  for (int a=0; a<=11; a++) {
    int temp;
    if (validMoveRed(a)) {
      temp=int(redx[a]);
      temp-=50;
      redx[a] = temp + 100/2;
      redx[a] -= redx[a] % 100;    
      redx[a]+=50;
      temp=int(redy[a]);
      temp-=50;
      redy[a] = temp + 100/2;
      redy[a] -= redy[a] % 100;    
      redy[a]+=50;
    }
    if (validMoveBlack(a)) {
      temp=int(blackx[a]);
      temp-=50;
      blackx[a] = temp + 100/2;
      blackx[a] -= blackx[a] % 100;    
      blackx[a]+=50;
      temp=int(blacky[a]);
      temp-=50;
      blacky[a] = temp + 100/2;
      blacky[a] -= blacky[a] % 100;    
      blacky[a]+=50;
    }
  }
}
boolean validMoveRed(int a) {
  int possiblex;
  int possibley;
  int temp=int(redx[a]);
  temp-=50;
  possiblex=temp+100/2;
  possiblex-=redx[a]%100;
  possiblex+=50;
  temp=int(redy[a]);
  temp-=50;
  possibley=temp+100/2;
  possibley-=redy[a]%100;
  possibley+=50;
  boolean valid=false;
  for (int b=0; b<=validx.length-1; b++) {
    if (possiblex==validx[b]&&possibley==validy[b]) {
      valid=true;
    }
  }
  return valid;
}
boolean validMoveBlack(int a) {
  int possiblex;
  int possibley;
  int temp=int(blackx[a]);
  temp-=50;
  possiblex=temp+100/2;
  possiblex-=blackx[a]%100;
  possiblex+=50;
  temp=int(blacky[a]);
  temp-=50;
  possibley=temp+100/2;
  possibley-=blacky[a]%100;
  possibley+=50;
  boolean valid=false;
  for (int b=0; b<=validx.length-1; b++) {
    if (possiblex==validx[b]&&possibley==validy[b]) {
      valid=true;
    }
  }
  return valid;
}
