
/**
How to use
*/

class Text {
  String data = "";
  float size = 13;
  color col = #000000;
  
  boolean underline = false;
  PVector pos;
  
  Text(String data, float x, float y, float size) {
    this.data = data;
    this.size = size;
    // this.font = font;
    this.pos = new PVector(x, y);
  }
  
  float width() {
    return textWidth(data);
  }
  
  float height() {
    float fontScalar = 0.9;
    return textAscent() * fontScalar;
  }
  
  void centerText(float x, float y, float w, float h) {
    pos.x = (2*x + w) / 2 - width()/2;
    pos.y = (2*y + h) / 2 + height()/2;
  }
  
  void draw() {
    textSize(size);
    textAlign(LEFT);
    
    fill(col);
    strokeWeight(5);
    text(data, pos.x, pos.y);
    
    if (underline) {
      stroke(0);
      strokeWeight(2);
      line(pos.x, pos.y, pos.x + width(), pos.y);
    }
  }
}
