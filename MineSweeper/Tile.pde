public class Tile extends Board {
  private boolean isRevealed;
  private boolean isFlagged;
  private boolean isMine;
  private int adjacentMines;
  private int row;
  private int column;
  
  
  public Tile(boolean mine, int row, int column) {
    isMine = mine;
    isRevealed = false;
    isFlagged = false;
    this.row = row;
    this.column = column;
  }
  
}
