class Slider {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider

  Slider (float xp, float yp, int sw, int sh) {
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
  }

  void update() {
    if (mousePressed && mouseIn()) {
      spos = mouseX;
    }
  }



 boolean mouseIn() {
    int w = swidth;
    int h = sheight;
    if (mouseX > xpos && mouseX < xpos+w &&
        mouseY > ypos-h && mouseY < ypos+h) {
          return true;
    } else return false;
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    stroke(1);
    line(spos,ypos+sheight-1,spos, ypos);
  }
  
//returns the position as a percent of slider length
float getPos(){
  return (spos/swidth - .5);
}  

  }