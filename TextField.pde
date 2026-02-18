

static class TEXT_FIELD {
  static final String NUMBER = "NUMBER";
  static final String STRING = "STRING";
}

class TextField {
  
  // Meta data
  String placeholder;
  String contents = "";
  String type = TEXT_FIELD.NUMBER;
  int maxLength = 100;
  
  // Format data
  String formatSeparator = "";
  int formatGroupLength = 0;
  int formatGroupMaxVal = -1;
  
  // Input data
  boolean held = false;
  boolean typed = false;
  boolean backspaceTyped = false;
  boolean enterTyped = false;
  int keyRecorded = 0;
  
  // Output
  PVector pos;
  PVector size;
  Text display;
  
  TextField(float x, float y, float w, float h, String placeholder, String type, int maxLength) {
    pos = new PVector(x, y);
    size = new PVector(w, h);
    
    this.placeholder = placeholder;
    this.type = type;
    this.maxLength = maxLength;
    
    display = new Text(placeholder, pos.x + 5, pos.y + size.y - 5, 15);
  }
  
  // Require entering the number first, since that determines whether or not it bothers with formatting in the conditonal
  void setFormat(int groupLength, int groupMax, String s) {
    
    if (groupLength < 0) {
      println("Won't bother to set format if value is below 0");
    }
    
    formatSeparator = s;
    formatGroupLength = groupLength;
    formatGroupMaxVal = groupMax;
  }
  
  void detectKeystroke() {
    keyRecorded = keyCode;
    
    switch (keyRecorded) {
      case 8:
        backspaceTyped = true;
        break;

      case 13:
        enterTyped = true;
        break;
    }
    
    typed = true;
  }
  
  void update() {
    
    if (typed) {
      if (type == TEXT_FIELD.NUMBER && keyRecorded >= 48 && keyRecorded <= 57 && contents.length() < maxLength) {
        contents += Character.toString((char) keyRecorded);
      } else if (type == TEXT_FIELD.STRING) {
        throw new Error("Not built to handle strings yet.");
        // TODO: Handle strings
      }
    }
    
    // Backspace
    if (backspaceTyped && contents.length() > 0) {
      contents = contents.substring(0, contents.length() - 1);
    }
    
    // Format text into groups (i.e. phone numbers or colors)
    String displayContents = "";
    
    if (formatGroupLength > 0) {
      for (int i = 0; i < contents.length(); i ++) {
        displayContents += contents.charAt(i);
        if ((i + 1) % formatGroupLength == 0 && i != contents.length() - 1) {
          displayContents += formatSeparator;
        }
      }
      
    } else displayContents = contents;
    
    if (formatGroupMaxVal > 0 && type == TEXT_FIELD.NUMBER) {
      String[] groups = split(displayContents, formatSeparator);
      
      String tempContents = "";
      
      for (int i = 0; i < groups.length; i ++) {
        String group = groups[i];
        
        if (group.length() < 1) continue; // Don't bother clamping out if a group doesn't exist
        
        tempContents += Integer.parseInt(group) > formatGroupMaxVal ? Integer.toString(formatGroupMaxVal) : group; // Limit the max value for a group
        
        if (i < groups.length - 1) tempContents += formatSeparator;
      }
      
      displayContents = tempContents;
    }
    
    // Set text style and data based on emptiness
    if (contents.length() == 0) {
      display.data = placeholder;
      display.col = #999999;
    } else {
      display.data = displayContents;
      display.col = #000000;
    }
    
    // Reset values
    if (typed) {
      typed = false;
      backspaceTyped = false;
      enterTyped = false;
    }
  }
  
  void draw() {
    display.centerText(pos.x, pos.y, size.x, size.y);
    
    fill(#ffffff);
    stroke(0);
    strokeWeight(1);
    rect(pos.x, pos.y, size.x, size.y);
    display.draw();
  }
}
