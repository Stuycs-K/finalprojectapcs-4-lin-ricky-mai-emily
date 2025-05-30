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
        int randNum = (int) (Math.random() * 8);
        if (firstClick) {
          grid[r][c] = new Tile(false, r, c);
        }
        else if (randNum == 1 && counter != 10 ) {
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
  
}
