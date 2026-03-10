AnatomyTab anatomyTab;
InjurySimTab simTab;
TabPanel activeTab;

void setup() {
  size(900, 650);
  anatomyTab = new AnatomyTab();
  simTab = new InjurySimTab();
  activeTab = anatomyTab;
  activeTab.show();
  anatomyTab.drawtab();
}

void draw() {
  background(30, 35, 50);
  activeTab.draw();
  activeTab.drawPanels();
}
