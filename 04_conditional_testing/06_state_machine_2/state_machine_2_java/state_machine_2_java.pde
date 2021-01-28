
boolean state;
float rW, rH, rT, rL, rR, rB;
float rectSize; 
PImage cursorImg; 

void setup() {
  size(800, 800);
  rectMode(CORNER);
  rectSize = width * (1.0 - ((sqrt(5) - 1.0)/2.0));
  cursorImg = loadImage("cursor_with_shadow_15x21.png"); 
  state = true; 
}

void draw() {
  background(200);

  rW = rectSize; 
  rH = rectSize;  
  rL = width/2 - rectSize/2; 
  rT = height/2 - rectSize/2;
  rR = rL + rW; 
  rB = rT + rH; 

  
  if (state == false) {
    fill(50);
  } else {
    fill(255); 
  }

  stroke(0); 
  strokeWeight(8); 
  strokeJoin(MITER); 
  rect(rL, rT, rW, rH);
  
  image(cursorImg, mouseX, mouseY, 15*6, 21*6); 
}

void mousePressed() {
  if ((mouseX > rL) && (mouseX < rR) && (mouseY < rB) && (mouseY > rT)) {
    state = !state; 
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("state_machine.png");
  }
}
