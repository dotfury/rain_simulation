class Ring {
  PVector position;
  
  float radius;
  
  Ring(PVector _position) {
    position = _position;
    radius = 1;
  }
  
  void update() {
     radius += 0.1;
  }
  
  void display() {
    noFill();
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    ellipse(0, 0, round(radius), round(radius));
    popMatrix();
  }
}
