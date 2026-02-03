


class Button {
  float x, y, w, h;

  boolean click = false;
  boolean held = false;

  String action = modes.NONE;

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
  case shapes.RECT:
    user.mode = action;
    user.points = new ArrayList();
    println("Cleared user arraylist for RECT addition");
    break;
  }
}
