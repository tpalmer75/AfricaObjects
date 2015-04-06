class Artwork extends Shape {

  // properties
  PShape _up, _over;
  String _upSource, _overSource;

  // constructor

  Artwork(String upSource, String overSource, float objWidth, float objHeight) {

    super(0, 0, objWidth, objHeight, 1000);

    _upSource = upSource;
    _overSource = overSource;
    _up = loadShape(_upSource);
    _over = loadShape(_overSource);
  }

  // methods
  void display() {
    //    println(_objX + ", " +  _objY);
    _show = _countdown.isFinished();
    if (_show) {
      boolean over = mouseOver();
      if (over) {
        shape(_over, _objX, _objY, _objWidth, _objHeight);
      } 
      else {
        shape(_up, _objX, _objY, _objWidth, _objHeight);
      }
    }
  }

  boolean mouseOver() {
    boolean mouseOver = false;
    int hitAreaOffset = 5;
    float hitAreaWidth = _objWidth + hitAreaOffset;
    float hitAreaHeight = _objHeight + hitAreaOffset;

    if ((mouseX > _objX) && (mouseX < (_objX + hitAreaWidth)) && (mouseY > _objY) && (mouseY < (_objY + hitAreaHeight))) {
      mouseOver = true;
    }

    return mouseOver;
  }
}

