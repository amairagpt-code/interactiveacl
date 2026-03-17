abstract class TabPanel extends Screen {
  private String title;
  private boolean isVisible;

  TabPanel(String title) {
    super(title);
    this.title = title;
    this.isVisible = false;
  }

  void show() {
    isVisible = true;
  }

  void hide() {
    isVisible = false;
  }

  boolean isVisible() {
    return isVisible;
  }

  String getTitle() {
    return title;
  }

  abstract void draw();
  abstract void onClick(int x, int y);
  abstract void onHover(int x, int y);
}
