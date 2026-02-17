

// Processing Art program attempt


PFont font;
PShader buttonFade;

// Hotbar
ArrayList<Button> hotbar = new ArrayList();
PVector hotbarPos;
float hotbarWidth;

Draggable draggable;

void setup() {
  size(600, 600, P2D);
  
  draggable = new Draggable("Drag Queen", width/2, height/2, 100, 50);
  
  buttonFade = loadShader("buttonFade.glsl");
  
  // Create default font
  font = createFont("Arial", 60);
  textFont(font);
  
  hotbarPos = new PVector(0, 0);
  hotbarWidth = width;

  hotbar.add(new Button(0, 0, 0, 0, "Rect Mode",     BUTTON_ACTION.RECT_MODE));
  hotbar.add(new Button(0, 0, 0, 0, "Ellipse Mode",  BUTTON_ACTION.ELLIPSE_MODE));
  hotbar.add(new Button(0, 0, 0, 0, "Color Mode",    BUTTON_ACTION.COLOR_MODE));
}

void draw() {
  background(#00ff00);
  
  processHotbar(hotbar);
  
  switch (user.drawMode) {
    case DRAW_MODE.RECT:
      tools.rectTool(this);
      break;
      
    case DRAW_MODE.ELLIPSE:
      tools.ellipseTool(this);
      break;
  }
  
  draggable.draw();
  
  if (user.usingInterface) {
    fill(0);
    //strokeWeight(1);
    textSize(15);
    text("Using UI", width - 150, height - 100);
  } else {
    for (Command command : user.commands) {
      command.run();
    }
  }
}

void mousePressed() {
  for (Button b : hotbar) {
    if (b.detectClick()) return; // Don't click multiple buttons
  }
  
  if (user.usingInterface) {
    
  } else {
    addShapeInterface();
  }
}

void keyPressed() {
  
}

void keyReleased() {
  if (key == 'l') {
    //listCommands();
  }
}

boolean pointInBox(float px, float py, float x, float y, float w, float h) {
  return px >= x && px <= x + w && py >= y && py <= y + h;
}
