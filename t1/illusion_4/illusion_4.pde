PImage cat;
PImage copyCat;
float currentFrame = 0;
float squareWidth = 22;
float speed = 4;
float separation = 2.3;

void setup(){
  frameRate(120);
  size(10,10);
  pixelDensity(1);
  copyCat = loadImage("illusion.jpg");
  cat = loadImage("illusion.jpg");
  cat.resize(copyCat.width*2,copyCat.height*2);
  surface.setSize(cat.width,cat.height);
}

void draw(){
  image(cat,0,0);
  fill(0);
  for(int i = 0; i < 2100; i++){
    rect(i*(squareWidth+separation)-currentFrame,0,squareWidth,cat.height);
  }
  
  if(currentFrame < (squareWidth+separation)*2){
    currentFrame += 1;
  }else{
    currentFrame = 0;
  }
}
