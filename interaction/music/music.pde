import frames.primitives.*;
import frames.core.*;
import frames.processing.*;
import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

Scene scene;
ArrayList<Line> lines;
float[][] fastft;

void setup(){
  size(800, 600, P3D);
  scene = new Scene(this);
  scene.fit();
  fastft = new float[3][bands/4];
  for(int i = 0; i < bands/4; i++){
    fastft[0][i] = 0;
    fastft[1][i] = 0;
    fastft[2][i] = 0;
  }
  lines = new ArrayList();
  lines.add(new Line(0));
  lines.add(new Line(1));
  lines.add(new Line(2));
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}

void draw(){
  background(0);
  fft.analyze(spectrum);
  ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, 0, 1, -100);
  for(int i = 0; i < bands/4; i++){
    fastft[0][i] = -spectrum[i]*1000;
    fastft[1][i] = -spectrum[i+bands/4]*1000;
    fastft[2][i] = fastft[0][i];
  }
  scene.traverse();  
}

void mouseDragged() {
  if (scene.eye().reference() == null)
    if (mouseButton == LEFT)
      // same as: scene.spin(scene.eye());
      scene.spin();
    else if (mouseButton == RIGHT)
      // same as: scene.translate(scene.eye());
      scene.translate();
    else
      scene.moveForward(mouseX - pmouseX);
}
