import java.util.Random;

class Scene {
  private ArrayList<Raindrop> raindrops;
  private ArrayList<Ripple> ripples;
  private int time_since_last_raindrop;
  private int time_until_next_raindrop;
  private int new_raindrop_min_time;
  private int new_raindrop_max_time;
  
  Scene() {
    raindrops = new ArrayList<Raindrop>();
    ripples = new ArrayList<Ripple>();
    new_raindrop_min_time = 1;
    new_raindrop_max_time = 60;
    time_since_last_raindrop = 0;
    time_until_next_raindrop = 0;
  }
  
  void update() {
    doInteractions();
    updateList(raindrops);
    updateList(ripples);
    time_since_last_raindrop += 1;
    if (needNewRaindrop()) {
      addRaindrop();
    }
  }
  
  void display() {
    displayList(raindrops);
    displayList(ripples);
  }
  
  boolean needNewRaindrop() {
    return (time_since_last_raindrop >= time_until_next_raindrop);
  }
  
  void addRaindrop() {
    time_since_last_raindrop = 0;
    time_until_next_raindrop = new_raindrop_min_time + (int)(Math.random() * (new_raindrop_max_time - new_raindrop_min_time));
    int new_x_pos = (int)(Math.random() * 800);
    Raindrop raindrop_to_add = new Raindrop(new_x_pos, 0);
    raindrops.add(raindrop_to_add);
  }
  
  void addRippleAtPosition(float x, float y) {
    Ripple ripple_to_add = new Ripple(x, y);
    ripples.add(ripple_to_add);
  }
  
  void doInteractions() {
    for (int x = 0; x < raindrops.size(); x++) {
      Raindrop a_raindrop = raindrops.get(x);
      if (a_raindrop.getPositionY() >= 500) {
        addRippleAtPosition(a_raindrop.getPositionX(), a_raindrop.getPositionY());
        raindrops.remove(x);
      }
    }
    for (int x = 0; x < ripples.size(); x++) {
      Ripple a_ripple = ripples.get(x);
      if (a_ripple.finished()) {
        ripples.remove(x);
      }
    }
  }
  
  void updateList(ArrayList<? extends canUpdate> theList) {
    for (int x = 0; x < theList.size(); x++) {
      theList.get(x).update();
    }
  }
  
  void displayList(ArrayList<? extends canDisplay> theList) {
    for (int x = 0; x < theList.size(); x++) {
      theList.get(x).display();
    }
  }
  
}