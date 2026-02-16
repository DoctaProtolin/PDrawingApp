

//static class TEXT_FIELD {
//  static final String NUMBER = "NUMBER";
//  static final String STRING = "STRING";
//}

//class TextField {
  
//  PVector pos;
//  PVector size;
//  String placeholder;
//  String contents = "";
//  String type = TEXT_FIELD.NUMBER;
//  int maxLength = 100;
  
//  boolean held = false;
//  boolean typed = false;
  
//  int keyRecorded = 0;
  
//  Text display;
  
//  TextField(float x, float y, float w, float h, String placeholder, String type, int maxLength) {
//    pos = new PVector(x, y);
//    size = new PVector(w, h);
    
//    this.placeholder = placeholder;
//    this.type = type;
//    this.maxLength = maxLength;
    
//    display = new Text(placeholder, pos.x + 5, pos.y + size.y - 5, 15);
//  }
  
//  void detectKeystroke() {
//    this.typed = true;
    
//  }
  
//  void update() {
    
//    if (typed) {
//      println("Typed. Keycode: " + keyCode);
//      if (type == text_field.NUMBER && keyRecorded >= 48 && keyRecorded <= 57) {
//        contents += Character.toString((char) keyRecorded);
        
//      }
//    }
    
//    if (typed) {
//      println("Release typed key");
//      typed = false; // Reset at END of frame
//    }
//  }
  
//  void draw() {
//    if (contents.length() == 0) {
//      display.data = placeholder;
//      display.col = #999999;
//    } else {
//      display.data = contents;
//      display.col = #000000;
//    }
    
//    display.draw();
//  }
//}
