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

  void onClick(int mx, int my) {
    if (mx > 20 && mx < 110 && my > 15 && my < 45) {
      screen = "home";
    }
  }

  void onHover(int mx, int my) {
  }
}
