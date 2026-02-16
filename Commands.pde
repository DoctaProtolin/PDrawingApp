
static class COMMAND_NAME {
  static final String RECT = "Rect";
  static final String ELLIPSE = "Ellipse";
}

/*
  I encountered a weird error here. I got a noclassdeffound error in the Command constructor, PRESUMABLY because COMMAND is very similar to Command.
  I accidentally fixed it by renaming COMMAND to _COMMAND, running it, then changing the name back. Now it runs as expected. No idea why.
  Processing is weird.
*/

class Command {
  String name;
  ArrayList<PVector> points;
  
  Command(String n, ArrayList<PVector> _points) {
    name = n;
    
    points = new ArrayList<PVector>();
    for (PVector p : _points) points.add(p);
  }
  
  void run() {
    
    
    switch (name) {
      case COMMAND_NAME.RECT:
      {
        PVector pos = points.get(0);
        PVector size = points.get(1);
      
        rect(pos.x, pos.y, size.x, size.y);
        break;
      }
        
      case COMMAND_NAME.ELLIPSE:
      {
        PVector pos = points.get(0);
        PVector size = points.get(1);
      
        ellipse(pos.x, pos.y, size.x, size.y);
        break;
      }
    }
  }
}

void addShape(String name, ArrayList<PVector> points) {
  println("Adding shape with command name: " + name);
  user.commands.add(new Command(name, points));
}





















// End
