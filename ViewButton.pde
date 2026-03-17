class ViewButton extends Button {
  AnatomyTab tab;

  ViewButton(float x, float y, float w, float h, String label, AnatomyTab tab) {
    super(x, y, w, h, label);
    this.tab = tab;
  }

  void draw() {
    if (active) {
      fill(255, 220, 80);
      stroke(200, 170, 40);
    } else {
      fill(255, 255, 255, 30);
      stroke(255, 255, 255, 60);
    }
    strokeWeight(1);
    rect(x, y, w, h, 8);
    fill(active ? 30 : 200);
    textSize(11);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2);
  }

  void onClick() {
    // no longer used in new flow
  }
}
