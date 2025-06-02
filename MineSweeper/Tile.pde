public class Tile extends Board {
  private boolean isRevealed;
  private boolean isFlagged;
  private boolean isMine;
  private int adjacentMines;
  private int row;
  private int column; 

  public Tile(boolean mine, int row, int column) {
    isRevealed = false;
    isFlagged = false;
    isMine = mine;
    this.row = row;
    this.column = column;
  }
  
  public boolean getIsRevealed(){
    return isRevealed;
  }
  
  public boolean getIsFlagged(){
    return isFlagged;
  }
  
  public boolean getIsMine(){
    return isMine;
  }
  
  public int getAdjacentMines(){
    adjacentMines = countAdjMines();
    return adjacentMines;
  }
  
  public int getRow(){
    return row;
  }
  
  public int getColumn (){
    return column;
  }
  
  public int countAdjMines(){
    int count = 0;
    for (int r = row - 1; r <= row + 1; r++) {
      for (int c = column - 1; c <= column + 1; c++) {
        if ( r >= 0 && r < board.rows && c >= 0 && c < board.cols) {
          if (getGrid()[r][c] != null && getGrid()[r][c].getIsMine()) {
            count++;
          }
        }
      }
    }
    return count;
   // for (int i = row - 1; i < row + 2; i++){
   //   for (int x = column - 1; x < column + 2; x++){
   //    if (getGrid()[i][x].getIsMine() == true){
   //      count += 1;
   //    }
   //   }
   //}
  }
}
