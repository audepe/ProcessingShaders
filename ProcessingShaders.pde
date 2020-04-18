import processing.video.*;

PShader sh;
Capture cap;

void setup() {
  size(640, 360, P3D);
  
  sh = loadShader("crt-effect.glsl");
  cap = new Capture(this, width, height);
  cap.start();
}

void draw() {
  if (mousePressed)
      shader(sh);
  else
      resetShader();
  
  if (cap.available() == true) {
    cap.read();
  }
  image(cap, 0, 0);
}
