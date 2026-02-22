

class Button {
  float x, y, w, h;

  boolean click = false;
  boolean held = false;
  
  boolean shade = false;

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
  
  Button(String t, String a) {
    this.x = 0;
    this.y = 0;
    this.w = 0;
    this.h = 0;

    title = new Text(t, x, y, 20);
    title.size = 30;

    this.action = a;
  }
  
  Button copy() {
    Button b = new Button(x, y, w, h, "", action);
    b.title = title.copy();
    
    return b;
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

    if (click || held || shade) {
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
    case DRAW_MODE.RECT_MODE:
      user.drawMode = DRAW_MODE.RECT_MODE;
      user.args = new ArrayList();
      user.usingInterface = false;
      println("Cleared user arraylist for RECT addition");
      break;
      
    case DRAW_MODE.ELLIPSE_MODE:
      user.drawMode = DRAW_MODE.ELLIPSE_MODE;
      user.args = new ArrayList();
      user.usingInterface = false;
      println("Cleared user arraylist for ELLIPSE addition");
      break;
      
    case DRAW_MODE.FILL_MODE:
      user.usingInterface = true;
      user.drawMode = DRAW_MODE.FILL_MODE;
      user.args = new ArrayList();
      println("Entered color mode");
      break;
      
    default:
      println("ERROR :: Unknown button command: " + action);
      break;
  }
}

class Dropdown extends Button {
  
  ArrayList<Button> buttons;
  
  boolean opened = false;
  
  Dropdown(float x, float y, float w, float h, String t, ArrayList<Button> bs) {
    super(x, y, w, h, t, NONE.NONE);
    buttons = new ArrayList();
    
    for (Button b : bs) {
      buttons.add(b.copy());
    }
  }
  
  Dropdown(String t, ArrayList<Button> bs) {
    super(t, NONE.NONE);
    buttons = new ArrayList();
    
    for (Button b : bs) {
      buttons.add(b.copy());
    }
  }
  
  void update() {
    if (click) {
      opened = !opened;
    }
    
    if (opened) {
      
      boolean mouseOut = true;
      
      // Don't forget to check the menu header itself
      if (pointInBox(mouseX, mouseY, x, y, w, h)) mouseOut = false;
      
      for (Button b : buttons) {
        // Check if mouse has left menu
        if (mouseOut && pointInBox(mouseX, mouseY, b.x, b.y, b.w, b.h)) mouseOut = false;
        b.update();
      }
      
      if (mouseOut) {
        opened = false;
      }
    }
  }
  
  void draw() {
    
    strokeWeight(1);
    fill(#ffffff);
    rect(x, y, w, h);
    
    title.centerText(x, y, w, h);
    title.draw();
    
    if (opened) {
      for (int i = 0; i < buttons.size(); i ++) {
        Button button = buttons.get(i);
        
        button.x = x;
        button.y = y + h * (i+1);
        
        button.w = w;
        button.h = h;
        
        button.draw();
      }
    }
    
    click = false;
  }
}
