class Environment {
  String title;
  int x;
  int y;

  Environment(int x_, int y_) {
    x = x_;
    y = y_;
  }
  
  void setValue(float temp, float humid) {
    title = "Temperature: " + int(temp) + "°C, Humidity: " + int(humid) + "%";
  }

  void draw() {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(26);
    text(title, x, y);
  }
}