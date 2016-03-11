class Ripple implements canUpdate, canDisplay {
  private int max_age;
  private int age;
  private boolean finished;
  private float position_x;
  private float position_y;
  
  Ripple(float x, float y) {
    position_x = x;
    position_y = y;
    max_age = 120;
    age = 1;
    finished = false;
  }
  
  boolean finished() {
    return finished;
  }
  
  void update() {
    age += 1;
    if (age >= max_age) {
      finished = true;
    }
  }
  
  void display() {
    float perspective = 0.2;
    float ripple_speed = ((float)age / max_age) * 1000;
    int brightness = (int)((1.0 - (float)age / max_age) * 120);
    stroke(brightness);
    ellipse(position_x, position_y, ripple_speed, ripple_speed * perspective, 200);
  }
}