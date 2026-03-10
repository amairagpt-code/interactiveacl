class AnatomyTab extends TabPanel {
  protected PImage kneeImg;
  protected String hoveredPart = "";
  protected int imgX = 160;
  protected int imgY = 40;
  protected int imgW = 380;
  protected int imgH = 520;
  protected String[] partNames = { "Femur", "Tibia", "Patella", "ACL", "PCL", "Meniscus", "Cartilage" };
  protected String[] partInfo  = {
    "The thigh bone. The large upper bone that forms the top half of the knee joint.",
    "The shin bone. Forms the lower platform of the knee joint.",
    "The kneecap. The pink/red triangular structure at the top of the joint.",
    "Anterior Cruciate Ligament. The crossing white band running front to back, most commonly torn.",
    "Posterior Cruciate Ligament. The second crossing band, running behind the ACL.",
    "The two blue-grey pads on each side of the joint that cushion and stabilise the knee.",
    "The smooth white tissue lining the joint surfaces, reducing friction between bones."
  };

  AnatomyTab() {
    super("Anatomy");
    kneeImg = loadImage("acl.jpg");
  }

  void draw() {
    drawPanels();
    drawTitle();
    image(kneeImg, imgX, imgY, imgW, imgH);
    drawHighlight();
    drawInfoPanel();
  }

  void drawTitle() {
    fill(255);
    textSize(15);
    textAlign(CENTER, TOP);
    text("Knee Anatomy (Front View)", imgX + imgW/2, 12);
    fill(160);
    textSize(11);
    text("hover over a part to learn more", imgX + imgW/2, 30);
  }

  boolean overZone(int mx, int my, float zx, float zy, float zw, float zh) {
    return mx > imgX + zx && mx < imgX + zx + zw && my > imgY + zy && my < imgY + zy + zh;
  }

  void drawHighlight() {
    if (hoveredPart.equals("")) return;
    noFill();
    stroke(255, 220, 80, 180);
    strokeWeight(2);
    if (hoveredPart.equals("Femur")) {
      rect(imgX + 100, imgY +   0, 180, 160, 6);
    }
    if (hoveredPart.equals("Patella")){
      rect(imgX + 140, imgY +  60, 100,  80, 6);
    }
    if (hoveredPart.equals("ACL")){
      rect(imgX + 150, imgY + 140,  80, 120, 6);
    }
    if (hoveredPart.equals("PCL")){
      rect(imgX + 160, imgY + 160,  60, 100, 6);
    }       
    if (hoveredPart.equals("Cartilage")){
      rect(imgX +  80, imgY + 170, 220,  30, 6);
    }
    if (hoveredPart.equals("Meniscus")){
      rect(imgX +  60, imgY + 190, 260,  80, 6);
    }
    if (hoveredPart.equals("Tibia")){
      rect(imgX +  80, imgY + 320, 220, 200, 6);
    }
  }

  void drawInfoPanel() {
    int px = 570;
    int py = 60;
    int pw = 200;
    int ph = height - 80;

    fill(255, 255, 255, 18);
    noStroke();
    rect(px, py, pw, ph, 14);

    fill(255);
    textSize(13);
    textAlign(LEFT, TOP);
    text("Part Info", px + 14, py + 14);

    stroke(255, 255, 255, 40);
    strokeWeight(1);
    line(px + 10, py + 34, px + pw - 10, py + 34);

    if (hoveredPart.equals("")) {
      fill(140);
      textSize(11);
      textAlign(CENTER, TOP);
      text("Hover over the knee image", px + pw/2, py + 50);
    } else {
      fill(255, 220, 80);
      textSize(13);
      textAlign(LEFT, TOP);
      text(hoveredPart, px + 14, py + 44);
      fill(200);
      textSize(11);
      text(partInfo[getPartIndex(hoveredPart)], px + 14, py + 68, pw - 28, ph - 90);
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
    if (overZone(x, y, 150, 140,  80, 120)) {
      hoveredPart = "ACL";
    }
    else if (overZone(x, y, 160, 160,  60, 100)) {
      hoveredPart = "PCL";
    }
    else if (overZone(x, y, 140,  60, 100,  80)){
      hoveredPart = "Patella";
    }
    else if (overZone(x, y,  80, 170, 220,  30)){
      hoveredPart = "Cartilage";
    }
    else if (overZone(x, y,  60, 190, 260,  80)) {
      hoveredPart = "Meniscus";
    }
    else if (overZone(x, y, 100,   0, 180, 160)){
      hoveredPart = "Femur";
    }
    else if (overZone(x, y,  80, 320, 220, 200)){
      hoveredPart = "Tibia";
    }
  }

  void onClick(int x, int y) {}
}
