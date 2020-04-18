import processing.video.*;

PShader sh;
Capture cap;

void setup() {
  size(1280, 720, P3D);
  
  sh = loadShader("crt-effect.glsl");
  sh.set("iResolution", float(width), float(height));
  
  cap = new Capture(this, width, height);
  cap.start();
}

void draw() {  
  
  sh.set("iGlobalTime", millis() / 1000.0);
  
  if (cap.available() == true) {
    cap.read();
  }
  image(cap, 0, 0);
  
  
  if (mousePressed)
      filter(sh);
  else
      resetShader();
}
