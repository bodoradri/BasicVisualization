class Heart {
  int heartBeatTime;
  PImage img;
  String title;
  float bpm;
  String caption;
  int x;
  int y;
  int w;
  int h;
  
  Heart(String title_, int x_, int y_, int w_, int h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    bpm = 0;
    title = title_;
    caption = title + ": 0.0";
    img = loadImage("The-heart.png");
    heartBeatTime = millis();
  }
  
  void heartBeat() {
    heartBeatTime = millis();
  }
  
  void setBPM(float bpm_) {
    bpm = bpm_;
    caption = title + ": " + nf(bpm, 2, 2);
  }
  
  void draw() {
    int opacity = int((millis() - heartBeatTime) / 1000.0 * 255);
    tint(255, 256 - opacity);
    image(img, x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(26);
    text(caption, x + w / 2, y + h / 2 - 20);

  }
}