int dropCount = 500;

PVector gravity;
PVector wind;

Drop[] drops = new Drop[dropCount];

void setup() {
  size(600, 600, P3D);
  strokeWeight(1);
  
  gravity = new PVector(0, 0.01, 0);
  wind = new PVector(0, 0, 0);
  
  for (int i = 0; i < dropCount; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(30);
  
  wind = new PVector(map(mouseX, 0, width, -0.03, 0.03), 0, map(mouseY, 0, height, -0.02, 0.02));
  
  for (Drop drop : drops) {
    drop.applyForce(gravity);
    drop.applyForce(wind);
    drop.update();
    drop.display();
  }
  
  //saveFrame("frame" + frameCount + ".png");
}
