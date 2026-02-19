
void processHotbar(ArrayList<Button> hotbar) {
  float w = hotbarWidth / hotbar.size();
  float h = 0;
  
  for (int i = 0; i < hotbar.size(); i ++) {
    Button b = hotbar.get(i);
    
    b.x = hotbarPos.x + i * w;
    b.y = hotbarPos.y;
    
    b.w = w;
    b.h = 50;
  }
  
  for (Button b : hotbar) {
    if (h < b.title.height()) h = b.title.height();
  }
  
  for (Button b : hotbar) {
    b.update();
    b.shade = user.drawMode == b.action;
  }
  
  for (Button b : hotbar) {
    b.draw();
  }
}
