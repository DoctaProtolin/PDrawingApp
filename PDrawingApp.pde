

// Processing Art program attempt


PFont font;
PShader buttonFade;

// Hotbar
ArrayList<Button> hotbar = new ArrayList();
PVector hotbarPos;
float hotbarWidth;

TextField colorField;

void setup() {
  size(600, 600, P2D);
  
  buttonFade = loadShader("buttonFade.glsl");
  
  // Create default font
  font = createFont("Arial", 60);
  textFont(font);
  
  hotbarPos = new PVector(0, 0);
  hotbarWidth = width;
  
  colorField = new TextField(100, 100, 250, 40, "Enter fill color", text_field.NUMBER);
  
  hotbar.add(new Button(0, 0, 0, 0, "Rect Mode", shapes.RECT));
  hotbar.add(new Button(0, 0, 0, 0, "Set Color", actions.SET_FILL_COLOR));
}

void draw() {
  background(#00ff00);
  
  processHotbar(hotbar);

  if (user.mode == shapes.RECT) {
    tools.rectTool(this);
  }
  
  for (Object command : user.commands) {
    if (command instanceof SetColor) {
      SetColor c = (SetColor) command;
      
      if (c.mode == colorModes.FILL) {
        fill(c.col);
      }
    } else if (command instanceof Shape) {
      ((Shape) command).draw();
    }
  }
  
  
  if (user.usingInterface) {
    if (user.mode == actions.SET_FILL_COLOR) {
      colorField.update();
      colorField.draw();
    }
  
    fill(0);
    strokeWeight(1);
    textSize(15);
    text("Using UI, not\nadding shapes.", width - 150, height - 100);
  }
}

void mousePressed() {
  for (Button b : hotbar) {
    if (b.detectClick()) return; // Don't click multiple buttons
  }
  
  if (!user.usingInterface) {
    if (user.mode == shapes.RECT) {
      user.points.add(new PVector(mouseX, mouseY));
      print("Added point: ");
      println(user.points.size());
    }
  }
}

void keyPressed() {
  if (user.usingInterface && user.mode == actions.SET_FILL_COLOR) {
    // colorField.detectKeystroke();
    if (keyCode == 13) {
      user.usingInterface = false;
      user.mode = actions.NONE;
    }
  }
  
  if (user.usingInterface) {
    colorField.typed = true;
  }
  
  
}

boolean pointInBox(float px, float py, float x, float y, float w, float h) {
  return px >= x && px <= x + w && py >= y && py <= y + h;
}
