abstract class Screen implements IDrawable, IInteractable {
  protected String screenName;

  Screen(String screenName) {
    this.screenName = screenName;
  }

  String getScreenName() {
    return screenName;
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

  abstract void draw();
  abstract void onClick(int x, int y);
  abstract void onHover(int x, int y);
}
