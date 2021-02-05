void setup() {
  size(500, 500);
}

void draw() {
  background(128);

  float p = millis() / 2000f;
  float size = lerpy(50, 300, p);

  fill(p * 255);
  ellipse(width/2, height/2, size, size);
}

// Lerp functions (with overloading)
float lerpy(float min, float max, float p) {
  return lerpy(min, max, p, true);
}

float lerpy(float min, float max, float p, boolean allowExtrapolation) {
  if (!allowExtrapolation) {
    if (p > 1) p = 1;
    if (p < 0) p = 0;
  }

  float range = max - min;
  float offset = range * p;

  return min + offset;
  // return min + (max - min) * p;
}
