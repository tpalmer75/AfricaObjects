class Shape {

  // properties
  boolean _show, _showHitArea, _showRollover, _over;
  color _black, _red, _objFill;
  float _objX, _objY, _objWidth, _objHeight, _easing, _objLon, _objLat, _opacity, _latStart, _latEnd, _lonStart, _lonEnd;
  int _countToShow;
  PVector position;
  Timer _countdown;

  int _index;

  // orbit variables

  float _orbitSpeed;
  float _orbitX, _orbitY, _orbitRadius;

  float _objLeaderX, _objLeaderY;
  float _objAngle;
  boolean _setAngle;

  // constructor

  Shape(int index, float objX, float objY, float objWidth, float objHeight, int timeIn) {

    // set rollover default to true
    _showRollover = true; 

    _over = false;

    _index = index;

    _latStart = 90.0;
    _latEnd = -90.0;
    _lonStart = -180.0;
    _lonEnd = 180.0;

    position = new PVector(objX, objY, 0.0);

    _countToShow = timeIn;
    _show = false;
    _objX = objX;
    _objY = objY;
    _objWidth = objWidth;
    _objHeight = objHeight;
    _objFill = _black; 
    _opacity = 10.0;
    _easing = 0.1; // _easing range or 0.1 to 0.05
    _countdown = new Timer(_countToShow);
    _countdown.startTimer();

    _showHitArea = true;

    _black = color(0, 0, 0, 100);
    _red = color(0, 100, 100, 100);

    noStroke();
  }


  Shape(float objX, float objY, float objWidth, float objHeight, int timeIn) {

    // set rollover default to true
    _showRollover = true; 

    _over = false;

    _index = 0;

    _latStart = 90.0;
    _latEnd = -90.0;
    _lonStart = -180.0;
    _lonEnd = 180.0;

    position = new PVector(objX, objY, 0.0);

    _countToShow = timeIn;
    _show = false;
    _objX = objX;
    _objY = objY;
    _objWidth = objWidth;
    _objHeight = objHeight;
    _objFill = _black; 
    _opacity = 10.0;
    _easing = 0.1; // _easing range or 0.1 to 0.05
    _countdown = new Timer(_countToShow);
    _countdown.startTimer();

    _showHitArea = true;

    _black = color(0, 0, 0, 100);
    _red = color(0, 100, 100, 100);

    noStroke();
  }

  // methods

  void display() {
  }

  void setIndex(int index) {
    _index = index;
  }

  int getIndex() {
    return _index;
  }

  void setPosition(float x, float y) {
    position.x = x;
    position.y = y;
  }

  void scaleXY(int w, int h) {
    float dw = w - _objWidth;
    float dh = h - _objHeight;
    if (abs(dw) > 1) {
      _objWidth += dw * _easing;
    }
    if (abs(dh) > 1) {
      _objHeight += dh * _easing;
    }
  }

  void scaleX(int w) {

    float dw = w - _objWidth;
    if (abs(dw) > 1) {
      _objWidth += dw * _easing;
    }
  }

  void scaleY(int h) {
    float dh = h - _objHeight;
    if (abs(dh) > 1) {
      _objHeight += dh * _easing;
    } else {
      _objHeight = h;
    }
  }

  void fadeTo(int t) {

    float dt = t - _opacity;

    float hValue = hue(_objFill);
    float sValue = saturation(_objFill);
    float bValue = brightness(_objFill);

    if (abs(dt) > 1) {
      _opacity += dt * 0.05;
      _objFill = color(hValue, sValue, bValue, int(_opacity));
    }
  }

  void setOrbit(float orbitX, float orbitY, float orbitRadius, float orbitSpeed) {
    _orbitX = orbitX; 
    _orbitY = orbitY; 
    _orbitRadius = orbitRadius;
    _orbitSpeed = orbitSpeed;
  }

  void orbit() {
    float t = millis()/_orbitSpeed;
    _objX = (int)(_orbitX + _orbitRadius * cos(t));
    _objY = (int)(_orbitY + _orbitRadius * sin(t));

    _objLeaderX= (int)(_orbitX + _orbitRadius * cos(t + 0.1));
    _objLeaderY= (int)(_orbitY + _orbitRadius * sin(t + 0.1));

    float dx = _objLeaderX - _objX;
    float dy = _objLeaderY - _objY;

    _objAngle = atan2(dy, dx);
    // println("_objAngle: " + _objAngle);
  }

  boolean isClicked() {
    if (_over) {
      println("clicked by: " + this);
    }
    return _over;
  }

  void setOver(boolean over) {
    _over = over;
    //    setCursor();
  }

  void setCursor(int cursor) {
    cursor(cursor);
  }

  void moveXY(int x, int y) {
    float dx = x - _objX;
    float dy = y - _objY;
    if (abs(dx) > 1) {
      _objX += dx * _easing;
    }
    if (abs(dy) > 1) {
      _objY += dy * _easing;
    }
  }

  void setLatLon(float objLat, float objLon) {
    _objLat = objLat;
    _objLon = objLon;
  } 

  void setGPSFocus(float xStart, float xEnd, float yStart, float yEnd) {
    _lonStart = xStart;
    _lonEnd = xEnd;
    _latStart = yStart;
    _latEnd = yEnd;
  }

  void setGPS(int xStart, int xEnd, int yStart, int yEnd) {
    _objX = map(_objLon, _lonStart, _lonEnd, xStart, xEnd);
    _objY = map(_objLat, _latStart, _latEnd, yStart, yEnd);

    // set the position to fix mouseOver()
    setPosition(_objX, _objY);
  }

  void setWidth(float objWidth) {
    _objWidth = objWidth;
  }

  void setHeight(float objHeight) {
    _objHeight = objHeight;
  }

  void setXY(float objX, float objY) {
    _objX = objX;
    _objY = objY;
  }

  float getX() {
    return _objX;
  }

  float getY() {
    return _objY;
  }

  float getWidth() {
    return _objWidth;
  }

  float getHeight() {
    return _objHeight;
  }

  void setRollover(boolean showRollover) {
    _showRollover = showRollover;
  }
}

