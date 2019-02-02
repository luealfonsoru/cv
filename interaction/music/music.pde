import frames.primitives.*;
import frames.core.*;
import frames.processing.*;
import processing.sound.*;

FFT fft;
FFT fft2;
AudioIn in;
SoundFile song;
int bands = 512;
float[] spectrum = new float[bands];
float[] spectrum2 = new float[bands];
int mode = 0; 

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
  fft2 = new FFT(this, bands);
  in = new AudioIn(this, 0);
  song = new SoundFile(this, "song.mp3");
  
  // start the Audio Input
  in.start();
 
  if(mode == 1){
    song.loop();
    song.rate(1.1);
  }
  // patch the AudioIn
  fft.input(in);
  fft2.input(song);

}

void draw(){
  background(0);
  if(mode == 0){
    fft.analyze(spectrum);
  }else{
    fft2.analyze(spectrum);
  }
  
  ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, 0, 1, -100);
    for(int i = 0; i < bands/4; i++){
      fastft[0][i] = -spectrum[i]*1000;
      fastft[1][i] = -spectrum[i+bands/4]*1000;
      fastft[2][i] = fastft[0][i];
    }  
  
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
