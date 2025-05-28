Board board;
int rows;
int cols;
int squaresize;
boolean firstClick;

void setup(){
  size(1000,1000); // change this
  rows = 8;
  cols = 8;
  squaresize = width / cols;
  board = new Board(rows, cols, 10);
  
}

void draw(){
  background(132, 194, 97);
  drawSquares(board);
  
}

void mouseClicked(){
  
}

void drawBoard(){
  rect(0, 0, 1000, 150);
  drawSquares(board);
}

void drawSquares(Board board){
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (r + c % 2 == 0) {
        fill(99, 184, 68);
      }
      else {
        fill(135, 209, 82);
      }
      square(squaresize * cols, squaresize * rows, squaresize);
    }
  }
}
