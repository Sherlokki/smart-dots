class Rectangle {
  PVector location;  // Location of shape
  PVector velocity;  // Velocity of shape
  PVector gravity;   // Gravity acts at the shape's acceleration
  float startLocationX = 544;
  float startLocationY = 22;
  
  void setup() {
    location = new PVector(startLocationX,startLocationY);
    velocity = new PVector(0,3.1);
    gravity = new PVector(0,0.2);
  }
  
  void draw() {    
    // Add velocity to the location.
    location.add(velocity);
    // Add gravity to velocity
    velocity.add(gravity);
    
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
    if (location.x < 600 && location.y < 200 && location.x > 0 && location.y > 250) {
        velocity.y = velocity.y * -0.95; 
        location.y = 300;
    }
  
    // Display circle at location vector
    strokeWeight(2);
    ellipse(location.x,location.y,44,44);
  }

  float getXLocation() {
    return location.x;
  }

  float getYLocation() {
    return location.y;
  }
}
