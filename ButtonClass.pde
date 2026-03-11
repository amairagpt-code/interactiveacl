abstract class Button implements IButton {
  protected float x, y, w, h;
  protected String label;
  protected boolean active;

  Button(float x, float y, float w, float h, String label) {
    this.x      = x;
    this.y      = y;
    this.w      = w;
    this.h      = h;
    this.label  = label;
    this.active = false;
  }

  boolean isHovered(int mx, int my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }

  void setActive(boolean a) { active = a; }
  String getLabel()         { return label; }

  abstract void draw();
  abstract void onClick();
}
