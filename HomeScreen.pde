class HomeScreen extends Screen {
  private NavButton[] buttons;
  private int hoveredBtn;

  HomeScreen() {
    super("home");
    hoveredBtn = -1;
    buttons = new NavButton[2];
    buttons[0] = new NavButton(width/2 - 220, height/2 - 60, 200, 120,
                               "Anatomy", "Explore knee structure");
    buttons[1] = new NavButton(width/2 +  20, height/2 - 60, 200, 120,
                               "Injury Sim", "Coming soon");
  }

  void draw() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(28);
    text("ACL Knee Simulator", width/2, height/2 - 160);

    fill(180);
    textSize(13);
    text("Select a mode to begin", width/2, height/2 - 125);

    stroke(255, 255, 255, 25);
    strokeWeight(1);
    line(width/2 - 240, height/2 - 100, width/2 + 240, height/2 - 100);

    buttons[0].draw(hoveredBtn == 0);
    buttons[1].draw(hoveredBtn == 1);
  }

  void onClick(int mx, int my) {
    if (buttons[0].isHovered(mx, my)) {
      screen = "anatomy";
    }
  }

  void onHover(int mx, int my) {
    hoveredBtn = -1;
    if (buttons[0].isHovered(mx, my)) {
      hoveredBtn = 0;
    }
    if (buttons[1].isHovered(mx, my)) {
      hoveredBtn = 1;
    }
  }
}

class NavButton {
  private float x, y, w, h;
  private String label, sub;

  NavButton(float x, float y, float w, float h, String label, String sub) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.sub = sub;
  }

  boolean isHovered(int mx, int my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }

  void draw(boolean hovered) {
    if (hovered) {
      fill(255);
      stroke(200);
    } else {
      fill(0);
      stroke(255);
    }
    strokeWeight(1.5);
    rect(x, y, w, h, 14);

    if (hovered) {
      fill(0);
    } else {
      fill(255);
    }
    textSize(16);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2 - 10);

    if (hovered) {
      fill(60);
    } else {
      fill(160);
    }
    textSize(11);
    text(sub, x + w/2, y + h/2 + 14);
  }
}
