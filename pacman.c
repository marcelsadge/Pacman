/*
 * pacman.c : All the code necessary to implement the Guitar Hero Game for 240
 */

#include "lc4_stdio.h"

/*
 * #############  DATA STRUCTURES THAT STORE THE GAME STATE ######################
 */

// Value for when Pacman moving up
#define UP 1
// Value for when Pacman moving down
#define DOWN 2
// Value for when Pacman moving right
#define RIGHT 3
// Value for when Pacman moving left
#define LEFT 4

// Boolean value for true
#define TRUE 1

// Boolean value for false
#define FALSE 0

// Variable for character that is read in from getc_timer
char c;

// Array that holds valid and non valid locations on map (needed for collision detection)
int validspace [124][128];

// Variables for loop iteration
int i,j;

// Array that stores 
unsigned int colors[2];

// Variables that holds the score
int score;

// Specifies the three digits for the score
int score_left;
int score_middle;
int score_right;

// Previous values of the score (only needed for extra credit)
int prev_score_left;
int prev_score_middle;
int prev_score_right;

// Variable that holds number of ghosts
int numghosts = 2;

// Variable that specifies the number of dots
int numdots = 92;

// Arrays that store the x and y locations of the dots
int dotsx[92];
int dotsy[92];

// Speed for getc_timer
int timer_speed = 500;

// Previous location of pacman, needed for redrawing
int prevx;
int prevy;

// Current and previous directions pacman was facing
int direction;
int prevdirection;

// Current location of pacman
int x;
int y;

// Variables for randomness of the second ghost
int random;
int randomdirection;

// Current and Previous locations of the ghosts
int ghostsx[2];
int ghostsy[2];
int ghostsprevx[2];
int ghostsprevy[2];

// Direction ghosts are currently heading
int ghostsdirection[2];

// Variables for the bounding box of pacman
int right, left, bottom, top;

/*
 * #############  CODE THAT DRAWS THE SCENE ######################
 */
// Sprites for score numbers. 0-5 are given. Complete sprites for 6, 7, 8, and 9.
// This is for extra credit!

// Number 0
lc4uint zero [] = {
  0xFF,
  0xC3,
  0xC3,
  0xC3,
  0xC3,
  0xC3,
  0xC3,
  0xFF,
};

// Number 1
lc4uint one [] = {
  0x18,
  0x18,
  0x18,
  0x18,
  0x18,
  0x18,
  0x18,
  0x18,
};

// Number 2
lc4uint two [] = {
  0xFF,
  0xFF,
  0x07,
  0xFF,
  0xFF,
  0xE0,
  0xFF,
  0xFF,
};

// Number 3
lc4uint three [] = {
  0xFF,
  0xFF,
  0x07,
  0xFF,
  0xFF,
  0x07,
  0xFF,
  0xFF,
};

// Number 4
lc4uint four [] = {
  0xC3,
  0xC3,
  0xC3,
  0xFF,
  0x03,
  0x03,
  0x03,
  0x03,
};

// Number 5
lc4uint five [] = {
  0xFF,
  0xFF,
  0xE0,
  0xFF,
  0xFF,
  0x07,
  0xFF,
  0xFF,
};

// Number 6
lc4uint six [] = {
  0xFF,
  0xFF,
  0xE0,
  0xFF,
  0xFF,
  0xC3,
  0xFF,
  0xFF,
};

// Number 7
lc4uint seven [] = {
  0xFF,
  0x07,
  0x07,
  0x07,
  0x07,
  0x07,
  0x07,
  0x07,
};

// Number 8
lc4uint eight [] = {
  0xFF,
  0xC3,
  0xC3,
  0xFF,
  0xC3,
  0xC3,
  0xFF,
  0xFF,
};

// Number 9
lc4uint nine [] = {
  0xFF,
  0xFF,
  0xC3,
  0xFF,
  0xFF,
  0x07,
  0xFF,
  0xFF,
};

lc4uint ghost [] = {
  0x3C, 
  0x7E, 
  0xFF, 
  0xDB, 
  0xFF, 
  0xFF, 
  0xE7, 
  0xA5
} ;

void draw_score ()
{
  /**
     draw_score draws the three digits needed to display the score. It checks the values of
     score_left, score_middle and score_right, and draws the score in the appropriate location using lc4_draw_sprite(). 
     You may draw the score in any color that you like, as long as it is visible while playing.
     This should be drawn in the center box (whose coordinates start at (50, 53))
     You should be using previous score, to write the previous score black, before writing the new score
  **/

  // YOUR CODE HERE - Extra credit
  int middle_x = 50;
  int middle_y = 58;

  if (score_left == 0) {
    lc4_draw_sprite(middle_x, middle_y, YELLOW, zero);
  }

  if (score_middle == 0) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, nine);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, zero);
  }
  if (score_middle == 1) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, zero);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, one);
  }
  if (score_middle == 2) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK,  one);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, two);
  }
  if (score_middle == 3) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, two);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, three);
  }
  if (score_middle == 4) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, three);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, four);
  }
  if (score_middle == 5) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, four);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, five);
  }
  if (score_middle == 6) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, five);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, six);
  }
  if (score_middle == 7) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, six);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, seven);
  }
  if (score_middle == 8) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, seven);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, eight);
  }
  if (score_middle == 9) {
    lc4_draw_sprite(middle_x + 9, middle_y, BLACK, eight);
    lc4_draw_sprite(middle_x + 9, middle_y, YELLOW, nine);
  }

  if (score_right == 0) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, nine);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, zero);
  }
  if (score_right == 1) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, zero);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, one);
  }
  if (score_right == 2) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, one);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, two);
  }
  if (score_right == 3) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, two);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, three);
  }
  if (score_right == 4) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, three);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, four);
  }
  if (score_right == 5) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, four);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, five);
  }
  if (score_right == 6) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, five);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, six);
  }
  if (score_right == 7) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, six);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, seven);
  }
  if (score_right == 8) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, seven);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, eight);
  }
  if (score_right == 9) {
    lc4_draw_sprite(middle_x + 18, middle_y, BLACK, eight);
    lc4_draw_sprite(middle_x + 18, middle_y, YELLOW, nine);
  }

}

void endl () {
  lc4_puts((lc4uint*)"\n");
}

void printnum () {
  
  /**
     printnum prints the current score to the ascii display. It checks score, calculates score_left, score_middle, and score_right
     and then prints them, using lc4_putc().
  **/
  score_right = score % 10;
  score_middle = score / 10;
  score_middle = score_middle % 10;
  score_left = score / 100;
  lc4_putc(48 + score_left);
  lc4_putc(48 + score_middle);
  lc4_putc(48 + score_right);
  endl();
}

/* Print newline */


/* rand16 returns a pseudo-random between 0 and 128 by simulating the action of a 16 bit Linear Feedback Shift Register. Advance the lfsr 7 times using the lc4_lfsr() function. Then return the last 7 bits of the lfsr. */
int rand16 () {

  for (i = 0; i < 7; i++) {
    random = lc4_random();
  } 

  return random;
}

/*
 * #############  CODE THAT DRAWS THE PACMAN and the GHOSTS ######################
 */


lc4uint pacmanrt [] = {
  0x1F, 
  0x3E, 
  0x7C, 
  0x78, 
  0x78, 
  0x7C, 
  0x3E, 
  0x1F
};

lc4uint pacmanlt [] = {
  0xF8, 
  0x7C, 
  0x3E, 
  0x1E, 
  0x1E, 
  0x3E, 
  0x7C, 
  0xF8
};

lc4uint pacmanup [] = {
  0x81, 
  0xC3, 
  0xE7, 
  0xFF, 
  0xFF, 
  0x7E, 
  0x3C, 
  0x00
};

lc4uint pacmandown [] = {
  0x00, 
  0x3C, 
  0x7E, 
  0xFF, 
  0xFF, 
  0xE7, 
  0xC3, 
  0x81
};

/*
 * #############  CODE THAT DRAWS A LINE ON THE BOARD AND SETS THOSE POINTS TO INVALID ######################
 */
void draw_line(int row, int col, int length, unsigned int color, int vertical) {
  if (vertical) {
    lc4_draw_vline(row, col, length, color);
    for (i = row; i < row + length; i++) {
      validspace[i][col] = 1;
    }
  } else {
    lc4_draw_hline(row, col, length, color);
    for (i = col; i < col + length; i++) {
      validspace[row][i] = 1;
    }
  }
}

/*
 * #############  FUNCTION THAT DRAWS THE GRID (DO NOT TOUCH) ######################
 */
void draw_grid() {
  //Filling Outside
  draw_line(1, 0, 128, DARKBLUE, 0);
  draw_line(0, 0, 128, DARKBLUE, 0);
  draw_line(123, 0, 128, DARKBLUE, 0);
  draw_line(122, 0, 128, DARKBLUE, 0);
  draw_line(0, 3, 47, DARKBLUE, 1);
  draw_line(78, 3, 46, DARKBLUE, 1);
  draw_line(0, 2, 47, DARKBLUE, 1);
  draw_line(78, 2, 46, DARKBLUE, 1);
  draw_line(0, 1, 47, DARKBLUE, 1);
  draw_line(78, 1, 46, DARKBLUE, 1);
  draw_line(0, 0, 47, DARKBLUE, 1);
  draw_line(78, 0, 46, DARKBLUE, 1);
  draw_line(0, 127, 47, DARKBLUE, 1);
  draw_line(78, 127, 46, DARKBLUE, 1);
  draw_line(0, 124, 47, DARKBLUE, 1);
  draw_line(78, 124, 46, DARKBLUE, 1);
  draw_line(0, 125, 47, DARKBLUE, 1);
  draw_line(78, 125, 46, DARKBLUE, 1);
  draw_line(0, 126, 47, DARKBLUE, 1);
  draw_line(78, 126, 46, DARKBLUE, 1);



  //Top wall
  draw_line(2, 4, 120, DARKBLUE, 0);

  
  //Box off top left corner
  draw_line(12, 14, 12, DARKBLUE, 0);
  draw_line(12, 14, 10, DARKBLUE, 1);
  draw_line(21, 14, 12, DARKBLUE, 0);
  draw_line(12, 25, 10, DARKBLUE, 1);

  //Second box off top left corner
  draw_line(12, 37, 18, DARKBLUE, 0);
  draw_line(12, 37, 10, DARKBLUE, 1);
  draw_line(21, 37, 18, DARKBLUE, 0);
  draw_line(12, 54, 10, DARKBLUE, 1);

  //Box off top right corner
  draw_line(12, 102, 12, DARKBLUE, 0);
  draw_line(12, 102, 10, DARKBLUE, 1);
  draw_line(21, 102, 12, DARKBLUE, 0);
  draw_line(12, 113, 10, DARKBLUE, 1);

  //Second box off top right corner
  draw_line(12, 74, 18, DARKBLUE, 0);
  draw_line(12, 74, 10, DARKBLUE, 1);
  draw_line(21, 74, 18, DARKBLUE, 0);
  draw_line(12, 91, 10, DARKBLUE, 1);

  //Lower box below box off left corner
  draw_line(31, 14, 12, DARKBLUE, 0);
  draw_line(31, 14, 6, DARKBLUE, 1);
  draw_line(36, 14, 12, DARKBLUE, 0);
  draw_line(31, 25, 6, DARKBLUE, 1);

  //Lower box below box off right corner
  draw_line(31, 102, 12, DARKBLUE, 0);
  draw_line(31, 102, 6, DARKBLUE, 1);
  draw_line(36, 102, 12, DARKBLUE, 0);
  draw_line(31, 113, 6, DARKBLUE, 1);


  //Top center line
  draw_line(2, 64, 20, DARKBLUE, 1);

  //Left Wall
  draw_line(2, 4, 45, DARKBLUE, 1);

  draw_line(78, 4, 44, DARKBLUE, 1);

  draw_line(98, 4, 10, DARKBLUE, 0);
 
  //Bottom Wall
  draw_line(121, 4, 120, DARKBLUE, 0);

  //Right Wall
  draw_line(2, 123, 45, DARKBLUE, 1);
  draw_line(78, 123, 44, DARKBLUE, 1);
  
  draw_line(98, 114, 10, DARKBLUE, 0);


  //Left wall gap top 
  draw_line(55, 0, 28, DARKBLUE, 0);
  draw_line(46, 27, 10, DARKBLUE, 1);
 
  draw_line(46, 0, 28, DARKBLUE, 0);

  draw_line(33, 40, 23, DARKBLUE, 1);

  //Top left near box horizontal line
  draw_line(43, 40, 13, DARKBLUE, 0);

  //Top right near box horizontal line
  draw_line(43, 75, 13, DARKBLUE, 0);

  //Middle line above box
  draw_line(31, 64, 10, DARKBLUE, 1);

  //Horizontal line above box
  draw_line(31, 50, 28, DARKBLUE, 0);

  //Left wall gap bottom
  draw_line(68, 0, 28, DARKBLUE, 0);
  draw_line(68, 27, 10, DARKBLUE, 1);
  draw_line(78, 0, 28, DARKBLUE, 0);
  draw_line(68, 40, 10, DARKBLUE, 1);

  //Right wall gap top
  draw_line(55, 100, 28, DARKBLUE, 0);
  draw_line(46, 100, 10, DARKBLUE, 1);
  draw_line(33, 87, 23, DARKBLUE, 1);
  draw_line(46, 100, 28, DARKBLUE, 0);

  //Right wall gap bottom
  draw_line(68, 100, 28, DARKBLUE, 0);
  draw_line(68, 100, 10, DARKBLUE, 1);
  draw_line(78, 100, 28, DARKBLUE, 0);
  draw_line(68, 87, 10, DARKBLUE, 1);

  //Off left wall L
  draw_line(88, 14, 11, DARKBLUE, 0);
  draw_line(88, 24, 13, DARKBLUE, 1);

  //Off right wall L
  draw_line(88, 103, 11, DARKBLUE, 0);
  draw_line(88, 103, 13, DARKBLUE, 1);

  //Lowest Middle Line
  draw_line(100, 64, 11, DARKBLUE, 1);

  //Bottom right L vertical line
  draw_line(90, 92, 21, DARKBLUE, 1);
  draw_line(89, 75, 18, DARKBLUE, 0);

  //Bottom left L vertical Line
  draw_line(90, 35, 21, DARKBLUE, 1);
  draw_line(89, 35, 18, DARKBLUE, 0);

  draw_line(100, 46, 36, DARKBLUE, 0);

  draw_line(110, 14, 39, DARKBLUE, 0);

  draw_line(110, 76, 39, DARKBLUE, 0);

  //Second Middle Line
  draw_line(80, 64, 10, DARKBLUE, 1);
  draw_line(80, 52, 24, DARKBLUE, 0);

  //Box in middle
  draw_line(67, 50, 27, DARKBLUE, 0);
  draw_line(53, 50, 27, DARKBLUE, 0);
  draw_line(53, 59, 10, WHITE, 0);
  draw_line(53, 50, 15, DARKBLUE, 1);
  draw_line(53, 76, 15, DARKBLUE, 1);

}


// This function creates all the dots at the start of the game
// Do not edit this
void create_dots() {
  j = 0;
  for (i = 47; i < 78; i = i + 10) {
    dotsy[j] = i;
    dotsx[j] = 96;
    j++;
  }

  for (i = 47; i < 78; i = i + 10) {
    dotsy[j] = i;
    dotsx[j] = 33;
    j++;
  }

  for (i = 8; i < 63; i = i + 10)  {
    dotsy[j] = 7;
    dotsx[j] = i;
    j++;
  }

  for (i = 66; i < 123; i = i + 10) {
    dotsy[j] = 7;
    dotsx[j] = i;
    j++;
  }

  for (i = 46; i < 63; i = i + 10) {
    dotsy[j] = 36;
    dotsx[j] = i;
    j++;
  }

  for (i = 69; i < 87; i = i + 10) {
    dotsy[j] = 36;
    dotsx[j] = i;
    j++;
  }

  for (i = 8; i < 40; i = i + 10)  {
    dotsy[j] = 42;
    dotsx[j] = i;
    j++;
  }

  for (i = 89; i < 123; i = i + 10) {
    dotsy[j] = 42;
    dotsx[j] = i;
    j++;
  }

  for (i = 8; i < 63; i = i + 10)  {
    dotsy[j] = 26;
    dotsx[j] = i;
    j++;
  }

  for (i = 66; i < 123; i = i + 10) {
    dotsy[j] = 26;
    dotsx[j] = i;
    j++;
  }

  for (i = 8; i < 63; i = i + 10)  {
    dotsy[j] = 116;
    dotsx[j] = i;
    j++;
  }

  for (i = 66; i < 123; i = i + 10) {
    dotsy[j] = 116;
    dotsx[j] = i;
    j++;
  }


  for (i = 8; i < 63; i = i + 10) {
    dotsy[j] = 84;
    dotsx[j] = i;
    j++;
  }

  for (i = 66; i < 123; i = i + 10) {
    dotsy[j] = 84;
    dotsx[j] = i;
    j++;
  }

  for (i = 8; i < 63; i = i + 10) {
    dotsy[j] = 105;
    dotsx[j] = i;
    j++;
  }

  for (i = 66; i < 123; i = i + 10) {
    dotsy[j] = 105;
    dotsx[j] = i;
    j++;
  }

  for (i = 8; i < 63; i = i + 10) {
    dotsy[j] = 95;
    dotsx[j] = i;
    j++;
  }

  for (i = 66; i < 123; i = i + 10) {
    dotsy[j] = 95;
    dotsx[j] = i;
    j++;
  }
}


void redraw () {
  /**
     Redraw is the crux of this assignment. Since redrawing the board every single time pacman or the ghosts move would be inefficient
     You must use Pacman and the ghosts current and previous states to draw over their old states and draw their new states
     Finally, all of the dots must be drawn (making sure to check if the dot still exists or not).
  **/

  // YOUR CODE HERE
  for (i = 0; i < numdots; i++) {
        if (dotsy[i] != -1 && dotsx[i] != -1)
        lc4_draw_pixel(dotsy[i], dotsx[i], YELLOW);
  }  

  if (direction == UP && prevdirection == UP) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanup);
    lc4_draw_sprite(x, y, GOLD, pacmanup);
    }
  if (direction == UP && prevdirection == DOWN) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmandown);
    lc4_draw_sprite(x, y, GOLD, pacmanup);
    }  
  if (direction == UP && prevdirection == LEFT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanlt);
    lc4_draw_sprite(x, y, GOLD, pacmanup);
    }
  if (direction == UP && prevdirection == RIGHT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanrt);
    lc4_draw_sprite(x, y, GOLD, pacmanup);
    }  

  if (direction == DOWN && prevdirection == DOWN) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmandown);
    lc4_draw_sprite(x, y, GOLD, pacmandown);
  }
  if (direction == DOWN && prevdirection == UP) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanup);
    lc4_draw_sprite(x, y, GOLD, pacmandown);
  }
  if (direction == DOWN && prevdirection == LEFT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanlt);
    lc4_draw_sprite(x, y, GOLD, pacmandown);
  }
  if (direction == DOWN && prevdirection == RIGHT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanrt);
    lc4_draw_sprite(x, y, GOLD, pacmandown);
  }

  if (direction == LEFT && prevdirection == LEFT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanlt);
    lc4_draw_sprite(x, y, GOLD, pacmanlt);
  }
  if (direction == LEFT && prevdirection == RIGHT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanrt);
    lc4_draw_sprite(x, y, GOLD, pacmanlt);
  }
  if (direction == LEFT && prevdirection == UP) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanup);
    lc4_draw_sprite(x, y, GOLD, pacmanlt);
  }
  if (direction == LEFT && prevdirection == DOWN) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmandown);
    lc4_draw_sprite(x, y, GOLD, pacmanlt);
  }

  if (direction == RIGHT && prevdirection == RIGHT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanrt);
    lc4_draw_sprite(x, y, GOLD, pacmanrt);
  }
  if (direction == RIGHT && prevdirection == LEFT) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanlt);
    lc4_draw_sprite(x, y, GOLD, pacmanrt);
  }
  if (direction == RIGHT && prevdirection == UP) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmanup);
    lc4_draw_sprite(x, y, GOLD, pacmanrt);
  }
  if (direction == RIGHT && prevdirection == DOWN) {
    lc4_draw_sprite(prevx, prevy, BLACK, pacmandown);
    lc4_draw_sprite(x, y, GOLD, pacmanrt);
  }

  for (i = 0; i < numghosts; i++) {
    lc4_draw_sprite(ghostsprevx[0], ghostsprevy[0], BLACK, ghost);
    lc4_draw_sprite(ghostsx[0], ghostsy[0], RED, ghost);
    lc4_draw_sprite(ghostsprevx[1], ghostsprevy[1], BLACK, ghost); 
    lc4_draw_sprite(ghostsx[1], ghostsy[1], GREEN, ghost);
  }

  // This code has been given to you, do not change it.
  prevx = x;
  prevy = y;
  prevdirection = direction;
  for (i = 0; i < numghosts; i++) {
    ghostsprevx[i] = ghostsx[i];
    ghostsprevy[i] = ghostsy[i];
  }
  draw_score();
}


// This function resets the game to its starting arrangement, this should not be touched.
void reset_game_state() {
  score = 0;
  prevx = -10;
  prevy = -10;

  direction = RIGHT;
  prevdirection = RIGHT;

  ghostsx[0] = 42;
  ghostsy[0] = 55;

  ghostsx[1] = 77;
  ghostsy[1] = 55;
  
  for (i = 0; i < numghosts; i++) {
    ghostsprevx[i] = -10;
    ghostsprevy[i] = -10;
  }
  ghostsdirection[0] = UP;
  ghostsdirection[1] = DOWN;
  colors[0] = CYAN;
  colors[1] = RED;
  x = 60;
  y = 72;
  create_dots();
}


void choose_direction(int ghost) {

  /**
     choose_direction should choose the next direction the non random ghost goes
     whenver it hits a wall. This direction should be chosen based on where Pacman
     is relative to the ghost. If the ghost was moving in a vertical direction, when
     it hits a wall, it should now go in the direction that Pacman is relative to them
     (that is if Pacman is to the left or right of the ghost). Similarly,
     if the ghost hits the wall going horizontally, it should choose the vertical direction
     relative to Pacman
  **/

  // YOUR CODE HERE
  int pos_top = ghostsy[0];
  int pos_left = ghostsx[0];
  int pos_right = pos_left + 7;
  int pos_bottom = pos_top + 7;

  if (ghostsdirection[0] == UP) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_top - j >= 0 && validspace[pos_top - j][ghostsx[0] + i] == 1) {
            ghostsy[0] = pos_top - j + 1;
            ghostsdirection[0] = direction;
            return;
          }
      
      }
    }
    ghostsy[0] = ghostsy[0] - 4;
  }

  if (ghostsdirection[0] == DOWN) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_bottom + j < 124 && validspace[pos_bottom + j][ghostsx[0] + i] == 1) {
            ghostsy[0] = pos_bottom + j - 8;
            ghostsdirection[0] = direction;
            return;
          }
      
      }
    }
    ghostsy[0] = ghostsy[0] + 4;
  }

  if (ghostsdirection[0] == LEFT) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_left - j >= 0 && validspace[ghostsy[0] + i][pos_left - j] == 1) {
            ghostsx[0] = pos_left - j + 1;
            ghostsdirection[0] = direction;
            return;
          }
      
      }
    }
    ghostsx[0] = ghostsx[0] - 4;
  }

  if (ghostsdirection[0] == RIGHT) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_right + j < 128 && validspace[ghostsy[1] + i][pos_right + j] == 1) {
            ghostsx[0] = pos_right + j - 8;
            ghostsdirection[0] = direction;
            return;
          }
      
      }
    }
    ghostsx[0] = ghostsx[0] + 4;
  }

  if (ghostsx[0] + 7 < 2) {
    ghostsx[0] = 126;
    ghostsdirection[0] = LEFT;
    return; 
  } else if (ghostsx[0] > 126) {
    ghostsx[0] = 0 - 5;
    ghostsdirection[0] = RIGHT;
    return;
  }

}



void choose_direction_random(int ghost) {
  /**
     choose_direction_random works to pick the next direction that the random ghost goes, it should choose any direction
     so long as that direction is not the direction it was previously heading in when it hit the wall.

     Hint: how do the directions correspond to the values in define and how can we use mod 
     and random to simulate choosing one of those values
  **/

  // YOUR CODE HERE
  int pos_top = ghostsy[1];
  int pos_left = ghostsx[1];
  int pos_right = pos_left + 7;
  int pos_bottom = pos_top + 7;

  int random_number = rand16();
  int random_direction;

  if (ghostsdirection[1] == UP) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_top - j >= 0 && validspace[pos_top - j][ghostsx[1] + i] == 1) {
            ghostsy[1] = pos_top - j + 1;
              if (random_number > 24576) {
                random_number = rand16();
                random_direction = UP;
              } 
              if (random_number > 16383 && random_number < 24577) {
                random_number = rand16();
                random_direction = DOWN;
              }
              if (random_number > 8191 && random_number < 16384) {
                random_number = rand16();
                random_direction = LEFT; 
              }
              if (random_number >= 0 && random_number < 8192) {
                random_number = rand16();
                random_number = RIGHT;
              }
            ghostsdirection[1] = random_direction;
            return;
          }
      
      }
    }
    ghostsy[1] = ghostsy[1] - 4;
  }

  if (ghostsdirection[1] == DOWN) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_bottom + j < 124 && validspace[pos_bottom + j][ghostsx[1] + i] == 1) {
            ghostsy[1] = pos_bottom + j - 8;
              if (random_number > 24576) {
                random_number = rand16();
                random_direction = UP;
              } 
              if (random_number > 16383 && random_number < 24577) {
                random_number = rand16();
                random_direction = DOWN;
              }
              if (random_number > 8191 && random_number < 16384) {
                random_number = rand16();
                random_direction = LEFT; 
              }
              if (random_number >= 0 && random_number < 8192) {
                random_number = rand16();
                random_number = RIGHT;
              }
            
            ghostsdirection[1] = random_direction;
            return;
          }
      
      }
    }
    ghostsy[1] = ghostsy[1] + 4;
  }

  if (ghostsdirection[1] == LEFT) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_left - j >= 0 && validspace[ghostsy[1] + i][pos_left - j] == 1) {
            ghostsx[1] = pos_left - j + 1;
              if (random_number > 24576) {
                random_number = rand16();
                random_direction = UP;
              } 
              if (random_number > 16383 && random_number < 24577) {
                random_number = rand16();
                random_direction = DOWN;
              }
              if (random_number > 8191 && random_number < 16384) {
                random_number = rand16();
                random_direction = LEFT; 
              }
              if (random_number >= 0 && random_number < 8192) {
                random_number = rand16();
                random_number = RIGHT;
              }
            
            ghostsdirection[1] = random_direction;
            return;
          }
      
      }
    }
    ghostsx[1] = ghostsx[1] - 4;
  }

  if (ghostsdirection[1] == RIGHT) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
          if (pos_right + j < 128 && validspace[ghostsy[1] + i][pos_right + j] == 1) {
            ghostsx[1] = pos_right + j - 8;
              if (random_number > 24576) {
                random_number = rand16();
                random_direction = UP;
              } 
              if (random_number > 16383 && random_number < 24577) {
                random_number = rand16();
                random_direction = DOWN;
              }
              if (random_number > 8191 && random_number < 16384) {
                random_number = rand16();
                random_direction = LEFT; 
              }
              if (random_number >= 0 && random_number < 8192) {
                random_number = rand16();
                random_number = RIGHT;
              }
              
            
            ghostsdirection[1] = random_direction;
            return;
          }
      
      }
    }
    ghostsx[1] = ghostsx[1] + 4;
  }

  if (ghostsx[1] + 7 < 2) {
    ghostsx[1] = 126;
    ghostsdirection[1] = LEFT;
    return; 
  } else if (ghostsx[1] > 126) {
    ghostsx[1] = 0 - 5;
    ghostsdirection[1] = RIGHT;
    return;
  }
  
}




void move_ghost(int ghostnumb, int is_random) {
  /**
     move_ghost should behave exactly like move_pacman (study it and make sure you understand it)
     the ghosts should constantly try to move in a direction corresponding to their current direction
     if they hit a wall however, unlike pacman, you must choose a new direction for them
     if is_random is true, then choose_direction_random should be called, otherwise
     the normal choose_direction should be called
  **/

  // YOUR CODE HERE
  if (is_random) {
    choose_direction_random(ghostnumb);
  } else {
    choose_direction(ghostnumb);
  }

}


// This code moves pacman, by checking the direction he should move
// And then checking if he is going to hit a wall, if he will
// His position is put so that he doesn't hit the wall, but is just touching it
// Otherwise, he moves 4 pixels in the direction he wants to go.
void move_pacman(int direction) {
  top = y;
  left = x;
  right = x + 7;
  bottom = y + 7;

  /**
     This code checks which direction pacman is heading, and then checks all the pixels above him that he could move to
     If any part of pacman is hitting a wall, or will hit a wall, pacman's y coordinate is set to be one pixel below the wall
     The validspace array represents if a pixel is a wall or not, and using this, one can determine if pacman is hitting the wall
     This is a double for loop, as it scans from the top of pacman out, first checking that no pixel directly in front of any part of 
     pacman is a wall (the inner loop iterates entirely over pacmans top row). Then checking if any pixel two pixels away is a wall,
     and so on. 
     The logic is exactly the same for the other three directions, except that different parts of pacman are scanned first, and 
     different directions relative to pacman are scanned. 
  **/

  if (direction == UP) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
	if (top - j >= 0 && validspace[top - j][x + i] == 1) {
          y = top - j + 1;
          // x = x;
          return;
	}
      }
    }
    y = y - 4;
  }
  if (direction == RIGHT) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
	if (right + j < 128 && validspace[y + i][right + j] == 1) {
          x = right + j - 8;
          // y = y;
          return;
	}
      }
    }
    x = x + 4;
  }
  
  if (direction == LEFT) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
	if (left - j >= 0 && validspace[y + i][left - j] == 1) {
          x = left - j + 1;
          // y = y;
          return;
	}
      }
    }
    x = x - 4;
  }

  if (direction == DOWN) {
    for (j = 1; j < 5; j++) {
      for (i = 0; i < 8; i++) {
	if (bottom + j < 124 && validspace[bottom + j][x + i] == 1) {
          y = bottom + j - 8;
          // x = x;
          return;
	}
      }
    }
    y = y + 4;
  }
  if (x + 7 < 2) {
    x = 126;
    direction = LEFT;
    return; 
  } else if (x > 126) {
    x = 0 - 5;
    direction = RIGHT;
    return;
  }
}

int playerhit() {
  /**
     playerhit checks if either ghost is overlapping with pacman
     if it is, it returns 1, else it should return false
  **/
  for (i = 0; i < numghosts; i++) {
    if(x <= ghostsx[i] && (x + 7 >= ghostsx[i])) {
      if (y <= ghostsy[i] && (y + 7 >= ghostsy[i])) {
        return 1;
      } else if (ghostsy[i] <= y && (ghostsy[i] + 7 >= y)) {
        return 1;
      }
    } else if (ghostsx[i] <= x && (ghostsx[i] + 7 >= x)) {
      if (y <= ghostsy[i] && (y + 7 >= ghostsy[i])) {
        return 1;
      } else if (ghostsy[i] <= y && (ghostsy[i] + 7 >= y)) {
        return 1;
      }
    }
  }
  return 0;
}

// If pacman has overlapped with a dot, it is eaten and the score is increased
// Furthermore, the dots array now holds this dot as a negative point
void eat_dot() {
  for (i = 0; i < numdots; i++) {
    if (x <= dotsx[i] && x + 7 >= dotsx[i]) {
      if (y <= dotsy[i] && y + 7 >= dotsy[i]) {
	dotsx[i] = -1;
	dotsy[i] = -1;
	score = score + 1;
	printnum();
      }
    }
  }
}

int main () {

  // Draws the board
  draw_grid();

  lc4_puts ((lc4uint*)"Press t to start\n");

  // Sit and wait for an "t"
  while(lc4_getc_timer(timer_speed) != 't');

  lc4_puts ((lc4uint*)"Use a to move left, s to down, d to move right, w to move up, try to collect all the pellets before being hit by a ghost\n");
    
  // Initialize game state
  draw_score();
  reset_game_state();
  redraw();
  printnum();
  // Main loop

  while (playerhit() == 0 && score != numdots) {

    c = lc4_getc_timer(timer_speed);
    if (c == 119) { //w
      direction = UP;
    } else if (c == 97) { //a
      direction = LEFT;
    } else if (c == 115) { //s
      direction = DOWN;
    } else if (c == 100) { //d
      direction = RIGHT;
    }
    move_pacman(direction);
      
    move_ghost(0, FALSE);
    move_ghost(1, TRUE);

    eat_dot();

    // Redraw the game
    redraw();

  }
  if (score == numdots) {
    lc4_puts((lc4uint*)"You Win");
  } else {
    lc4_puts((lc4uint*)"You Lose");
  }

  return 0;
}
