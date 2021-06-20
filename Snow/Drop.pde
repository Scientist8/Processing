class Drop {
  float x = random(width);
  float y = random (-500, -100);
  float elliR1 = random (5, 10);
  float z = random (0, 20);
  float len = map (z, 0, 20, 10, 20);
  float yspeed = map (z, 0, 20, 1, 10);
  
  void fall () {
    y = y + yspeed;
    float grav = map (z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;
   
    if ( y > height) {
      y = random (-200, -100);
      yspeed = map (z, 0, 20, 1, 10);
    }
    
  }
  
  void show () {
    float thick = map (z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke (255);
    fill (255);
    ellipse (x, y, elliR1, elliR1);
  
  }

}
