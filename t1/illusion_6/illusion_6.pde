void setup(){
  size(500,450);
}

void draw(){
  background(150);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      if(j%2 == 0){
        fill(0);
      }else{
        fill(255);
      }
      noStroke();
      if(i%4 < 3){
        rect(j*50+(i%4)*10,i*47,50,45);
      }else{
        rect(j*50+(i%4)*10-20,i*47,50,45);
      }
      
    }
  }
}
