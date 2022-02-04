/**
 * COMP570 Programming for Creativity 2019 S1.
 * Assignment 2 - Start Code.
 *
 * This program draws two randomly sized and coloured ellipses that are randomly placed on a 500x500 canvas.
 * The generated balls move at a random direction at a random velocity set individually for each ball, and bounce around the edges of the canvas. 
 * When the two balls collide they stick together and move at a new velocity, and they bounce around the screen together.
 *@author: Leegan Te, Student ID# 16961403.
 */

//presets the word "white" as a colour setting.
color white = color(255);

// The Word "contact" is a word preset for setting up the True or False statement for when the two balls collide.
boolean contact = false;

//The name "aBall" is the name for the first of two balls that will be randomly generated.
BouncingBall aBall;  
BouncingBall bBall; // The name "bBall" is the name for the second of two balls that will be randomly generated.
 
void setup() { 
  size(500, 500); // // Sets up the window size.
  aBall = new BouncingBall(); // Generates a new aBall.
  bBall = new BouncingBall(); // Generates  a new aBall.
  smooth(); // Make the movement of the balls smoother on screen so it does not loook chunky as it is moving.
}
// Draws the instructed window sizes and balls.
  void draw() {

  background(white); // Sets background to the colour white.
  aBall.render(); //aBall render.
  aBall.update(); //aBall updated coordinate.
  bBall.render(); //bBall render.
  bBall.update(); //bBall updated coordinate.
 
  //A True or False statement that checks the two generated balls eery time they move if they collide or not.
  // If statement is True the two balls collide the edges that collide will stick together.
  if ( dist(aBall.x, aBall.y, bBall.x, bBall.y) <= aBall.r + bBall.r) {
    contact = true;
    float averagedx = (aBall.dx + bBall.dx) / 2;
    float averagedy = (aBall.dy + bBall.dy) / 2;
    aBall.dx = averagedx;
    aBall.dy = averagedy;
    bBall.dx = averagedx;
    bBall.dy = averagedy;
  }
 //The equations for making the two randomly generated balls move and bounce from edges of the 300x300 window. 
 // Equation for aBall 
   if (aBall.x - aBall.r <= 0 || aBall.x + aBall.r >= width -1) {  // If statement for the horizontal movement of aBall.
    aBall.dx = -aBall.dx;
    if (contact) { //When the two balls touch, their velocities are the same
      bBall.dx = -bBall.dx;
    }
  }

 // Equation for bBall 
  if (aBall.y - aBall.r <= 0 || aBall.y + aBall.r >= height - 1) { // if statement for the vertical movement of aBall.
    aBall.dy = -aBall.dy;
    if (contact) { // When teh two balls touch, th two vellocities are the same
      bBall.dy = -bBall.dy;
    }
  }

  if (bBall.x - bBall.r <= 0 || bBall.x + bBall.r >= width -1) { // If statement for the horizontal direction of bBall.
    bBall.dx = -bBall.dx;
    if (contact) {
      aBall.dx = -aBall.dx;
    }
  }

  if (bBall.y - bBall.r <= 0 || bBall.y + bBall.r >= height - 1) { // If statement for the vertical direction of bBall.
    bBall.dy = -bBall.dy;
    if (contact) {
      aBall.dy = -aBall.dy;
    }
  }
}
