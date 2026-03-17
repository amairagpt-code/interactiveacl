class AnatomyTab extends TabPanel {
  PImage imgFront, imgBack;
  PImage currentImg;
  String hoveredPart = "";

  int imgX = 160;
  int imgY = 70;
  int imgW = 380;
  int imgH = 500;

  int viewSelectHovered = -1;

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
    imgFront = loadImage("acl_front.jpg");
    imgBack  = loadImage("acl_back.png");
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
    if (hovered) {
      fill(255, 220, 80);
      stroke(200, 170, 30);
    } else {
      fill(255, 255, 255, 20);
      stroke(255, 255, 255, 50);
    }
    strokeWeight(1.5);
    rect(bx, by, bw, bh, 14);

    fill(hovered ? 30 : 230);
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
      currentImg  = imgFront;
      hoveredPart = "";
      screen = "front";
    }
    if (mx > width/2 + 20  && mx < width/2 + 220 &&
        my > height/2 - 70  && my < height/2 + 50) {
      currentImg  = imgBack;
      hoveredPart = "";
      screen = "back";
    }
  }

  void onViewSelectHover(int mx, int my) {
    viewSelectHovered = -1;
    if (mx > width/2 - 220 && mx < width/2 - 20 &&
        my > height/2 - 70  && my < height/2 + 50) viewSelectHovered = 0;
    if (mx > width/2 + 20  && mx < width/2 + 220 &&
        my > height/2 - 70  && my < height/2 + 50) viewSelectHovered = 1;
  }

  void draw() {
    String viewLabel = screen.equals("front") ? "Front View" : "Back View";
    fill(255);
    textSize(15);
    textAlign(CENTER, TOP);
    text("Knee Anatomy — " + viewLabel, imgX + imgW/2, 14);
    fill(160);
    textSize(11);
    text("hover over a part to learn more", imgX + imgW/2, 32);

    if (currentImg != null) {
      image(currentImg, imgX, imgY, imgW, imgH);
      drawHighlight();
    }

    drawInfoPanel();
    drawBackButton();
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

  boolean overZone(int mx, int my, float zx, float zy, float zw, float zh) {
    return mx > imgX + zx && mx < imgX + zx + zw &&
           my > imgY + zy && my < imgY + zy + zh;
  }

  void drawHighlight() {
    if (hoveredPart.equals("")) return;
    noFill();
    stroke(255, 220, 80, 180);
    strokeWeight(2);
    if (screen.equals("front")) {
      if (hoveredPart.equals("Femur"))     rect(imgX+100, imgY+  0, 180, 160, 6);
      if (hoveredPart.equals("Patella"))   rect(imgX+140, imgY+ 60, 100,  80, 6);
      if (hoveredPart.equals("ACL"))       rect(imgX+150, imgY+140,  80, 120, 6);
      if (hoveredPart.equals("PCL"))       rect(imgX+160, imgY+160,  60, 100, 6);
      if (hoveredPart.equals("Cartilage")) rect(imgX+ 80, imgY+170, 220,  30, 6);
      if (hoveredPart.equals("Meniscus"))  rect(imgX+ 60, imgY+190, 260,  80, 6);
      if (hoveredPart.equals("Tibia"))     rect(imgX+ 80, imgY+320, 220, 200, 6);
    } else {
      if (hoveredPart.equals("Femur"))    rect(imgX+100, imgY+  0, 180, 180, 6);
      if (hoveredPart.equals("Tibia"))    rect(imgX+ 80, imgY+320, 220, 180, 6);
      if (hoveredPart.equals("PCL"))      rect(imgX+150, imgY+160,  80, 120, 6);
      if (hoveredPart.equals("Meniscus")) rect(imgX+ 60, imgY+200, 260,  80, 6);
    }
  }

  void drawInfoPanel() {
    int px = 575, py = 80, pw = 180;
    int ph = height - 100;

    fill(255, 255, 255, 18);
    noStroke();
    rect(px, py, pw, ph, 14);

    fill(255);
    textSize(12);
    textAlign(LEFT, TOP);
    text("Part Info", px+12, py+12);

    stroke(255, 255, 255, 40);
    strokeWeight(1);
    line(px+8, py+30, px+pw-8, py+30);

    if (hoveredPart.equals("")) {
      fill(140);
      textSize(11);
      textAlign(CENTER, TOP);
      text("Hover over\nthe knee image", px+pw/2, py+46);
    } else {
      fill(255, 220, 80);
      textSize(12);
      textAlign(LEFT, TOP);
      text(hoveredPart, px+12, py+40);
      fill(200);
      textSize(11);
      text(partInfo[getPartIndex(hoveredPart)], px+12, py+60, pw-24, ph-80);
    }
  }

  int getPartIndex(String name) {
    for (int i = 0; i < partNames.length; i++) {
      if (partNames[i].equals(name)) return i;
    }
    return 0;
  }

  void onHover(int mx, int my) {
    hoveredPart = "";
    if (screen.equals("front")) {
      if      (overZone(mx, my, 150, 140,  80, 120)) hoveredPart = "ACL";
      else if (overZone(mx, my, 160, 160,  60, 100)) hoveredPart = "PCL";
      else if (overZone(mx, my, 140,  60, 100,  80)) hoveredPart = "Patella";
      else if (overZone(mx, my,  80, 170, 220,  30)) hoveredPart = "Cartilage";
      else if (overZone(mx, my,  60, 190, 260,  80)) hoveredPart = "Meniscus";
      else if (overZone(mx, my, 100,   0, 180, 160)) hoveredPart = "Femur";
      else if (overZone(mx, my,  80, 320, 220, 200)) hoveredPart = "Tibia";
    } else {
      if      (overZone(mx, my, 150, 160,  80, 120)) hoveredPart = "PCL";
      else if (overZone(mx, my,  60, 200, 260,  80)) hoveredPart = "Meniscus";
      else if (overZone(mx, my, 100,   0, 180, 180)) hoveredPart = "Femur";
      else if (overZone(mx, my,  80, 320, 220, 180)) hoveredPart = "Tibia";
    }
  }

  void onClick(int mx, int my) {
    if (mx > 20 && mx < 110 && my > 15 && my < 45) {
      hoveredPart = "";
      screen = "anatomy";
    }
  }
}
