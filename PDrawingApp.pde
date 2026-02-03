

// Processing Art program attempt


PFont font;
PShader buttonFade;

// Hotbar
ArrayList<Button> hotbar = new ArrayList();
PVector hotbarPos;
float hotbarWidth;


void setup() {
  size(600, 600, P2D);
  
  buttonFade = loadShader("buttonFade.glsl");
  
  // Create default font
  font = createFont("Arial", 60);
  textFont(font);
  
  hotbarPos = new PVector(0, 0);
  hotbarWidth = width;
  
  hotbar.add(new Button(0, 0, 0, 0, "Rect Mode", shapes.RECT));
}

void draw() {
  background(#00ff00);
  
  processHotbar(hotbar);

  if (user.mode == shapes.RECT) {
    tools.rectTool(this);
    println("tool");
  }
  
  for (Object command : user.commands) {
    if (command instanceof ColorCommand) {
      ColorCommand c = (ColorCommand) command;
      
      if (c.mode == colorModes.FILL) {
        fill(c.col);
      }
    }
    
    if (command instanceof Shape) {
      ((Shape) command).draw();
    }
  }
}

void mousePressed() {
  for (Button b : hotbar) {
    if (b.detectClick()) return; // Don't click multiple buttons
  }
  
  if (user.mode == shapes.RECT) {
    user.points.add(new PVector(mouseX, mouseY));
    print("Added point: ");
    println(user.points.size());
  }
}

boolean pointInBox(float px, float py, float x, float y, float w, float h) {
  return px >= x && px <= x + w && py >= y && py <= y + h;
}
