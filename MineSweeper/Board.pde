public class Board {
  private int rows;
  private int cols;
  private int totalMines;
  private Tile[][] grid;
  private boolean[][] flagPlaced;
  private boolean[][] tileRevealed;
  private final color LIGHT_GREEN = color(135, 209, 82);
  private final color DARK_GREEN = color(99, 184, 68);
  private final color BLACK = color(0, 0, 0);

  public Board() {
    rows = 10;
    cols = 10;
    totalMines = 10;
  }

  public Board(int rows, int cols, int totalMines) {
    this.rows = rows;
    this.cols = cols;
    this.totalMines = totalMines;
    flagPlaced = new boolean[rows][cols];
    tileRevealed = new boolean[rows][cols];
    grid = new Tile[rows][cols];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        grid[r][c] = new Tile(false, r, c);
      }
    }
    int currentMines = 0;
    while (currentMines < totalMines) {
      int randomRow = (int) (Math.random() * rows);
      int randomCol = (int) (Math.random() * cols);
      if (!grid[randomRow][randomCol].getIsMine()) {
        grid[randomRow][randomCol] = new Tile(true, randomRow, randomCol);
        currentMines++;
      }
    }
  }
  
  public Tile[][] getGrid(){
    return grid;
  }
  
  public void revealTile(int row, int col) {
    int numAdjMines = 0;
    if (row >= 0 && row < board.rows && col >= 0 && col < board.cols) {
      numAdjMines = board.getGrid()[row][col].getAdjacentMines();
    }
    if (board.getGrid()[row][col].getIsMine()){
      fill (235, 91, 91); //red
      square(squaresize * col , squaresize * row + 100, squaresize);
    }
    if (!board.getGrid()[row][col].getIsMine()){
      fill(235, 220, 91); //yellow
      square(squaresize * col, squaresize * row + 100, squaresize);
      
      for (int r = row - 1; r <= row + 1; r++) {
        for (int c = col - 1; c <= col + 1; c++) {
          if ( r >= 0 && r < board.rows && c >= 0 && c < board.cols) {
            numAdjMines = board.getGrid()[r][c].getAdjacentMines();
            fill(0, 0, 0);
            text("" + numAdjMines, c * 50 + 20, r * 50 + 120);
          }
        }
       }
      }
    textSize(25);


  //  println(board.getGrid()[row][col].getIsMine()); //debugging statement to check if a tile is a mine


    //println(board.getGrid()[row][col].getIsMine()); //debugging statement to check if a tile is a mine

  }
  
  public void firstClick(int row, int col) {
    //if firstClick is a mine, regenerate the board
    if (firstClick) {
      while (board.getGrid()[row][col].getIsMine() || board.getGrid()[row][col].getAdjacentMines() > 0) {
        board = new Board(rows, cols, 20);
      }
    }
    //if firstClick is not a mine, game continues
    else if (firstClick && !board.getGrid()[row][col].getIsMine() && board.getGrid()[row][col].getAdjacentMines() == 0) {
      firstClick = false;
    }
    else {
      boolean[][] visited = new boolean[board.rows][board.cols];
      floodFill(row, col, visited);
    }
  }
  
  public void click(int row, int col) {
    if (board.getGrid()[row][col].getAdjacentMines() == 0) {
      boolean[][] visited = new boolean[board.rows][board.cols];
      floodFill(row, col, visited);
    }
    int numAdjMines = 0;
    if (row >= 0 && row < board.rows && col >= 0 && col < board.cols) {
      numAdjMines = board.getGrid()[row][col].getAdjacentMines();
    }
    if (board.getGrid()[row][col].getIsMine()){
      fill (235, 91, 91); //red
      square(squaresize * col , squaresize * row + 100, squaresize);
    }
    if (!board.getGrid()[row][col].getIsMine()){
      tileRevealed[row][col] = true;
      fill(235, 220, 91); //yellow
      square(squaresize * col, squaresize * row + 100, squaresize);
      fill(0, 0, 0);
      if (numAdjMines != 0) {
        text("" + numAdjMines, col * 50 + 20, row * 50 + 120);
      }
    }
  }
    
  public void floodFill(int row, int col, boolean[][] visited) {
    if (row >= 0 && row < board.rows && col >= 0 && col < board.cols) {
      if (board.getGrid()[row][col].getAdjacentMines() == 0) {
        if (!visited[row][col]) {
          visited[row][col] = true;
          tileRevealed[row][col] = true;
          fill(235, 220, 91); //yellow
          square(squaresize * col, squaresize * row + 100, squaresize);
          floodFill(row + 1, col, visited);
          floodFill(row - 1, col, visited);
          floodFill(row, col + 1, visited);
          floodFill(row, col - 1, visited);
          floodFill(row + 1, col + 1, visited);
          floodFill(row - 1, col - 1, visited);
          floodFill(row + 1, col - 1, visited);
          floodFill(row - 1, col + 1, visited);
        }
      }
      if (board.getGrid()[row][col].getAdjacentMines() != 0) {
        tileRevealed[row][col] = true;
        fill(235, 220, 91); //yellow
        square(squaresize * col, squaresize * row + 100, squaresize);
        int numAdjMines = board.getGrid()[row][col].getAdjacentMines();
        fill(0, 0, 0);
        text("" + numAdjMines, col * 50 + 20, row * 50 + 120);
      }
    }
  }
  
  public void placeFlag(int row, int col) {
    if (!flagPlaced[row][col] && !tileRevealed[row][col]) {
      fill (235, 91, 91);
      rect(squaresize * col + 10, squaresize * row + 110, 5, 30);
      triangle(squaresize * col + 10, squaresize * row + 110, squaresize * col + 10, squaresize * row + 120, squaresize * col + 30, squaresize * row + 120); 
      flagPlaced[row][col] = true;
      println(flagPlaced[row][col]);
      numFlag--;
    }
    else if (flagPlaced[row][col]) {
      if ((row + col) % 2 == 0) {
        fill(99, 184, 68);
      }
      else {
        fill(135, 209, 82);
      }
      square(squaresize * col, squaresize * row + 100, squaresize);
      flagPlaced[row][col] = false;
      numFlag++;
    }
  }
  public int getTotalMines(){
    return totalMines;
  }
}
