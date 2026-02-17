


class Button {
  float x, y, w, h;

  boolean click = false;
  boolean held = false;

  String action = "";

  Text title;

  Button(float x, float y, float w, float h, String t, String a) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    title = new Text(t, x, y, 20);
    title.size = 30;

    this.action = a;
  }

  boolean detectClick() {
    if (!pointInBox(mouseX, mouseY, x, y, w, h)) return false;
    held = true;
    click = true;

    return true;

    //println("Button clicked!");
  }

  void update() {
    if (!pointInBox(mouseX, mouseY, x, y, w, h) || !mousePressed) held = false;

    title.centerText(x, y, w, h);
    
    if (click) {
      buttonActions(action);
    }
  }

  void draw() {

    float tempH = h;

    if (click || held) {
      shader(buttonFade);
      tempH *= 0.95;
    }

    noStroke();
    fill(#ffffff);
    rect(x, y, w, tempH);

    // Draw outline
    resetShader();
    strokeWeight(1);
    stroke(1);
    noFill();
    rect(x, y, w, tempH);

    title.draw();

    click = false;
  }
}

void buttonActions(String action) {
  switch (action) {
    case BUTTON_ACTION.RECT_MODE:
      user.drawMode = DRAW_MODE.RECT;
      user.args = new ArrayList();
      user.usingInterface = false;
      println("Cleared user arraylist for RECT addition");
      break;
      
    case BUTTON_ACTION.ELLIPSE_MODE:
      user.drawMode = DRAW_MODE.ELLIPSE;
      user.args = new ArrayList();
      user.usingInterface = false;
      println("Cleared user arraylist for ELLIPSE addition");
      break;
      
    case BUTTON_ACTION.COLOR_MODE:
      user.usingInterface = true;
      user.args = new ArrayList();
      println("Entered color mode");
      break;
      
    default:
      println("ERROR :: Unknown button command: " + action);
      break;
  }
}
