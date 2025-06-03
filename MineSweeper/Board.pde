public class Board {
  private int rows;
  private int cols;
  private int totalMines;
  private Tile[][] grid;
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
    grid = new Tile[rows][cols];
    int counter = 0; 
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int randNum = (int) (Math.random() * 5);
        //if (firstClick) {
        //  grid[r][c] = new Tile(false, r, c);
        //}
        if (randNum == 1 && counter != totalMines ) {
          grid[r][c] = new Tile(true, r, c);
          counter++;
        }
        else {
          grid[r][c] = new Tile(false, r, c);
        }
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
    println(board.getGrid()[row][col].getIsMine()); //debugging statement to check if a tile is a mine
  }
  
    
  public void click(int row, int col) {
    //if firstClick is a mine, regenerate the board
    if (firstClick && board.getGrid()[row][col].getIsMine()) {
      board = new Board(rows, cols, 20);
    }
    //if firstClick is not a mine, game continues
    else if (firstClick && !board.getGrid()[row][col].getIsMine()) {
      firstClick = false;
    }
    else {
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
      fill(235, 220, 91); //yellow
      square(squaresize * col, squaresize * row + 100, squaresize);
    }
  }
  
  public void floodFill(int row, int col, boolean[][] visited) {
    if (row >= 0 && row < board.rows && col >= 0 && col < board.cols) {
      if (board.getGrid()[row][col].getAdjacentMines() == 0) {
        if (!visited[row][col]) {
          visited[row][col] = true;
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
        fill(235, 220, 91); //yellow
        square(squaresize * col, squaresize * row + 100, squaresize);
        int numAdjMines = board.getGrid()[row][col].getAdjacentMines();
        fill(0, 0, 0);
        text("" + numAdjMines, col * 50 + 20, row * 50 + 120);
      }
    }
  }
}
