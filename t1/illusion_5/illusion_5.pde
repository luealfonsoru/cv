void setup(){
  size(648,480);
}

void draw(){
  background(0);
  for(int i = 0; i<10;i++){
    fill(255);
    noStroke();
    rect(i*64+24,0,10,480);
    rect(0,i*64+24,648,10);
  }
}
