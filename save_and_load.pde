void save() {
  String[] names={name1box.text, name2box.text};
  byte[] boardByte;
  saveStrings(saveLocation+"names.txt", names);
  int[] mancalaHoles={holes[0], holes[1], holes[2], holes[3], holes[4], holes[5], holes[6], holes[7], holes[8], holes[9], holes[10], holes[11], mancalas[0], mancalas[1]};
  byte[] mancalaholes=byte(mancalaHoles);
  byte[] pente=byte(P_board[0]);
  for (int a=1; a<=18; a++) {
    pente=concat(pente, byte(P_board[a]));
  }
  saveBytes(saveLocation+"penteBoard.bin", pente);
  byte[] penteGeneral={byte(P_redTurn), byte(P_redTaken), byte(P_blackTaken)};
  saveBytes(saveLocation+"penteGeneral.bin", penteGeneral);
  byte[] temp={byte(redTurn)};
  boardByte=byte(board[0]);
  boardByte=concat(boardByte, byte(board[1]));
  boardByte=concat(boardByte, byte(board[2]));
  boardByte=concat(boardByte, byte(board[3]));
  boardByte=concat(boardByte, byte(board[4]));
  boardByte=concat(boardByte, byte(board[5]));
  boardByte=concat(boardByte, byte(board[6]));
  boardByte=concat(boardByte, temp);
  saveBytes(saveLocation+"mancala.bin", mancalaholes);
  saveBytes(saveLocation+"c4board.bin", boardByte);
  byte[] ttt=byte(TTTboard[0]);
  ttt=concat(ttt, byte(TTTboard[1]));
  ttt=concat(ttt, byte(TTTboard[2]));
  saveBytes(saveLocation+"ttt.bin", ttt);
  int[] bhscore={hscore};
  saveBytes(saveLocation+"fbhighscore.bin", byte(bhscore));
  byte[] snakehs={byte(snakehscore), byte(msnakehscore), byte(mmsnakehscore), byte(nwsnakehscore)};  
  saveBytes(saveLocation+"snakehighscore.bin", snakehs);
  byte[] yahtzee={};
  for (int a=0; a<=1; a++) {
    for (int b=0; b<=17; b++) {
      byte[] temp1={byte(yscores[a][b].value)};
      concat(yahtzee, temp1);
    }
  }
  ////byte[] yahtzee0=byte(score[0]);
  ////byte[] yahtzee1=byte(score[1]);
  //yahtzee0=concat(yahtzee0, yahtzee1);
  saveBytes(saveLocation+"yahtzee.bin", yahtzee);
}
void load() {
  for (int a=0; a<=2; a++) {
    for (int b=0; b<=2; b++) {
      TTTboard[a][b]=char(loadBytes(saveLocation+"ttt.bin"))[a*3+b];
    }
  }
  name1box.text=loadStrings(saveLocation+"names.txt")[0];
  name2box.text=loadStrings(saveLocation+"names.txt")[1];
  mancalas[0]=loadBytes(saveLocation+"mancala.bin")[12];
  mancalas[1]=loadBytes(saveLocation+"mancala.bin")[13];
  for (int a=0; a<=11; a++) {
    holes[a]=loadBytes(saveLocation+"mancala.bin")[a];
  }
  for (int a=0; a<=6; a++) {
    for (int b=0; b<=6; b++) {
      board[a][b]=loadBytes(saveLocation+"c4board.bin")[(a*7+b)];
    }
  }
  for (int a=0; a<=18; a++) {
    for (int b=0; b<=18; b++) {
      P_board[a][b]=loadBytes(saveLocation+"penteBoard.bin")[(a*19+b)];
    }
  }
  hscore=loadBytes(saveLocation+"fbhighscore.bin")[0];
  snakehscore=loadBytes(saveLocation+"snakehighscore.bin")[0];
  redTurn=boolean(loadBytes(saveLocation+"c4board.bin")[49]);
  msnakehscore=loadBytes(saveLocation+"snakehighscore.bin")[1];
  mmsnakehscore=loadBytes(saveLocation+"snakehighscore.bin")[2];
  nwsnakehscore=loadBytes(saveLocation+"snakehighscore.bin")[3];
  for (int a=0; a<=1; a++) {
    for (int b=0; b<=17; b++) {
      yscores[a][b].value=int(loadBytes(saveLocation+"yahtzee.bin"))[a*18+b];
    }
  }
}
