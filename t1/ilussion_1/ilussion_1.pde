//PShape s;
PGraphics shapes;
int frame = 0;
int rotation = 0;

void setup() {
  size(640, 360, P3D);
  noStroke();
  //s = loadShape("Tree.obj");
  shapes = createGraphics(width,height,P3D);
  frameRate(60);
}

void draw() {
  
  background(0);
  drawShapes();
  image(shapes,0,0);
}

void drawShapes(){
  shapes.beginDraw();
  shapes.lights();
  shapes.background(0);
  float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/4;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  float Z1 = cameraZ/10.0;
  float Z2 = cameraZ*10.0;
  if (mousePressed) {
    Z1 = cameraZ*10.0;
    Z2 = cameraZ/10.0;
  }
  shapes.perspective(fov, aspect, Z1, Z2);
  shapes.translate(width/2, height/2,0);
  shapes.rotateX(-PI*rotation/12);
  shapes.rotateY(-PI/3 -frame/float(height) * PI);
  shapes.noStroke();
  shapes.box(45);
  shapes.translate(0, 0, -50);
  shapes.box(30);
  //shapes.shape(s, 0, 0); 
  shapes.endDraw();
  frame = frame+2;
}

  void keyReleased(){
    if (key == 'r'){
      rotation = rotation + 1;
    }
  }
