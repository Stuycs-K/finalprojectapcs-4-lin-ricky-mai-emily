Board board;
int rows;
int cols;
int squaresize;
boolean firstClick = true;


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
    if (board.getGrid()[row][col].getIsMine()){
    
    background(51);
    fill(255,255,255);
    text("You Lost", cols * squaresize / 2, rows * squaresize /2);
    text("Play again?", cols * squaresize / 2, rows * squaresize /2 + 30 );
    text("Yes", cols * squaresize / 2, rows * squaresize /2 + 50 );
    text("No", cols * squaresize / 2 + 50 , rows * squaresize /2 + 50 );
    if (mousePressed){
    int x = mouseY;
    int y = mouseX;
    if (x < cols * squaresize / 2 + 50 && x >= cols * squaresize / 2 && y <= rows * squaresize / 2 + 60 && y > rows * squaresize / 2 + 30){
     background(256);
     
    }
    else if (x < cols * squaresize / 2 + 80 && x >= cols * squaresize / 2 + 50 && y <= rows * squaresize / 2 + 60 && y > rows * squaresize / 2 + 30){
    System.exit(0);
    }
    }
  
    
    }
    else{
    if (firstClick && !board.getGrid()[row][col].getIsMine()) {
      board.firstClick(row, col);
      firstClick = false;
    }
    else if (firstClick && board.getGrid()[row][col].getIsMine()) {
      board = new Board(rows, cols, 20); //regenerate board if the first click tile is a mine
    }
    else { 
      board.revealTile(row, col);
    }
    }
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
