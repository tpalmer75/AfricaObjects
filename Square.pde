class Square extends Shape {

  // properties

  // constructor

  Square(float objX, float objY, float objWidth, int timeIn) {
    super(objX, objY, objWidth, objWidth, timeIn);
    rectMode(CENTER);
  }

  Square(float objX, float objY, float objWidth, float objHeight, color objFill, int timeIn) {
    super(objX, objY, objWidth, objHeight, timeIn);
    rectMode(CENTER);
  }

  // methods
  void display() {

    _show = _countdown.isFinished();
    if (_show) {
      boolean over = mouseOver();

      if (_showRollover) {
        println(over);
        if (over) {
          fill(_red);
        } 
        else {
          fill(_objFill);
        }
      } 
      else {
        fill(_objFill);
      }
      rect(_objX, _objY, _objWidth, _objHeight);
    }
  }

  boolean mouseOver() {
    boolean mouseOver = false;
    int hitAreaOffset = 5;
    float hitAreaWidth = (_objWidth / 2) + hitAreaOffset;
    float hitAreaHeight = (_objHeight / 2) + hitAreaOffset;

    if ((mouseX > (_objX - hitAreaWidth)) && (mouseX < (_objX + hitAreaWidth)) && (mouseY > (_objY - hitAreaHeight)) && (mouseY < (_objY + hitAreaHeight))) {
      mouseOver = true;
      super.setOver(true);
    } 
    else {
      mouseOver = false;
      super.setOver(false);
    }

    return mouseOver;
  }
}

