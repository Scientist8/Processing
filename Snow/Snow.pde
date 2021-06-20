

Drop [] drops = new Drop[150];


void setup () {
  size (640, 360);
  for (int i = 0; i < drops.length; i++) {
  drops[i] = new Drop ();
  }
}

void draw () {
  background (50);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
    }
}
