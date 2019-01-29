float xr=400,yr=300,sx=1,sy=1,xf=500,yf=500,keyAceleration = 0, shearBeta = 1;
PShape s;
boolean keyUp, keyDown, keyLeft, keyRight, rotatingConter, rotatingClock;

void setup(){
  background(0);
  size(600,600);
  s = createShape(RECT, xf, yf, 50, 50);
  s.setFill(color(0,255,0));
}

void draw(){
  background(0);
  strokeWeight(4);
  noStroke();
  shape(s);
  stroke(0,0,255);
  point(xr,yr);
  if(keyUp == true){
    s.translate(0,- 2 - keyAceleration); 
  }
    if(keyDown == true){
    s.translate(0,2 + keyAceleration); 
  }
    if(keyRight == true){
    s.translate(2 + keyAceleration,0);
  }
    if(keyLeft == true){
    s.translate(- 2 - keyAceleration,0); 
  }
  if(rotatingConter == true){
    s.translate(xr,yr);
    s.rotate(-QUARTER_PI/40);
    s.translate(-xr,-yr);
  }
  if(rotatingClock == true){
    s.translate(xr,yr);
    s.rotate(QUARTER_PI/40);
    s.translate(-xr,-yr);
  }
}

void keyPressed() { 
  keyAceleration = keyAceleration +0.1;
  switch (key) {
  case 'a':
    keyLeft = true;
  break;
  case 's':
    keyDown = true;
  break;
  case 'd':
    keyRight = true;
  break;
  case 'w':
    keyUp = true;
  break;
  case 'e':
    //shear-
  break;
  case ',':
    rotatingConter = true;
  break;
  case '.':
    rotatingClock = true;
  break;
  }
}

void keyReleased(){
  keyAceleration = 0;
  switch (key) {
  case 'a':
    keyLeft = false;
  break;
  case 's':
    keyDown = false;
  break;
  case 'd':
    keyRight = false;
  break;
  case 'w':
    keyUp = false;
  break;
  case ',':
    rotatingConter = false;
  break;
  case '.':
    rotatingClock = false;
  break;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  print(e);
  if(e >=0){
    s.translate(xr+s.width/2,yr+s.height/2);
    s.scale(1.02);
    s.translate(-xr-s.width/2,-yr+s.height/2);
  }else{
    s.translate(xr+s.width/2,yr+s.height/2);
    s.scale(0.98);
    s.translate(-xr-s.width/2,-yr+s.height/2);
  }
}

void mouseClicked(){
   xr = mouseX;
   yr = mouseY;
}
