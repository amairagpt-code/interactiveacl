AnatomyTab anatomyTab;
InjurySimTab simTab;
HomeScreen homeScreen;
String screen = "home";

void setup() {
  size(900, 650);
  homeScreen = new HomeScreen();
  anatomyTab = new AnatomyTab();
  simTab = new InjurySimTab();
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
  if (screen == ("home")) {
    homeScreen.onClick(mouseX, mouseY);
  } else if (screen == ("anatomy")) {
    anatomyTab.onViewSelectClick(mouseX, mouseY);
  } else if (screen == ("front") || screen == ("back")) {
    anatomyTab.onClick(mouseX, mouseY);
  } else if (screen == ("injurysim")) {
    simTab.onClick(mouseX, mouseY);
  }
}

void mouseMoved() {
  if (screen == ("home")) {
    homeScreen.onHover(mouseX, mouseY);
  } else if (screen == ("anatomy")) {
    anatomyTab.onViewSelectHover(mouseX, mouseY);
  } else if (screen == ("front") || screen == ("back")) {
    anatomyTab.onHover(mouseX, mouseY);
  }
}
