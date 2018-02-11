class Slider {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos;    // x position of slider
  String leftLbl = "SLOWER";
  String rightLbl = "FASTER";
  String middleLbl = "";
  color textColor = color(0,0,0);

  Slider (float xp, float yp, int sw, int sh) {
      swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
  }

  void update() {

    if (mousePressed && mouseIn() && mouseButton == LEFT) {
      spos = mouseX;
    }
  }



 boolean mouseIn() {
    int w = swidth;
    int h = sheight;
    if (mouseX >= xpos && mouseX <= xpos+w &&
        mouseY >= ypos-h && mouseY <= ypos+h) {
          return true;
    } else return false;
  }

  void display() {
    textSize(sheight);
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    stroke(1);
    fill(0);
    line(spos,ypos+sheight-1,spos, ypos);
    textAlign(RIGHT);
    text(leftLbl,xpos-leftLbl.length(),ypos + sheight);
    textAlign(LEFT);
    text(rightLbl,xpos + swidth + leftLbl.length(),ypos + sheight);
    textAlign(CENTER);
    fill(textColor);
    text("WPM:"+wpm,width/2,ypos + sheight);
  }
  
//returns the position as a percent of slider length
float getSldPos(){
  float sxpos = spos-xpos;
  return (sxpos/swidth);
}  

void setMiddleLbl(String newText){
  middleLbl = newText;
}
void setTextColor(color newColor){
  textColor = newColor;
}

  }