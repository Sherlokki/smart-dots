class Obstacle {
    PVector location;  // Location of shape
    PVector velocity;  // Velocity of shape
    PVector gravity;   // Gravity acts at the shape's acceleration
    
    void setup(float startLocationX, float startLocationY, float startVelocityX, float startVelocityY) {
        location = new PVector(startLocationX, startLocationY);
        velocity = new PVector(startVelocityX, startVelocityY);
    }
    
    void draw(int red, int green, int blue) {
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
        fill(red, green, blue);
        ellipse(location.x,location.y,44,44);
    }

    float getXLocation() {
        return location.x;
    }

    float getYLocation() {
        return location.y;
    }
}
