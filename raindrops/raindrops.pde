Vst vst;
Scene theScene;

void settings() {
  size(800, 600, P2D);
  pixelDensity(displayDensity());
}

void setup() {
  frameRate(50);
  vst = new Vst(this, createSerial());
  theScene = new Scene();
}

void draw() {
  background(0);
  theScene.update();
  theScene.display();
  vst.display();
}