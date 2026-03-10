AnatomyTab   anatomyTab;
InjurySimTab simTab;
TabPanel     activeTab;

void setup() {
  size(900, 650);
  anatomyTab = new AnatomyTab();
  simTab     = new InjurySimTab();
  activeTab  = anatomyTab;
}

void draw() {
  background(30, 35, 50);
  activeTab.draw();
}

void mousePressed() {
  if (mouseX < 150) {
    if (mouseY < 40){
      activeTab = anatomyTab;
    }
    else if (mouseY < 80) {
      activeTab = simTab;
    } 
  }
  activeTab.onClick(mouseX, mouseY);
}

void mouseMoved() {
  activeTab.onHover(mouseX, mouseY);
}
