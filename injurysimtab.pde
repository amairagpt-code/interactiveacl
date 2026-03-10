class InjurySimTab extends TabPanel {

  InjurySimTab() {
    super("Injury Sim");
  }

  void draw() {
    fill(255, 255, 255, 15);
    noStroke();
    rect(80, 20, width - 100, height - 40, 20);

    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Injury Sim Tab", width/2 + 20, height/2);
  }

  void onClick(int x, int y) {
  }
  void onHover(int x, int y) {
  }
}
