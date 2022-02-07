//configurable variables
  //global
    String saveLocation = System.getProperty("user.home")+"/library/Application Support/Combined Games/";
    //games per row and column on game selection screen
      int gamesPerRow=4;
      int gamesPerColumn=3;
    //how often to autosave(in loops through draw)
      int autosaveTime=1000;
    //player staring names
      String[] defaultPlayerNames={"Player 1", "Player 2"};
  //conway's game of life
    // Size of cells
      int cellSize = 15;
    // How likely for a cell to be alive at start (in percentage)
      float probabilityOfAliveAtStart = 15;
    // Colors for active/inactive cells
      color alive = color(0, 200, 0);
      color dead = color(0);
  //pente
    //colors of pieces
      color P_red=#FF0000;
      color P_black=#000000;
  //connect four
    //colors of pieces
      color c4_red=#FF0000;
      color c4_black=#000000;
  //checkers
    //colors of pieces
      color c_red=#FF0000;
      color c_black=#000000;
  //snake
    //number of rows and columns on snake selection screen
      int snakeGamesPerRow=4;
      int snakeGamesPerColumn=3;
    //color of main snake
      color snakeColor=#000000;
    //color of second snake
      color snakeColor1=#0000FF;
    //apple color
      color appleColor=#FF0000;
    //yahtzee
      int defaultRotation=20;//in degrees
      int defaultSpinTime=1000;//in milliseconds
