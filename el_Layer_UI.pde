

void drawLayerUI(float x, float y, float w, float h) {
  final int layerCount = user.layers.size();
  
  for (int i = 0; i < layerCount; i ++) {
    fill(#ffffff);
    rect(x, y + i * h / layerCount, w, h);
  }
}
