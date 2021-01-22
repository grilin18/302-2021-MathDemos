
float valStart =0;
float valEnd = 500;

float animLength = 5;
float animPlayHeadTime = 0;


void setup(){
  size(500, 500);

}

void draw(){
  background(128);
  
  animPlayHeadTime = millis()/1000.0;
  
  float p = animPlayHeadTime / animLength;
  
  float x = lerp(valStart, valEnd, p);
  ellipse(x, height/2.0, 20,20);

}
