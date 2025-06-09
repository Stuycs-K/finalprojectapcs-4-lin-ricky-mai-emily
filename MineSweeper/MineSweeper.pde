Board board;
int rows;
int cols;
int squaresize;
boolean firstClick = true;
boolean lost = false; 
int tick = 0; 
int numFlag; 
String difficulty = "medium";


void setup(){
  size(500, 600); // change this
  rows = 10;
  cols = 10;
  squaresize = width / cols;
  board = new Board(rows, cols, 20);
  numFlag = 20; 
  drawSquares(board);
  // make sure the parameters become changable and are variables instead 

}

void draw(){
  tick++;
  fill(99, 184, 68); //green header color
  rect(0, 0, width, 100);
  fill(0, 0, 0); //black for text
  textSize(20);
  text("Flags: " + numFlag, 200, 50);
  text("Time: " + tick / 60, 300, 50);
  int count = 0;
  int notMines = board.getGrid().length * board.getGrid()[0].length - board.getTotalMines();
  for (int i = 0 ; i < board.getGrid().length; i ++){
    for(int x = 0; x < board.getGrid()[0].length; x++){
      if (!board.getGrid()[i][x].getIsMine() && board.getGrid()[i][x].getIsRevealed() ){
        count++;
      }
    }
  }
  if (count == notMines){
    background(0);
    fill(255,255,255);
    text("You Won!", cols * squaresize / 2, rows * squaresize /2);
  }
}

void mouseClicked() {
  int row = (mouseY - 100) / squaresize;
  int col = mouseX / squaresize;
  if (mouseButton == RIGHT) {
    board.placeFlag(row, col);
  }
  else if (firstClick) {
    board.firstClick(row, col);
    firstClick = false;
  }
  else if (!firstClick && mouseButton == LEFT && !board.flagPlaced[row][col] && board.getGrid()[row][col].getIsMine()){
    background(51);
    fill(255,255,255);
    text("You Lost", cols * squaresize / 2, rows * squaresize /2);
    text("Play again? Press: ", cols * squaresize / 2, rows * squaresize /2 + 30 );
    text("[Y]es", cols * squaresize / 2, rows * squaresize /2 + 50 );
    text("[N]o", cols * squaresize / 2 + 50 , rows * squaresize /2 + 50 );
    lost = true;
   }
   else if (!board.flagPlaced[row][col]) {
     board.click(row, col);
   }
}

void keyPressed(){
  if (key == 'e') {
    difficulty = "easy";
    board = new Board(rows, cols, 10);
    numFlag = 10;
    tick = 0;
    drawSquares(board);
    firstClick = true;
  }
  if (key == 'm') {
    difficulty = "medium";
    board = new Board(rows, cols, 20);
    numFlag = 20;
    tick = 0;
    drawSquares(board);
    firstClick = true;
  }
  if (key == 'h') {
    difficulty = "hard";
    board = new Board(rows, cols, 30);
    numFlag = 30;
    tick = 0;
    drawSquares(board);
    firstClick = true;
  }
  if (lost){
    if (key == 'y'){
      background(255);
  }
    else if (key == 'n'){
      System.out.println("4");
      System.exit(0);
    }
  }
  if (key == 'w'){
    background(0);
    fill(255,255,255);
    text("You Won!", cols * squaresize / 2, rows * squaresize /2);
  }
  if (key == 'l'){
    background(51);
    fill(255,255,255);
    text("You Lost", cols * squaresize / 2, rows * squaresize /2);
    text("Play again? Press: ", cols * squaresize / 2, rows * squaresize /2 + 30 );
    text("[Y]es", cols * squaresize / 2, rows * squaresize /2 + 50 );
    text("[N]o", cols * squaresize / 2 + 50 , rows * squaresize /2 + 50 );
    lost = true; 
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
