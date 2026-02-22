
class Layer {
  ArrayList<Command> commands;
  
  Layer() {
    commands = new ArrayList();
  }
  
  void add(Command c) {
    commands.add(c);
  }
  
  void execute() {
    for (Command c : commands) {
      c.run();
    }
  }
}
