class Collision {
  PVector position;
  
  ArrayList<Particle> particles;
  
  Ring ring;
  
  int particleCount;
  int lifeTime;
  
  Collision (PVector _position) {
    position = _position;
    particles = new ArrayList<Particle>();
    particleCount = round(random(1, 2));
    lifeTime = round(random(15, 20));
    ring = new Ring(position.copy());
    
    for (int i = 0; i < particleCount; i++) {
      particles.add(new Particle(position.copy()));
    }
  }
  
  boolean dead() {
    return lifeTime <= 0;
  }
  
  void update() {
    this.lifeTime--;
    
    ring.update();
    
    for (Particle particle : particles) {
      particle.update();
    }
  }
  
  void display() {
    ring.display();
    
    for (Particle particle : particles) {
      particle.display();
    }
  }
}
