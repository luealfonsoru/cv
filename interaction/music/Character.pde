class Character{
  Vector position, newPos;
  Frame charact;
  float initY, dy;
  float myHeight;
  Character(Vector initPos){
    position = new Vector();
    position.set(initPos);
    initY = position.y();
    charact = new Frame(scene){
      @Override
      public void visit() {
        run();
        render();
      }
    };
  }
  void render(){
    strokeWeight(10);
    stroke(255);
    point(0,0,0);
  }
  void run(){
    myHeight = fastft[0][5];
    newPos = new Vector(position.x(),initY+myHeight,position.z());
    charact.setPosition(newPos);
  }
  void rotateCharacter(String to){
    if(to == "Up"){
      charact.rotate(new Quaternion(0,0,1));
    }
  }
}
