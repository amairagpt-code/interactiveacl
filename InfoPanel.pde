class InfoPanel implements IInfoDisplay {
  private String[] partNames;
  private String[] partInfo;
  private String hoveredPart;

  private int px, py, pw, ph;

  InfoPanel(int x, int y, int w, int h) {
    this.px = x;
    this.py = y;
    this.pw = w;
    this.ph = h;
    this.hoveredPart = "";

    partNames = new String[] {
      "Femur", "Tibia", "Patella", "ACL", "PCL", "Meniscus", "Cartilage"
    };

    partInfo = new String[] {
      "The thigh bone. The large upper bone that forms the top half of the knee joint.",
      "The shin bone. Forms the lower platform of the knee joint.",
      "The kneecap. Sits at the front of the joint, protecting it from impact.",
      "Anterior Cruciate Ligament. Runs diagonally through the joint — most commonly torn.",
      "Posterior Cruciate Ligament. Runs behind the ACL, preventing backward sliding.",
      "Two blue-grey pads that cushion and stabilise each side of the joint.",
      "Smooth tissue covering bone ends, reducing friction between bones."
    };
  }

  void setHoveredPart(String part) {
    this.hoveredPart = part;
  }

  String getHoveredPart() {
    return hoveredPart;
  }

  String getTitle() {
    return hoveredPart.equals("") ? "Part Info" : hoveredPart;
  }

  String getInfo() {
    if (hoveredPart.equals("")) {
      return "Hover over the knee image";
    }
    return partInfo[getPartIndex(hoveredPart)];
  }

  void displayInfo() {
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
      text("Hover over\nthe knee image", px + pw / 2, py + 46);
    } else {
      fill(255, 220, 80);
      textSize(12);
      textAlign(LEFT, TOP);
      text(hoveredPart, px + 12, py + 40);
      fill(200);
      textSize(11);
      text(getInfo(), px + 12, py + 60, pw - 24, ph - 80);
    }
  }

  void draw() {
    displayInfo();
  }

  int getPartIndex(String name) {
    for (int i = 0; i < partNames.length; i++) {
      if (partNames[i].equals(name)) {
        return i;
      }
    }
    return 0;
  }
}
