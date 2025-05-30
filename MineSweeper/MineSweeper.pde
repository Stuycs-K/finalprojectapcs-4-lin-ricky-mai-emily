Board board;
int rows;
int cols;
int squaresize;
boolean firstClick;


void setup(){
  size(500,500); // change this
  rows = 10;
  cols = 10;
  squaresize = width / cols;
  board = new Board(rows, cols, 10);
  
}

void draw(){
 // background(132, 194, 97);
  drawSquares(board);
  rect(0, 0, width, 100);
  fill(0, 0, 0);
  text("Flags:", 200, 50);
  text("Time:", 300, 50);
}

void mouseClicked(){
  
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
      square(squaresize * c, squaresize * r, squaresize);
    }
  }
}
