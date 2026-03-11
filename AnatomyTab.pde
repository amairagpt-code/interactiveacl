class AnatomyTab extends TabPanel {

  PImage imgFront, imgBack;
  PImage currentImg;
  String currentView = "Front";
  String hoveredPart = "";

  int imgX = 160;
  int imgY = 60;
  int imgW = 380;
  int imgH = 500;

  ViewButton[] viewButtons;

  String[] partNames = { "Femur", "Tibia", "Patella", "ACL", "PCL", "Meniscus", "Cartilage" };
  String[] partInfo  = {
    "The thigh bone. The large upper bone that forms the top half of the knee joint.",
    "The shin bone. Forms the lower platform of the knee joint.",
    "The kneecap. Sits at the front of the joint, protecting it from impact.",
    "Anterior Cruciate Ligament. Runs diagonally through the joint — most commonly torn.",
    "Posterior Cruciate Ligament. Runs behind the ACL, preventing backward sliding.",
    "Two blue-grey pads that cushion and stabilise each side of the joint.",
    "Smooth tissue covering bone ends, reducing friction between bones."
  };

  AnatomyTab() {
    super("Anatomy");
    imgFront   = loadImage("acl_front.png");
    imgBack    = loadImage("acl_back.png");
    currentImg = imgFront;

    String[] views = { "Front", "Back" };
    viewButtons = new ViewButton[views.length];
    for (int i = 0; i < views.length; i++) {
      viewButtons[i] = new ViewButton(575, 70 + i * 50, 180, 36, views[i], this);
    }
    viewButtons[0].setActive(true);
  }

  void setView(String view) {
    currentView = view;
    hoveredPart = "";
    if      (view.equals("Front")) currentImg = imgFront;
    else if (view.equals("Back"))  currentImg = imgBack;
    for (ViewButton b : viewButtons) {
      b.setActive(b.getLabel().equals(view));
    }
  }

  void draw() {
    drawPanels();
    drawTitle();
    if (currentImg != null) {
      image(currentImg, imgX, imgY, imgW, imgH);
      drawHighlight();
    }
    drawViewButtons();
    drawInfoPanel();
  }

  void drawTitle() {
    fill(255);
    textSize(15);
    textAlign(CENTER, TOP);
    text("Knee Anatomy — " + currentView + " View", imgX + imgW/2, 14);
    fill(160);
    textSize(11);
    text("hover over a part to learn more", imgX + imgW/2, 32);
  }

  void drawViewButtons() {
    for (ViewButton b : viewButtons) b.draw();
  }

  boolean overZone(int mx, int my, float zx, float zy, float zw, float zh) {
    return mx > imgX + zx && mx < imgX + zx + zw &&
           my > imgY + zy && my < imgY + zy + zh;
  }

  void drawHighlight() {
    if (hoveredPart.equals("")) return;
    noFill();
    stroke(255, 220, 80, 180);
    strokeWeight(2);
    if (currentView.equals("Front")) {
      if (hoveredPart.equals("Femur"))     rect(imgX + 100, imgY +   0, 180, 160, 6);
      if (hoveredPart.equals("Patella"))   rect(imgX + 140, imgY +  60, 100,  80, 6);
      if (hoveredPart.equals("ACL"))       rect(imgX + 150, imgY + 140,  80, 120, 6);
      if (hoveredPart.equals("PCL"))       rect(imgX + 160, imgY + 160,  60, 100, 6);
      if (hoveredPart.equals("Cartilage")) rect(imgX +  80, imgY + 170, 220,  30, 6);
      if (hoveredPart.equals("Meniscus"))  rect(imgX +  60, imgY + 190, 260,  80, 6);
      if (hoveredPart.equals("Tibia"))     rect(imgX +  80, imgY + 320, 220, 200, 6);
    } else if (currentView.equals("Back")) {
      if (hoveredPart.equals("Femur"))     rect(imgX + 100, imgY +   0, 180, 180, 6);
      if (hoveredPart.equals("Tibia"))     rect(imgX +  80, imgY + 320, 220, 180, 6);
      if (hoveredPart.equals("PCL"))       rect(imgX + 150, imgY + 160,  80, 120, 6);
      if (hoveredPart.equals("Meniscus"))  rect(imgX +  60, imgY + 200, 260,  80, 6);
    }
  }

  void drawInfoPanel() {
    int px = 575;
    int py = 240;
    int pw = 180;
    int ph = height - 260;

    fill(255, 255, 255, 18);
    noStroke();
    rect(px, py, pw, ph, 14);

    fill(255);
    textSize(12);
    textAlign(LEFT, TOP);
    text("Part Info", px + 12, py + 12);

    stroke(255, 255, 255, 40);
    strokeWeight(1);
    line(px + 8, py + 30, px + pw - 8, py + 30);

    if (hoveredPart.equals("")) {
      fill(140);
      textSize(11);
      textAlign(CENTER, TOP);
      text("Hover over\nthe knee image", px + pw/2, py + 46);
    } else {
      fill(255, 220, 80);
      textSize(12);
      textAlign(LEFT, TOP);
      text(hoveredPart, px + 12, py + 40);
      fill(200);
      textSize(11);
      text(partInfo[getPartIndex(hoveredPart)], px + 12, py + 60, pw - 24, ph - 80);
    }
  }

  int getPartIndex(String name) {
    for (int i = 0; i < partNames.length; i++) {
      if (partNames[i].equals(name)) return i;
    }
    return 0;
  }

  void onHover(int x, int y) {
    hoveredPart = "";
    if (currentView.equals("Front")) {
      if      (overZone(x, y, 150, 140,  80, 120)) {
        hoveredPart = "ACL";
      }
      else if (overZone(x, y, 160, 160,  60, 100)) {
        hoveredPart = "PCL";
      }
      else if (overZone(x, y, 140,  60, 100,  80)) {
        hoveredPart = "Patella";
      }
      else if (overZone(x, y,  80, 170, 220,  30)) hoveredPart = "Cartilage";
      else if (overZone(x, y,  60, 190, 260,  80)) hoveredPart = "Meniscus";
      else if (overZone(x, y, 100,   0, 180, 160)) hoveredPart = "Femur";
      else if (overZone(x, y,  80, 320, 220, 200)) hoveredPart = "Tibia";
    } else if (currentView.equals("Back")) {
      if      (overZone(x, y, 150, 160,  80, 120)) {
        hoveredPart = "PCL";
      } 
      else if (overZone(x, y,  60, 200, 260,  80)) {
        hoveredPart = "Meniscus";
      }
      else if (overZone(x, y, 100,   0, 180, 180)) {
        hoveredPart = "Femur";
      } 
      else if (overZone(x, y,  80, 320, 220, 180)) {
        hoveredPart = "Tibia";
      }
    }
  }

  void onClick(int x, int y) {
    for (ViewButton b : viewButtons) {
      if (b.isHovered(x, y)) {
        b.onClick();
        return;
      }
    }
  }
}
