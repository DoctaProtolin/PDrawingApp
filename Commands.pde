
static class COMMAND_NAME {
  static final String RECT = "Rect";
  static final String ELLIPSE = "Ellipse";
  static final String FILL = "Fill";
}

/*
  I encountered a weird error here. I got a noclassdeffound error in the Command constructor, PRESUMABLY because COMMAND is very similar to Command.
  I accidentally fixed it by renaming COMMAND to _COMMAND, running it, then changing the name back. Now it runs as expected. No idea why.
  Processing is weird.
*/

class Command {
  String name;
  ArrayList<Float> data;
  
  Command(String n, ArrayList<Float> _data) {
    name = n;
    
    data = new ArrayList();
    for (float d : _data) data.add(d);
  }
  
  void run() {
    switch (name) {
      case COMMAND_NAME.RECT:
      {
        PVector pos =  new PVector(data.get(0), data.get(1));
        PVector size = new PVector(data.get(2), data.get(3));
      
        rect(pos.x, pos.y, size.x, size.y);
        break;
      }
        
      case COMMAND_NAME.ELLIPSE:
      {
        PVector upperLeft =  new PVector(data.get(0), data.get(1));
        PVector lowerRight = new PVector(data.get(2), data.get(3));
         
        float x = (upperLeft.x + lowerRight.x) * 0.5;
        float y = (upperLeft.y + lowerRight.y) * 0.5;
        
        float w = lowerRight.x - upperLeft.x;
        float h = lowerRight.y - upperLeft.y;
        
        ellipse(x, y, w, h);
        break;
      }
      
      case COMMAND_NAME.FILL:
      {
        
        break;
      }
    }
  }
  
  String print() {
    switch (name) {
      case COMMAND_NAME.RECT:
      {
        PVector pos =  new PVector(data.get(0), data.get(1));
        PVector size = new PVector(data.get(2), data.get(3));
      
        return "rect(" + pos.x + ", " + pos.y + ", " + size.x + ", " + size.y + ");";
      }
        
     
    }
    
    return "// INVALID COMMAND";
  }
}






















// End
