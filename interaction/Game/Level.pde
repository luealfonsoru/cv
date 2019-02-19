class Level{
  Frame level;
  Frame character,bar;
  PShape topBar, bottomBar;
  PShape characterShape;
  int currentNote;
  float bps, noteLenght;
  
  Level(){
    level = new Frame(scene){
      @Override
      public void visit(){
          renderLevel();
      }
    };
    level.setPosition(new Vector(0,110,0));
    setupLevel();
  }
  
  void renderLevel(){
  }
  
  void setupLevel(){
    setupCharacter();
  }
  
  void setupCharacter(){
    character = new Frame(level){
      @Override
      public void visit(){
        renderCharacter();
      }
    };
    int bpm = 60;
    bps = bpm/60;
    float noteLen = 1;
    currentNote = note;
    setupBar();
    //bar = new Frame(level){
    //  @Override
    //  public void visit(){
    //    renderBar();
    //  }
    //};
    characterShape = createShape(SPHERE,10);    
    characterShape.setStroke(false);    
  }
  
 void setupBar(){
    bottomBar = createShape(BOX,10,20*currentNote,10);
    topBar = createShape(BOX,10,200,10);
    bottomBar.translate(0,20*(currentNote+1),0);
  }
  
  void renderCharacter(){
    if(playing){
      shape(characterShape);
      character.setPosition(new Vector(0,110-note*10,0));
    }
  }
  
 void renderBar(){
    shape(bottomBar);
    shape(topBar);
  }
  
}
