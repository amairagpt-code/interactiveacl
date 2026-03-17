class InjurySimTab extends TabPanel {
  InjurySimTab() {
    super("Injury Sim");
  }

  void draw() {
    drawBackButton();
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Injury Sim — coming soon", width/2, height/2);
  }

  void drawBackButton() {
    fill(255, 255, 255, 25);
    stroke(255, 255, 255, 60);
    strokeWeight(1);
    rect(20, 15, 90, 30, 8);
    fill(200);
    textSize(11);
    textAlign(CENTER, CENTER);
    text("← Back", 65, 30);
  }

  void onClick(int mx, int my) {
    if (mx > 20 && mx < 110 && my > 15 && my < 45) {
      screen = "home";
    }
  }

  void onHover(int mx, int my) {
  }
}
