

static class text_field {
  static final String NUMBER = "NUMBER";
  static final String STRING = "STRING";
}

class TextField {
  
  PVector pos;
  PVector size;
  String placeholder;
  String contents = "";
  String type = text_field.NUMBER;
  
  boolean held = false;
  boolean typed = false;
  
  Text display;
  
  TextField(float x, float y, float w, float h, String placeholder, String type) {
    pos = new PVector(x, y);
    size = new PVector(w, h);
    
    this.placeholder = placeholder;
    this.type = type;
    
    display = new Text(placeholder, pos.x + 5, pos.y + size.y - 5, 15);
  }
  
  void detectKeystroke() {
    this.typed = true;
    
  }
  
  void update() {
    
    if (typed) {
      println("Typed. Keycode: " + keyCode);
      if (type == text_field.NUMBER && keyCode >= 48 && keyCode <= 57) {
        contents += (char) keyCode;
        
      }
    }
    
    typed = false; // Reset at END of frame
  }
  
  void draw() {
    if (contents.length() == 0) {
      display.data = placeholder;
      display.col = #999999;
    } else {
      display.data = contents;
      display.col = #000000;
    }
    
    display.draw();
  }
}
