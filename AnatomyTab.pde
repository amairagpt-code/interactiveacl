class AnatomyTab extends TabPanel {
  private KneeImage kneeImage;
  private InfoPanel infoPanel;
  private int viewSelectHovered;

  AnatomyTab() {
    super("Anatomy");
    kneeImage = new KneeImage(160, 70, 380, 500);
    infoPanel = new InfoPanel(575, 80, 180, height - 100);
    viewSelectHovered = -1;
  }

  void drawViewSelect() {
    drawBackButton();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(22);
    text("Anatomy — Choose a View", width/2, height/2 - 150);
    fill(140);
    textSize(12);
    text("Select a perspective to explore the knee", width/2, height/2 - 118);
    stroke(255, 255, 255, 25);
    strokeWeight(1);
    line(width/2 - 240, height/2 - 100, width/2 + 240, height/2 - 100);

    drawViewSelectBtn(width/2 - 220, height/2 - 70, 200, 120,
                      "Front View", "Patella, ACL, Cartilage", viewSelectHovered == 0);
    drawViewSelectBtn(width/2 +  20, height/2 - 70, 200, 120,
                      "Back View",  "PCL, Meniscus, Femur",   viewSelectHovered == 1);
  }

  void drawViewSelectBtn(float bx, float by, float bw, float bh,
                         String lbl, String sub, boolean hovered) {
    if (hovered == hovered) {
      fill(255, 220, 80);
      stroke(200, 170, 30);
    } else {
      fill(255, 255, 255, 20);
      stroke(255, 255, 255, 50);
    }
    strokeWeight(1.5);
    rect(bx, by, bw, bh, 14);

    fill(hovered? 30 : 230);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(lbl, bx + bw/2, by + bh/2 - 10);

    fill(hovered ? 80 : 120);
    textSize(11);
    text(sub, bx + bw/2, by + bh/2 + 14);
  }

  void onViewSelectClick(int mx, int my) {
    if (mx > 20 && mx < 110 && my > 15 && my < 45) {
      screen = "home";
      return;
    }
    if (mx > width/2 - 220 && mx < width/2 - 20 &&
        my > height/2 - 70  && my < height/2 + 50) {
      kneeImage.setView("front");
      infoPanel.setHoveredPart("");
      screen = "front";
    }
    if (mx > width/2 + 20  && mx < width/2 + 220 &&
        my > height/2 - 70  && my < height/2 + 50) {
      kneeImage.setView("back");
      infoPanel.setHoveredPart("");
      screen = "back";
    }
  }

  void onViewSelectHover(int mx, int my) {
    viewSelectHovered = -1;
    if (mx > width/2 - 220 && mx < width/2 - 20 &&
        my > height/2 - 70  && my < height/2 + 50) {
      viewSelectHovered = 0;
    }
    if (mx > width/2 + 20  && mx < width/2 + 220 &&
        my > height/2 - 70  && my < height/2 + 50) {
      viewSelectHovered = 1;
    }
  }

  void draw() {
    String viewLabel = screen.equals("front") ? "Front View" : "Back View";
    fill(255);
    textSize(15);
    textAlign(CENTER, TOP);
    text("Knee Anatomy — " + viewLabel, 160 + 380/2, 14);
    fill(160);
    textSize(11);
    text("hover over a part to learn more", 160 + 380/2, 32);
    kneeImage.draw();
    kneeImage.drawHighlight(infoPanel.getHoveredPart());
    infoPanel.displayInfo();
    drawBackButton();
  }

  void onHover(int mx, int my) {
    String part = kneeImage.getHoveredPart(mx, my);
    infoPanel.setHoveredPart(part);
  }

  void onClick(int mx, int my) {
    if (mx > 20 && mx < 110 && my > 15 && my < 45) {
      infoPanel.setHoveredPart("");
      screen = "anatomy";
    }
  }
}
