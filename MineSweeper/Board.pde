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
    int alternate = 0; 
    for (int i = 0; i < rows; i++){

      for (int x = 0; x < cols; x++){
        if (x == 0 && alternate == 0){
        color(light green);
        count = 1;
        }
        else if (x == 0 && alternate == 1){
        count = 0;
        color (dark green);
        }
      }
    }
  }
  
}
