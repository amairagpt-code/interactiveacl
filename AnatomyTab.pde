abstract class TabPanel implements IDrawable, IInteractable {
  private String title;
  private boolean isVisible;

  TabPanel(String title) {
    this.title = title;
    this.isVisible = false;
  }

  void show()         { isVisible = true; }
  void hide()         { isVisible = false; }
  boolean isVisible() { return isVisible; }
  String getTitle()   { return title; }

  void drawPanels() {
    String[] labels = { "Anatomy", "Injury Sim" };
    for (int i = 0; i < labels.length; i++) {
      boolean active = labels[i].equals(title);
      fill(active ? 255 : 150);
      noStroke();
      rect(0, i * 40, 150, 40);
      fill(active ? 0 : 255);
      textSize(12);
      textAlign(CENTER, CENTER);
      text(labels[i], 75, 20 + i * 40);
    }
  }

  void interactPanels(int x, int y) {
    if (x < 150) {
      if (y < 40)       activeTab = anatomyTab;
      else if (y < 80)  activeTab = simTab;
    }
  }

  abstract void draw();
  abstract void onClick(int x, int y);
  abstract void onHover(int x, int y);
}
