void loadConfig() {
  JSONObject config=loadJSONObject("config.json");
  defaultPlayerNames[0]=config.getJSONObject("global").getJSONArray("Default Player Names").getString(0);
  defaultPlayerNames[1]=config.getJSONObject("global").getJSONArray("Default Player Names").getString(1);
  cellSize=config.getJSONObject("Conway's Game Of Life").getInt("Cell Size");
  probabilityOfAliveAtStart=config.getJSONObject("Conway's Game Of Life").getInt("Probability Of Cell Being Alive At Start");
  alive=color(config.getJSONObject("Conway's Game Of Life").getJSONArray("Alive Color").getInt(0), config.getJSONObject("Conway's Game Of Life").getJSONArray("Alive Color").getInt(1), config.getJSONObject("Conway's Game Of Life").getJSONArray("Alive Color").getInt(2));
  dead=color(config.getJSONObject("Conway's Game Of Life").getJSONArray("Dead Color").getInt(0), config.getJSONObject("Conway's Game Of Life").getJSONArray("Dead Color").getInt(1), config.getJSONObject("Conway's Game Of Life").getJSONArray("Dead Color").getInt(2));
  P_red=color(config.getJSONObject("Pente").getJSONArray("Player 1 Color").getInt(0), config.getJSONObject("Pente").getJSONArray("Player 1 Color").getInt(1), config.getJSONObject("Pente").getJSONArray("Player 1 Color").getInt(2));
  P_black=color(config.getJSONObject("Pente").getJSONArray("Player 2 Color").getInt(0), config.getJSONObject("Pente").getJSONArray("Player 2 Color").getInt(1), config.getJSONObject("Pente").getJSONArray("Player 2 Color").getInt(2));
  c4_red=color(config.getJSONObject("Connect Four").getJSONArray("Player 1 Color").getInt(0), config.getJSONObject("Connect Four").getJSONArray("Player 1 Color").getInt(1), config.getJSONObject("Connect Four").getJSONArray("Player 1 Color").getInt(2));
  c4_black=color(config.getJSONObject("Connect Four").getJSONArray("Player 2 Color").getInt(0), config.getJSONObject("Connect Four").getJSONArray("Player 2 Color").getInt(1), config.getJSONObject("Connect Four").getJSONArray("Player 2 Color").getInt(2));
  c_red=color(config.getJSONObject("Checkers").getJSONArray("Player 1 Color").getInt(0), config.getJSONObject("Checkers").getJSONArray("Player 1 Color").getInt(1), config.getJSONObject("Checkers").getJSONArray("Player 1 Color").getInt(2));
  c_black=color(config.getJSONObject("Checkers").getJSONArray("Player 2 Color").getInt(0), config.getJSONObject("Checkers").getJSONArray("Player 2 Color").getInt(1), config.getJSONObject("Checkers").getJSONArray("Player 2 Color").getInt(2));
  snakeColor=color(config.getJSONObject("Snake").getJSONArray("First Snake Color").getInt(0), config.getJSONObject("Snake").getJSONArray("First Snake Color").getInt(1), config.getJSONObject("Snake").getJSONArray("First Snake Color").getInt(2));
  snakeColor1=color(config.getJSONObject("Snake").getJSONArray("Second Snake Color").getInt(0), config.getJSONObject("Snake").getJSONArray("Second Snake Color").getInt(1), config.getJSONObject("Snake").getJSONArray("Second Snake Color").getInt(2));
  appleColor=color(config.getJSONObject("Snake").getJSONArray("Apple Color").getInt(0), config.getJSONObject("Snake").getJSONArray("Apple Color").getInt(1), config.getJSONObject("Snake").getJSONArray("Apple Color").getInt(2));
  defaultRotation=config.getJSONObject("Yahtzee").getInt("Rotation In Degrees Per Draw Cycle");
  defaultSpinTime=config.getJSONObject("Yahtzee").getInt("Spin Time In Milliseconds");
  spacing=config.getJSONObject("Minesweeper").getInt("Cell Size");
  minePercent=config.getJSONObject("Minesweeper").getInt("Percent Of Cells To Be Mines");
  for (int i=0; i<12; i++) {
    GameColors[i]=color(config.getJSONObject("global").getJSONArray("Game Selection Colors").getJSONArray(i).getInt(0), config.getJSONObject("global").getJSONArray("Game Selection Colors").getJSONArray(i).getInt(1), config.getJSONObject("global").getJSONArray("Game Selection Colors").getJSONArray(i).getInt(2));
  }
}
