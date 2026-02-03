
static class user {
  static String mode = modes.NONE;
  static ArrayList<PVector> points = new ArrayList<PVector>();
  static ArrayList<Object> commands = new ArrayList();
}

static class modes {
  static final String NONE = "none";
}

static class canvas {
  static ArrayList<Shape> shapes = new ArrayList();
}

static class tools {
  static void rectTool(PDrawingApp sketch) {
    sketch.noFill();
    
    if (user.points.size() == 1) {
      PVector p = user.points.get(0);
      sketch.noFill();
      sketch.rect(p.x, p.y, sketch.mouseX - p.x, sketch.mouseY - p.y);
    } else if (user.points.size() == 2) {
      sketch.addShape(user.points, shapes.RECT);
      user.points = new ArrayList();
      println("Added shape");
    }
  }
}
