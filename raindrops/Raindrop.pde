class Raindrop {
  private float position_x;
  private float position_y;
  private float position_z;
  private int age;
  private boolean finished;
  
  Raindrop(float x, float y, float z) {
    position_x = x;
    position_y = y;
    position_z = z;
  }
  
  boolean finished() {
    return finished;
  }
  
  void update() {
    if (finished != true) {
      age += 1;
      position_y += 10;
    }
    if (position_y >= 500) {
      finished = true;
    }
  }
  
  void display() {
    stroke(255);
    line(position_x, position_y, position_x, position_y + 10); 
  }
}