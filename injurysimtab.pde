class InjurySimTab extends TabPanel {

  InjurySimTab() {
    super("Injury Sim");
  }

  void draw() {
    drawPanels();
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Injury Sim Tab — coming soon", width/2 + 75, height/2);
  }

  void onClick(int x, int y) {
  }
  void onHover(int x, int y) {
  }
}
