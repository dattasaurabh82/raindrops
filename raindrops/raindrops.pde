Vst vst;
Ripple r;
Raindrop rd;

void settings() {
  size(800, 600, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  frameRate(30);
  vst = new Vst(this, createSerial());
  
  r = new Ripple(400, 500);
  rd = new Raindrop(400, 0, 0);
}

void draw() {
  background(0);
  
  
  rd.update();
  if (!rd.finished()) {
    rd.display();
  }
  if (rd.finished()) {
    r.update();
    if (!r.finished()) {
      r.display();
    }
  }
  vst.display();
}