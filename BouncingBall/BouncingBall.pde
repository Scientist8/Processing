float speedX = 2;
float speedY = 2;
float circleX;
float circleY;

void setup () {
  size (640, 360);
  background (0);
  
  //Spawning position
  circleX = random (width);
  circleY = random (height);
 
}

void draw () {
  background (51);
  fill (102);
  stroke (255);
  ellipse (circleX, circleY, 32, 32);
  
  //Moving elements
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  
  
  //When touches the edges, it turns around
  if (circleX > width || circleX < 0) {
    speedX = speedX * -1;
  }
  if (circleY > height || circleY < 0) {
    speedY = speedY * -1;
  }
}
  
  
  // When clicked it speeds up
  void mousePressed () {
    speedX = speedX * 1.1;
    speedY = speedY * 1.1;
  }
