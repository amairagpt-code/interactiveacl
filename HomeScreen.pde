class HomeScreen {
  NavButton[] buttons;
  int hoveredBtn = -1;

  HomeScreen() {
    buttons = new NavButton[2];
    buttons[0] = new NavButton(width/2 - 220, height/2 - 60, 200, 120, "Anatomy", "Explore knee structure");
    buttons[1] = new NavButton(width/2 +  20, height/2 - 60, 200, 120, "Injury Sim", "Coming soon");
  }

  void draw() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(28);
    text("ACL Knee Simulator", width/2, height/2 - 160);
    fill(140);
    textSize(13);
    text("Select a mode to begin", width/2, height/2 - 125);

    stroke(255, 255, 255, 25);
    strokeWeight(1);
    line(width/2 - 240, height/2 - 100, width/2 + 240, height/2 - 100);

    for (int i = 0; i < buttons.length; i++) {
      buttons[i].draw(hoveredBtn == i);
    }
  }

  void onClick(int mx, int my) {
    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].isHovered(mx, my)) {
        if (i == 0) screen = "anatomy";
      }
    }
  }

  void onHover(int mx, int my) {
    hoveredBtn = -1;
    for (int i = 0; i < buttons.length; i++) {
      if (buttons[i].isHovered(mx, my)) hoveredBtn = i;
    }
  }
}

class NavButton {
  float x, y, w, h;
  String label, sub;

  NavButton(float x, float y, float w, float h, String label, String sub) {
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.label = label; this.sub = sub;
  }

  boolean isHovered(int mx, int my) {
    return mx > x && mx < x+w && my > y && my < y+h;
  }

  void draw(boolean hovered) {
    if (hovered) {
      fill(255, 220, 80);
      stroke(200, 170, 30);
    } else {
      fill(255, 255, 255, 20);
      stroke(255, 255, 255, 50);
    }
    strokeWeight(1.5);
    rect(x, y, w, h, 14);

    fill(hovered ? 30 : 230);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2 - 10);

    fill(hovered ? 80 : 120);
    textSize(11);
    text(sub, x + w/2, y + h/2 + 14);
  }
}
