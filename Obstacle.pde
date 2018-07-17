class Obstacle {
  PVector location;  // Location of shape
  PVector velocity;  // Velocity of shape
  PVector gravity;   // Gravity acts at the shape's acceleration
  float startLocationY;
  float startLocationX;
  float startVelocityX;
  float startVelocityY;
  Boolean firstSetup = true;
  
  void setup() {
    if (firstSetup) {
      location = new PVector(setXPosition(),setYPosition());
      velocity = new PVector(setStartVelocityX(), setStartVelocityY());
      firstSetup = false;
    } else {
      location = new PVector(startLocationX, startLocationY);
      velocity = new PVector(startVelocityX, startVelocityY);
    }
  }
  
  void draw() {    
    // Add velocity to the location.
    location.add(velocity);
    // Add gravity to velocity
    // velocity.add(gravity);
    
    // Bounce off edges
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if (location.y > height) {
      // We're reducing velocity ever so slightly 
      // when it hits the bottom of the window
      velocity.y = velocity.y * -0.95; 
      location.y = height;
    }
  
    // Display circle at location vector
    strokeWeight(2);
    //draw obstacle(s)
    fill(0, 255, 0);
    ellipse(location.x,location.y,44,44);
  }

  float getXLocation() {
    return location.x;
  }

  float getYLocation() {
    return location.y;
  }

  float setXPosition() {
    startLocationX = random(800);
    return startLocationX;
  }

  float setYPosition() {
    startLocationY = random(500);
    return startLocationY;
  }

  float setStartVelocityX() {
    if (random(2) > 1) {
      startVelocityX = random(3);      
    } else {
      startVelocityX = -1 * random(3);      
    }
    return startVelocityX;
  }

  float setStartVelocityY() {
    startVelocityY = random(3);
    return startVelocityY;
  }
}
