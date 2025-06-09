# Dev Log:

This document must be updated daily every time you finish a work session.

## Emily Mai

### 2024-01-02 - Brief description
Expanded description including how much time was spent on task.

### 2024-01-03 - Brief description
Expanded description including how much time was spent on task.

### 2025-05-19 - Prototype Description
Updated and expanded on the description of minesweeper in the prototype description. (1 period)

### 2025-05-20 - Development Phases Discussion
Discussed timeline of the development phases and who is responsible for each part with partner. (1 period)

### 2025-05-21 - UML Diagram Creation
Created a UML Diagram with the different classes we will implement and added a description of how each class works. Discussed group names with partner and added it to the prototype, and edited some of the formatting for better clarity. (1 hour)

### 2025-05-22 - Began Coding the Classes
Created the class files in processing and added the instance variables and some method signatures. I created my own branch, emily, and familiarized myself with the process of merging branches and fixing merge conflicts. Also, I wrote the board constructor and began the setup and draw methods. (1 period + 30 mins)

### 2025-05-23 - Started creating the board
Worked on the board and tile constructor to initialize the board. (1 period)

### 2025-05-27 - Continued making the board
Continued working on the board constructor and added a firstclick variable because we don't want the firstclick to be a mine. I merged my partner's and my branch to keep it up to date with the main. Also, I wrote drawSquares to fill the screen with alternating colored squares. (1 period + 30 mins)

### 2025-05-28 - Continued making the visual board
I worked on the method drawBoard by adding a rectangle to act as the header and calling drawSquares. (1 period)

### 2025-05-29 - Header Creation
Fixed the method drawSquares to create a checkboard pattern of alternating colored squares. Made a header at the top of the screen that will show the time and flag count, and fixed the screen sizing to ensure all the rows and columns are shown. (1 period + 30 mins)

### 2025-05-30 - Tried to implement clicking of tiles
When the user clicked, we used the x and y coordinates to try to make the number of adjacent mines appear. Tried to fix our countAdjMines method, but keep getting a nullpointerexception. (1 period + 30 mins)

### 2025-06-02 - Worked on processing a user's click
Fixed our countAdjMines method that was previously giving us nullpointerexceptions. Made numbers appear on the tiles and the type(color) of tile appear when clicked on. Also, I wrote and implemented the method floodFill and firstClick to process the user's first click. Tiles with no adjacent mines will be flood filled on the first click. Organized format of the code for clarity and removed unnecessary code. (1 period + 50 mins)

### 2025-06-03 - Continued working on processing a user's click
Edited floodFill method to make the number of adjacent mines appear on tiles located on the boundaries when flood filled. Combined methods revealTile and firstClick into one method, click, to process a user's click and reveal the neccesary amount of tiles. Also, I made the method placeFlag to place a flag on a tile when a user right clicks and worked on being able to remove the flag when right clicked again. (1 period + 30 mins)

### 2025-06-04 - Worked on mouse clicking and flag placing
Made the method mouseClicked() instead of checking for mousePressed because it prevents the user from dragging the mouse to reveal tiles. Fixed issues with the flag placing such as being able to place flags on revealed tiles and revealing tiles with a flag on it by creating a tileRevealed variable. (1 period + 30 mins)

I believe this document accurately reflects the contributions of my teammate. - Ricky 
