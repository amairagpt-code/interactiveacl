AnatomyTab   anatomyTab;
InjurySimTab simTab;
String       screen = "home";

HomeScreen homeScreen;

void setup() {
  size(900, 650);
  anatomyTab  = new AnatomyTab();
  simTab      = new InjurySimTab();
  homeScreen  = new HomeScreen();
}

void draw() {
  background(22, 27, 42);

  if (screen.equals("home")) {
    homeScreen.draw();
  } else if (screen.equals("anatomy")) {
    anatomyTab.drawViewSelect();
  } else if (screen.equals("front") || screen.equals("back")) {
    anatomyTab.draw();
  } else if (screen.equals("injurysim")) {
    simTab.draw();
  }
}

void mousePressed() {
  if (screen.equals("home")) {
    homeScreen.onClick(mouseX, mouseY);
  } else if (screen.equals("anatomy")) {
    anatomyTab.onViewSelectClick(mouseX, mouseY);
  } else if (screen.equals("front") || screen.equals("back")) {
    anatomyTab.onClick(mouseX, mouseY);
  } else if (screen.equals("injurysim")) {
    simTab.onClick(mouseX, mouseY);
  }
}

void mouseMoved() {
  if (screen.equals("front") || screen.equals("back")) {
    anatomyTab.onHover(mouseX, mouseY);
  } else if (screen.equals("home")) {
    homeScreen.onHover(mouseX, mouseY);
  } else if (screen.equals("anatomy")) {
    anatomyTab.onViewSelectHover(mouseX, mouseY);
  }
}
