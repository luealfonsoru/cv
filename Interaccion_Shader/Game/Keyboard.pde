boolean keys[];
Bird bird;
// int x;
// int y;

void setup() {
  size(600, 600);
  bird = new Bird();
  keys = new boolean[128];
  // x = 300;
  // y = 300;
}

void draw() {
  background(255);
  move();
  bird.drawBird();
  // ellipse(x, y, 20, 20);
}

void move() {
  int xDelta = 0;
  int yDelta = 0;
  
  if(keys['w'])
    yDelta--;
  if(keys['s'])
    yDelta++;
  if(keys['a'])
    xDelta--;
  if(keys['d'])  
    xDelta++;
    
  bird.updateBird(xDelta, yDelta);
}

void keyPressed() {
  keys[key] = true;
}

void keyReleased() {
  keys[key] = false;
}
