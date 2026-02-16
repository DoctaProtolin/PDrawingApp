
// User data
static class user {
  static String drawMode = NONE.NONE;
  static ArrayList<PVector> points = new ArrayList<PVector>();
  static ArrayList<Command> commands = new ArrayList();
  static boolean usingInterface = false;
}

// These functions are always called depending on what tool is selected. They show a preview of the shape.
static class tools {
  static void rectTool(PDrawingApp sketch) {
    sketch.noFill();
    
    if (user.points.size() == 1) {
      sketch.noFill();
      sketch.strokeWeight(1);
      sketch.stroke(0);
      
      PVector p = user.points.get(0);
      sketch.rect(p.x, p.y, sketch.mouseX - p.x, sketch.mouseY - p.y);
      
    } else if (user.points.size() == 2) {
      
      sketch.addShape(COMMAND_NAME.RECT, user.points);
      user.points = new ArrayList();
      println("Added rectangle");
    }
  }
  
  static void ellipseTool(PDrawingApp sketch) {
    sketch.noFill();
    
    if (user.points.size() == 1) {
      sketch.noFill();
      sketch.strokeWeight(1);
      sketch.stroke(0);
      
      PVector p = user.points.get(0);
      sketch.ellipse(p.x, p.y, (sketch.mouseX - p.x) * 2, (sketch.mouseY - p.y) * 2);
    } else if (user.points.size() == 2) {
      sketch.addShape(COMMAND_NAME.ELLIPSE, user.points);
      print(user.commands);
      user.points = new ArrayList();
      println("Added ellipse");
    }
  }
}
