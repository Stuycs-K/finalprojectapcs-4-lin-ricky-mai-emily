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
 int alternate = 0; 
    for (int i = 0; i < rows; i++){

      for (int x = 0; x < cols; x++){
        if (x == 0 && alternate == 0){
        alternate = 1;
        }
        else if (x == 0 && alternate == 1){
        alternate = 0;
        }
       else {
       
       }
      }
    }
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
