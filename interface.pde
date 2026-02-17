
// User data
static class user {
  static String drawMode = NONE.NONE;
  static ArrayList<Float> args = new ArrayList(); // General arguments
  static ArrayList<Command> commands = new ArrayList();
  static boolean usingInterface = false;
}

// These functions are always called depending on what tool is selected. They show a preview of the shape.
static class tools {
  static void rectTool(PDrawingApp sketch) {
    sketch.noFill();
    
    if (user.args.size() == 2) {
      sketch.noFill();
      sketch.strokeWeight(1);
      sketch.stroke(0);
      
      PVector p = new PVector(user.args.get(0), user.args.get(1));
      sketch.rect(p.x, p.y, sketch.mouseX - p.x, sketch.mouseY - p.y);
      
    } else if (user.args.size() == 4) {
      
      sketch.addCommand(COMMAND_NAME.RECT, user.args);
      user.args = new ArrayList();
      println("Added rectangle");
    }
  }
  
  static void ellipseTool(PDrawingApp sketch) {
    sketch.noFill();
    
    if (user.args.size() == 2) {
      sketch.noFill();
      sketch.strokeWeight(1);
      sketch.stroke(0);
      
      PVector p = new PVector(user.args.get(0), user.args.get(1));
      sketch.ellipse((p.x + sketch.mouseX)*0.5, (p.y + sketch.mouseY)*0.5, (sketch.mouseX - p.x), (sketch.mouseY - p.y));
    } else if (user.args.size() == 4) {
      sketch.addCommand(COMMAND_NAME.ELLIPSE, user.args);
      //print(user.commands);
      user.args = new ArrayList();
      println("Added ellipse");
    }
  }
}

void addShapeInterface() {
  switch (user.drawMode) {
      case DRAW_MODE.RECT:
        if (user.args.size() == 0) {
          user.args.add((float) mouseX);
          user.args.add((float) mouseY);
        } else if (user.args.size() == 2) {
          user.args.add((float) mouseX - user.args.get(0));
          user.args.add((float) mouseY - user.args.get(1));
        }
        
        print("Added point: ");
        println(user.args.size());
        break;
      
      case DRAW_MODE.ELLIPSE:
        if (user.args.size() == 0) {
          user.args.add((float) mouseX);
          user.args.add((float) mouseY);
        } else if (user.args.size() == 2) {
          user.args.add((float) mouseX);
          user.args.add((float) mouseY);
        }
        
        print("Added point: ");
        println(user.args.size());
        break;
    }
}

void addCommand(String name, ArrayList<Float> points) {
  println("Adding shape with command name: " + name);
  user.commands.add(new Command(name, points));
}
