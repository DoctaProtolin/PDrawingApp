
// User data
static class user {
  static String drawMode = NONE.NONE;
  static ArrayList<Float> args = new ArrayList(); // General arguments
  static ArrayList<Layer> layers = new ArrayList();
  static int currLayer = 0;
  static boolean usingInterface = false;
  static TextField colorField; // Set in setup();
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
  
  static void fillTool(PDrawingApp sketch) {
    if (user.colorField.submit) {
      if (user.colorField.contents.length() == 9) {
        
        ArrayList<Float> args = new ArrayList();
        String contents = user.colorField.contents;
        
        float val = 0;
        for (int i = 0; i < 9; i ++) {
          int j = 2 - (i % 3);
          val += (contents.charAt(i) - 48) * pow(10, j);
          
          print(j);
          println(" " + val);
          
          if (j == 0) {
            args.add(val);
            val = 0;
          }
        }
        
        println(args);
        
        sketch.addCommand(COMMAND_NAME.FILL, args);
        
        user.colorField.reset();
        user.args = new ArrayList();
        user.usingInterface = false;
        println("Confirmed contents submitted");
      } else {
        user.colorField.submit = false;
      }
    }
  }
}

void addShapeInterface() {
  switch (user.drawMode) {
      case DRAW_MODE.RECT_MODE:
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
      
      case DRAW_MODE.ELLIPSE_MODE:
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
  println("Adding shape with command name '" + name + "' to layer '" + user.currLayer + "'");
  user.layers.get(user.currLayer).add(new Command(name, points));
}
