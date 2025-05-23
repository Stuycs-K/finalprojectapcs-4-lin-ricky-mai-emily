Board board;
int rows;
int cols;
int squaresize;

void setup(){
  size(1000,1000); // change this
  rows = 10;
  cols = 10;
  squaresize = width / cols;
  board = new Board(rows, cols, 10);
  
}

void draw(){
  background(132, 194, 97);
  drawSquares(board);
  
}

void mouseClicked(){
  
}

void drawSquares(Board board){
  
}
