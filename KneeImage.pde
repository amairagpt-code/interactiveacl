class KneeImage {
  private PImage imgFront;
  private PImage imgBack;
  private PImage currentImg;
  private String currentView;
  private int imgX, imgY, imgW, imgH;

  KneeImage(int x, int y, int w, int h) {
    this.imgX = x;
    this.imgY = y;
    this.imgW = w;
    this.imgH = h;
    this.currentView = "front";

    imgFront = loadImage("acl_front.jpg");
    imgBack  = loadImage("acl_back.png");
    currentImg = imgFront;
  }

  void setView(String view) {
    this.currentView = view;
    if (view.equals("front")) {
      currentImg = imgFront;
    } else {
      currentImg = imgBack;
    }
  }

  String getView() {
    return currentView;
  }

  void draw() {
    if (currentImg != null) {
      image(currentImg, imgX, imgY, imgW, imgH);
    }
  }

  void drawHighlight(String hoveredPart) {
    if (hoveredPart.equals("")) {
      return;
    }
    noFill();
    stroke(255, 220, 80, 180);
    strokeWeight(2);

    if (currentView.equals("front")) {
      if (hoveredPart.equals("Femur")) {
        rect(imgX + 100, imgY +   0, 180, 160, 6);
      }
      if (hoveredPart.equals("Patella")) {
        rect(imgX + 140, imgY +  60, 100,  80, 6);
      }
      if (hoveredPart.equals("ACL")) {
        rect(imgX + 150, imgY + 140,  80, 120, 6);
      }
      if (hoveredPart.equals("PCL")) {
        rect(imgX + 160, imgY + 160,  60, 100, 6);
      }
      if (hoveredPart.equals("Cartilage")) {
        rect(imgX +  80, imgY + 170, 220,  30, 6);
      }
      if (hoveredPart.equals("Meniscus")) {
        rect(imgX +  60, imgY + 190, 260,  80, 6);
      }
      if (hoveredPart.equals("Tibia")) {
        rect(imgX +  80, imgY + 320, 220, 200, 6);
      }
    } else {
      if (hoveredPart.equals("Femur")) {
        rect(imgX + 100, imgY +   0, 180, 180, 6);
      }
      if (hoveredPart.equals("Tibia")) {
        rect(imgX +  80, imgY + 320, 220, 180, 6);
      }
      if (hoveredPart.equals("PCL")) {
        rect(imgX + 150, imgY + 160,  80, 120, 6);
      }
      if (hoveredPart.equals("Meniscus")) {
        rect(imgX +  60, imgY + 200, 260,  80, 6);
      }
    }
  }

  String getHoveredPart(int mx, int my) {
    if (currentView.equals("front")) {
      if (overZone(mx, my, 150, 140,  80, 120)) {
        return "ACL";
      } else if (overZone(mx, my, 160, 160,  60, 100)) {
        return "PCL";
      } else if (overZone(mx, my, 140,  60, 100,  80)) {
        return "Patella";
      } else if (overZone(mx, my,  80, 170, 220,  30)) {
        return "Cartilage";
      } else if (overZone(mx, my,  60, 190, 260,  80)) {
        return "Meniscus";
      } else if (overZone(mx, my, 100,   0, 180, 160)) {
        return "Femur";
      } else if (overZone(mx, my,  80, 320, 220, 200)) {
        return "Tibia";
      }
    } else {
      if (overZone(mx, my, 150, 160,  80, 120)) {
        return "PCL";
      } else if (overZone(mx, my,  60, 200, 260,  80)) {
        return "Meniscus";
      } else if (overZone(mx, my, 100,   0, 180, 180)) {
        return "Femur";
      } else if (overZone(mx, my,  80, 320, 220, 180)) {
        return "Tibia";
      }
    }
    return "";
  }

  private boolean overZone(int mx, int my, float zx, float zy, float zw, float zh) {
    return mx > imgX + zx && mx < imgX + zx + zw && my > imgY + zy && my < imgY + zy + zh;
  }
}
