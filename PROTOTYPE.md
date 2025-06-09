
# Technical Details:
~(CHANGE THIS!!!!!)~

~A description of your technical design. This should include: ~
   
~How you will be using the topics covered in class in the project.~


Description:

Period 4  
Ricky Lin, Emily Mai  
Group Name: Stuyper Sweepers

Project Description: Minesweeper: Minesweeper is a single-player logic puzzle game where the goal is to clear a grid containing hidden mines without detonating any of them. The player will have the option to choose between an easy (10x10 grid), medium (15x15 grid), or hard (20x20 grid) mode, which corresponds to how large the board is. The player will click on random grid pieces and a number will be revealed, indicating the amount of mines present in the eight squares adjacent to the square they clicked. The player will be able to place a red-flag by right-clicking on a square to indicate that a mine is present at that location. The player will continue clicking grid pieces until all non-mine pieces have been revealed.
Link: https://minesweeperonline.com/#

Expanded Description:
Critical features (Minimum Viable Product): We should be able to visually see the board of minesweeper and being able to click on a square and revealing what that square is.  
Diagrams: Not needed.  
Nice to have features:  
-Losing and wining screen  
~-Animations  ~ We decided that this feature wasn't necessary. 
-A scoreboard for the flags and time spent  
-Different difficulties   
~-Music and sharing your game  ~ We didn't know how to code this
~-Leaderboard  ~ We didn't know how to code this
~-Loading Screen  ~ We decided we did not need this


     
# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.  
Old UML Diagram:  
<img width="606" alt="Screenshot 2025-05-21 at 11 31 45 PM" src="https://github.com/user-attachments/assets/493b86e8-ea0b-446f-8949-63782b3b3496" />

The Minesweeper class will include the board and the methods setup, draw, and mouseClicked to update the board as the player clicks on tiles. The Tile class has boolean variables to indicate the status of the tile, whether it is revealed or not, flagged or not, or if it is a mine. It also includes the method countAdjMines to count how many mines are adjacent to it, and the number of mines will ultimately be displayed on the tile. The Board class contains the 2D grid of tiles and creates the initial board. It includes methods to reveal a tile, place a flag on a tile, and determine if the game has been won or is over. 

New UML Diagram:  
<img width="666" alt="Screenshot 2025-06-09 at 5 03 46 AM" src="https://github.com/user-attachments/assets/d66ea7f1-df63-4a5a-afa8-d61c6985f87c" />

The Minesweeper class includes the methods setup, draw, mouseClicked, keyPressed, and drawSquares to update the board as the player clickes on tiles or presses a key on the keyboard. The Board class includes a constructor to initialize the board and the methods firstClick, click, floodFill, and placeFlag. These methods process the player's click and reveals the corresponding tiles. On the first click, a patch of land will be revealed and clicks after with no adjacent mines will reveal patches of land too. The placeFlag allows user to place and remove flag by right clicking. The Tile class contains a Tile constructor and getMethods to get the value of the instance variables in the class. Also, the Tile class contains countAdjMines to count how many mines are adjacent to it, and the number of mines will ultimately be displayed on the tile.

    
# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

~A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)~

To break up the work, both of us can share the work of making the visual game and then doing the extra features by ourselves. 

* Make the visual game (Finish by 5/28/25 everything except animations)
  * Make the board grids ( Both of us )
  * Make the buttons that are safe and has mines (Both of us )
  * Make the animations (This should be finished last as it is low priority so 5/31/25) (Both of us )
   
* Losing and Winning screen (Finish by 5/30/25) (Ricky)
  
* Scoreboard and leaderboard (Finish by 5/30/25) (Emily)
  * A score of counting how many flags you have left
  * A score of time
  * Compare the timing of completing a certain difficulty. 
  
* Different difficulties (5/31/25) (Both )
  
* Loading screen, music,  and a way to share your game (Finish by 5/31/25) (Both)

