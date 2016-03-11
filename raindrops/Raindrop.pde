class Raindrop implements canUpdate, canDisplay {
  private float position_x;
  private float position_y;
  private boolean finished;
  
  Raindrop(float x, float y) {
    position_x = x;
    position_y = y;
  }
  
  float getPositionX() {
    return position_x;
  }
  
  float getPositionY() {
    return position_y;
  }
  
  boolean finished() {
    return finished;
  }
  
  void update() {
    position_y += 15;
  }
  
  void display() {
    stroke(255);
    line(position_x, position_y, position_x, position_y + 10); 
  }
}