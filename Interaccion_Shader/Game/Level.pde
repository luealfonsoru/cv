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
    setupBar(5,1);
    setupBar(9,5);
    bar = new Frame(level){
      @Override
      public void visit(){
        renderBar();
      }
    };
    characterShape = createShape(SPHERE,10);    
    characterShape.setStroke(false);    
  }
  
 void setupBar(int tone, int distance){
    bottomBar = createShape(BOX,40,500,20);
    bottomBar.setStroke(false);
    topBar = createShape(BOX,40,500,20); 
    topBar.setStroke(false);
    bottomBar.translate(500+distance*40,tone*10,0);
    topBar.translate(500+distance*40,-500+tone*10-40,0);
  }
  
  void renderCharacter(){
    if(playing){
      shape(characterShape);
      character.setPosition(new Vector(0,110-note*10,0));
    }
  }
  
 void renderBar(){
    shape(bottomBar);
    noStroke();
    shape(topBar);
    bottomBar.translate(-time/10000,0,0);
    topBar.translate(-time/10000,0,0);
  }
  
}
