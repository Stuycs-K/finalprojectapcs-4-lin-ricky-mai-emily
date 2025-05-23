public class Board {
  private int rows;
  private int cols;
  private int totalMines;
  private Tile[][] grid;
  
  public Board(int rows, int cols, int totalMines) {
    this.rows = rows;
    this.cols = cols;
    this.totalMines = totalMines;
    grid = new Tile[rows][cols];
    
  }
  
}
