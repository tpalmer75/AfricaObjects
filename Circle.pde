class Circle extends Shape {

  // properties

  // constructor

  Circle(int timeIn) {
    super(0, 0, 5, 5, timeIn);
  }

  Circle(int index, float objX, float objY, float objWidth, int timeIn) {
    super(index, objX, objY, objWidth, objWidth, timeIn);
  }

  Circle(float objX, float objY, float objWidth, int timeIn) {
    super(objX, objY, objWidth, objWidth, timeIn);
  }

  Circle(float objX, float objY, float objWidth, float objHeight, color objFill, int timeIn) {
    super(objX, objY, objWidth, objHeight, timeIn);
  }

  // methods

  void display() {

    _show = _countdown.isFinished();
    if (_show) {
      if (_showRollover) {
        boolean over = mouseOver();
        if (over) {
          fill(_red);
        } else {
          fill(_objFill);
        }
      } else {
        fill(_objFill);
      }
      ellipse(_objX, _objY, _objWidth, _objHeight);
    }
  }

  boolean mouseOver() {
    boolean mouseOver = false;
    int hitAreaOffset = 5;
    PVector mouse = new PVector(mouseX, mouseY);
    PVector distance = position.get();
    distance.sub(mouse);

    if (distance.mag() < (_objWidth / 2) + hitAreaOffset) { //d is diameter of circle
      mouseOver = true;
    } else {
      mouseOver = false;
    }

    return mouseOver;
  }
}

