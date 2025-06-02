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
 // background(132, 194, 97);
  //drawSquares(board);
  fill(99, 184, 68);
  rect(0, 0, width, 100);
  fill(0, 0, 0);
  textSize(20);
  text("Flags:", 200, 50);
  text("Time:", 300, 50);
  //for (int i = 0; i < rows;i++){
  //for (int x = 0; x < cols; x ++){
  //if(board.getGrid[i][x].)
  //}
  //}
  if (mousePressed) {
    int row = (mouseY - 100) / squaresize;
    int col = mouseX / squaresize;
    int numAdjMines = 0;
    if (row >= 0 && row < board.rows && col >= 0 && col < board.cols) {
      numAdjMines = board.getGrid()[row][col].getAdjacentMines();
    }
    if (board.getGrid()[row][col].getIsMine()){
    fill (235, 91, 91);
    square(squaresize * col , squaresize * row + 100, squaresize);
    }
    if (!board.getGrid()[row][col].getIsMine()){
      fill(235, 220, 91);
      square(squaresize * col, squaresize * row + 100, squaresize);
      
      for (int r = row - 1; r <= row + 1; r++) {
        for (int c = col - 1; c <= col + 1; c++) {
          if ( r >= 0 && r < board.rows && c >= 0 && c < board.cols) {
            numAdjMines = board.getGrid()[r][c].getAdjacentMines();
            fill(0, 0, 0);
            text("" + numAdjMines, c * 50 + 20, r * 50 + 120);
           
          }
        }
       }
      }
    
    
  textSize(25);
  //text("" + numAdjMines, col * 50 + 20, row * 50 + 120);
  println(board.getGrid()[row][col].getIsMine());
}
}

//void mouseClicked(){
//  int row = (mouseY - 100) / squaresize;
//  int col = mouseX / squaresize;
//  int numAdjMines = board.getGrid()[row][col].getAdjacentMines();
//  textSize(25);
//  text("" + numAdjMines, col * 50 + 20, row * 50 + 120);
//}

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
