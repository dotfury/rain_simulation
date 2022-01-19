class Drop {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float dropLength;
  
  boolean collided;
  
  Collision collision;
  
  Drop() {
    position = new PVector(random(width), random(-200, height), random(-20, 20));
    velocity = new PVector(0, map(position.z, -10, 20, 8, 12), 0);
    acceleration = new PVector(0, 0, 0);
    dropLength = map(position.z, 0, 20, 10, 16);
    collided = false;
  }
  
  void checkEdges() {
    if (position.y > height) {
      collided = true;
      collision = new Collision(position.copy());
    }
  }
  
  void resetDrop() {
    position = new PVector(random(width), random(-100, -200), random(-20, 20));
    velocity = new PVector(0, map(position.z, -10, 20, 8, 12), 0);
    acceleration = new PVector(0, 0, 0);
    dropLength = map(position.z, 0, 20, 10, 16);
    collided = false;
    collision = null;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    if (!collided) {
      velocity.add(acceleration);
      position.add(velocity);
      checkEdges();
    
      acceleration.mult(0);
    }
  }
  
  void display() {
    if (collided) {
      if (collision.dead()) {
        resetDrop();
      } else {
        collision.update();
        collision.display();
      }
    } else {
      stroke(150, 150, 255, map(position.z, 0, 20, 150, 255));
    
      pushMatrix();
      translate(position.x, position.y, position.z);
      line(0, 0, 0, dropLength);
      popMatrix();
    }
  }
}
