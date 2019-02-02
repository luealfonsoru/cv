class Line{
  public Frame frame;
  float vertexPoints[], zPos;
  Line(int depth){
    vertexPoints = fastft[abs(depth-1)];
    zPos = depth;
    frame = new Frame(scene){
      @Override
      public void visit(){
        render();
      }
    };    
  }
  void render(){
    beginShape();
    strokeWeight(2);
    stroke(0,255,0);
    noFill();
    for(int i = 0; i<vertexPoints.length; i++){
      vertex(i,vertexPoints[i], zPos*10);
    }
    endShape();
  }
}
