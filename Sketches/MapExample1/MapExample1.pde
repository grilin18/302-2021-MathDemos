void setup(){
  size(500,500);
}

void draw(){
  background(128);
  
  float size = mappy(mouseX, 0, width, 50, 300);
  
  ellipse(width/2, height/2, size, size);
}

float lerpy(float min, float max, float p){
  return lerpy(min, max, p, true);
}

float lerpy(float min, float max, float p, boolean allowExtrapolation){
  
  if(allowExtrapolation == false){
    if (p < 0) p = 0;
    if (p > 1) p = 1;
  }
  
  
  return min + (max - min) * p;
}

float mappy(float inVal, float inMin, float inMax, float outMin, float outMax){
  float p = (inVal - inMin) / (inMax - inMin);
  
  return lerpy(outMin, outMax, p);
}
