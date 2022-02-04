// A class for the two generated balls that creates
class BouncingBall
{
  float x, y; // A float for x and coordinates.
  float dx, dy; // A float for horizontal and vertical velocities.
  float r; // A flost for the ball radius.
  color ballColour; // A float for ball colour.
  
  BouncingBall()
  {
    r = random(10, 20); // Sets a random radius of a generated ball
    x = random(r,500-r); // Sets a random x coordinate of a generated ball.
    y = random(r,500-r); // Sets a random y coordinate of a generated ball.
    dx = random(-5.0, 5.0); // Sets a random horizontal velocity of a ball after being drawn between speeds -5 to 5 pixels.
    dy = random(-5.0, 5.0); // Sets a random vertical velocity of a ball after being drawn between speeds -5 to 5 pixels.
    ballColour = color((random(255)), (random(255)), (random(255))); // Sets a random colour fill for a generated ball.
  }
  

  
  void update()
  {
    x += dx;
    y += dy;
  }
  
  void render()
  {
    noStroke();
    smooth();
    fill(ballColour);
    ellipse (x, y, r*2, r*2);   
  }
}
