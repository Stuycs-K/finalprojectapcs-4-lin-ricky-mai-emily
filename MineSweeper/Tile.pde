public class Tile {
  private boolean isRevealed;
  private boolean isFlagged;
  private boolean isMine;
  private int adjacentMines;
  
  public Tile(boolean mine) {
    isMine = mine;
    isRevealed = false;
    isFlagged = false;
  }
  
}
