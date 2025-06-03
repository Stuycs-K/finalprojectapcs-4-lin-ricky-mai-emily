Board board;
int rows;
int cols;
int squaresize;
boolean firstClick;


void setup(){
  size(500, 600); // change this
  rows = 10;
  cols = 10;
  squaresize = width / cols;
  board = new Board(rows, cols, 20);
  drawSquares(board);
  
}

void draw(){
  fill(99, 184, 68); //green header color
  rect(0, 0, width, 100);
  fill(0, 0, 0); //black for text
  textSize(20);
  text("Flags:", 200, 50);
  text("Time:", 300, 50);
  if (mousePressed) {
    int row = (mouseY - 100) / squaresize;
    int col = mouseX / squaresize;
    board.revealTile(row, col);
  }
}

void drawSquares(Board board){
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if ((r + c) % 2 == 0) {
        fill(99, 184, 68);
      }
      else {
        fill(135, 209, 82);
      }
      square(squaresize * c, squaresize * r + 100, squaresize);
    }
  }
}
