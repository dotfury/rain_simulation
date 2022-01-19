class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  int lifeTime;
  
  Particle(PVector _position) {
    position = _position;
    acceleration = new PVector();
    velocity = new PVector(random(-0.2, 0.2), random(-0.2, -0.5), random(-0.2, 0.2));
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    applyForce(gravity);
    
    velocity.add(acceleration);
    position.add(velocity);
    
    acceleration.mult(0);
  }
  
  void display() {
    stroke(150, 150, 255, 50);
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    ellipse(0, 0, 1, 1);
    popMatrix();
  }
}
