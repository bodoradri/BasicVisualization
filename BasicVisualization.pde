Graph ecg;
Graph co2;
Graph noise;
Heart heart;
Environment env;
float coord = 0;
String dataPath = "output.csv";
String[] lines;
int current_line;
int realStartTime;
int measurementStartTime;
float heartBeatTreshold = 555;
float previousPulse = 555;

void setup() {
  fullScreen();
  noise = new Graph("Noise", width / 2 - 500, 100, 1000, 150, 400, -30, 170);
  co2 = new Graph("CO2", width / 2 - 500, 250, 1000, 150, 200, 300, 600);
  ecg = new Graph("ECG", width / 2 - 500, 400, 1000, 150, 200, -10, 1034);
  heart = new Heart("BPM", width / 2 - 100, 570, 200, 200);
  env = new Environment(width / 2, 800);
  lines = loadStrings(dataPath);
  current_line = 0;
  float[] columns = float(split(lines[current_line], ','));
  realStartTime = millis();
  measurementStartTime = int(columns[0]);
}

void draw() {
  boolean was_change = false;
  int realTime = millis() - realStartTime;
  float[] columns = float(split(lines[current_line], ','));
  int measurementTime = int(columns[0]) - measurementStartTime;
  while (realTime > measurementTime) {
    current_line++;
    was_change = true;
    if (current_line == lines.length) {
      exit();
      return;
    }
    columns = float(split(lines[current_line], ','));
    measurementTime = int(columns[0]) - measurementStartTime;
  }
  if (!was_change) return;
  heart.setBPM(columns[7]);
  float pulse = columns[6];
  if (previousPulse < heartBeatTreshold && pulse > heartBeatTreshold) {
    heart.heartBeat();
  }
  background(255);
  env.setValue(columns[3], columns[4]);
  env.draw();
  heart.draw();
  noise.addValue(columns[5] * random(1));
  noise.addValue(columns[5] * random(1));
  noise.draw();
  co2.addValue(columns[1]);
  co2.draw();
  ecg.addValue(columns[6]);
  ecg.draw();
  previousPulse = pulse;
}