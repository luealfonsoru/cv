int frame = 0;
int animated = 0;
void setup(){
  size(275, 275, P3D);
  noStroke();
  frameRate(60);
  background(159,249,255);
}

void draw(){
  background(159,249,255);
  if(animated == 0){
    for(int i=0; i <=10; i ++){
      for(int j=0; j <=10; j ++){
        noStroke();
        color(255,183,159);
        if(i % 2 == 0){
          if(j%2 == 0){
            rect(25*i,25*j,25,25);
          }
        }
      }
    }
  }
    if(animated == 1){
    for(int i=0; i <=10; i ++){
      for(int j=0; j <=10; j ++){
        noStroke();
        color(255,183,159);
        if(i % 2 == 1 && i != 5){
          if(j%2 == 1 && j != 5){
            rect(25*i,25*j,25,25);
          }
        }
      }
    }
  }
  frame += 1;
  if( frame % 60 == 0){
    if(animated == 0){
      animated = 1;
    }else{
      animated = 0;
    }
  }
  
}
