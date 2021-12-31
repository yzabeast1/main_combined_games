void autotaking() {
  for (int a=0; a<=11; a++) {
    for (int b=0; b<=11; b++) {
      if (blackx[a]==redx[b]&&blacky[a]==redy[b]&&draging&&colorDragging=='b'&&numberDragging==a) {
        redx[b]=1000;
        redy[b]=1000;
      }
      if (redx[a]==blackx[b]&&redy[a]==blacky[b]&&draging&&colorDragging=='r'&&numberDragging==a) {
        blackx[b]=1000;
        blacky[b]=1000;
      }
    }
  }
}
