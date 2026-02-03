
static class shapes {
  static final String RECT = "rect";
  static final String ELLIPSE = "ellipse";
}

static class colorModes {
  static final String FILL = "fill";
  static final String STROKE = "stroke";
}

class Shape {
  ArrayList<PVector> points = new ArrayList();
  String mode = shapes.RECT;
  
  Shape(ArrayList<PVector> ps, String type) {
    
    this.mode = type;
    
    points = new ArrayList();
    
    for (PVector p : ps) { // Perform deep copy
      points.add(new PVector(p.x, p.y));
    }
  }
  
  void draw() {
    switch (mode) {
      case shapes.RECT:
        PVector p1 = points.get(0);
        PVector p2 = points.get(1);
        
        rect(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y);
        break;
    }
  }
}

void addShape(ArrayList<PVector> points, String type) {
  user.commands.add(new Shape(points, type));
}

class ColorCommand {
  color col = #ffffff;
  String mode = colorModes.FILL;
}
