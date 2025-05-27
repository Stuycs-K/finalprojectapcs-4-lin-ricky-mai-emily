public class Board {
  private int rows;
  private int cols;
  private int totalMines;
  private Tile[][] grid;
  
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
    
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int randNum = (int) (Math.random() * 8);
        if (randNum == 1) {
          grid[r][c] = new Tile(true);
        }
      }
    }
  }
  
}
