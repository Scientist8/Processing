ArrayList <PVector> circles = new ArrayList <PVector> ();
float diameter = 100;

int lineSpeed = 2;
int[] linePosY;
color[] lineColor;
int lineNumber;

void setup() {
  size(1280, 720);
  colorMode(HSB, 360, 100, 100);
  lineNumber = (height * 2) / 10;
  linePosY = new int[lineNumber];
  lineColor = new color[lineNumber];
  for (int i= 0; i < lineNumber; i+=1) {
    linePosY[i] = i * 10;
    lineColor[i] = color(i % 30, 100, 100);
  }
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  rotate(PI/4);
  for (int i = 0; i < lineNumber; i+=1) {
    stroke(lineColor[i]);
    float posX = width/2;
    float posY = -height + linePosY[i];
    line(-posX - 100, posY, posX + 100, posY);
    linePosY[i] += lineSpeed;
    linePosY[i] %= height*2;
  }
  popMatrix();


  noStroke(); 
  addCircle(); 
  for (int i=0; i<circles.size(); i++) {
    PVector p = circles.get(i); 
    fill(i % 360, 100, 100); 
    ellipse(p.x, p.y, p.z, p.z);
  }
  if (diameter < 0.1) {
    println("Done!"); 
  }
}

void mousePressed() {
  removeCircle();
}


void addCircle() {
  PVector c = randomVector(); 
  int tries = 100; 
  while (overlap(c) && tries > 0) {
    c = randomVector(); 
    tries--;
  }
  if (!overlap(c)) {
    circles.add(c);
  } else {
    diameter *= 0.9; 
    addCircle();
  }
}

void removeCircle() {
  for (int i=circles.size()-1; i>=0; i--) {
    PVector p = circles.get(i); 
    if (dist(mouseX, mouseY, p.x, p.y) < p.z*0.5) {
      circles.remove(i);
    }
  }
}

PVector randomVector() {
  return new PVector(random(width), random(height), diameter);
}

boolean overlap(PVector c) {
  for (PVector p : circles) {
    if (dist(c.x, c.y, p.x, p.y) < (c.z + p.z)*0.5) {
      return true;
    }
  }
  return false;
}
