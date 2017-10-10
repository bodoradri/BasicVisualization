class Graph {
  String title;
  int x;
  int y;
  int w;
  int h;
  int length;
  float minValue;
  float maxValue;
  float bandWidth;
  FloatList data;
  int titleWidth;

  Graph(String title_, int x_, int y_, int w_, int h_, int length_, float minValue_, float maxValue_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    titleWidth = 100;
    minValue = minValue_;
    maxValue = maxValue_;
    bandWidth = maxValue - minValue;
    data = new FloatList();
    for (int i = 0; i < length_; i++) {
      data.append(minValue + bandWidth / 2);
    }
    title = title_;
  }

  void addValue(float value) {
    data.remove(0);
    data.append(value);
  }

  void draw() {
    fill(255);
    strokeWeight(4);
    rect(x, y, w, h);
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(26);
    text(title, x - titleWidth, y + h / 2);
    strokeWeight(2);
    for (int i = 1; i < data.size(); i++) {
      float x1 = x + (float(i) - 1) * (float(w) / float(data.size() - 1));
      float y1 = y + h - (float(h) / bandWidth) * (data.get(i - 1) - minValue);
      float x2 = x + float(i) * (float(w) / (float(data.size() - 1)));
      float y2 = y + h - (float(h) / bandWidth) * (data.get(i) - minValue);
      line(x1, y1, x2, y2);
    }
  }
}