class ToolTip {

  // properties
  float _objX, _objY;
  String _label;
  PFont _font;
  int _fontSize, _alignment, _fontOpacity;
  color _fontColor;
  color _black, _red, _objFill;

  // constructor
  ToolTip() {
    
    // define default colors
    _black = color(0, 0, 0, 100);
    _red = color(0, 100, 100, 100);
    
    // set default font color
    _fontColor = _black;
    
    // set default label
    _label = "Default";
    
    // set default text alignment (horizontal only)
    setAlignment(CENTER);
    
    // set default font and point size
    _font = loadFont("FedraMonoStd-Book-16.vlw");
    _fontSize = 16;
    textFont(_font, _fontSize);  
  }

  // methods
  void display() {
    fill(_fontColor);
    text(_label, _objX, _objY);
  }

  void setLabel(String label) {
    _label = label;
  }

  void setFont(PFont font) {
    _font = font;
  }

  void setFontSize(int fontSize) {
    _fontSize = fontSize;
  }
  
  void setFontColor(color fontColor) {
    _fontColor = fontColor;
  }

  void setFontOpacity(int fontOpacity) {
    float hValue = hue(_fontColor);
    float sValue = saturation(_fontColor);
    float bValue = brightness(_fontColor);
    float aValue = alpha(_fontColor);
    
    _fontOpacity = fontOpacity;
    _fontColor = color(hValue, sValue, bValue, int(_fontOpacity));
  }

  void setXY(float objX, float objY) {
    _objX = objX;
    _objY = objY;
  }

  void setAlignment(int alignment) {
    _alignment = alignment;
    textAlign(_alignment);
  }

  void fadeTo(int t) {
    float hValue = hue(_fontColor);
    float sValue = saturation(_fontColor);
    float bValue = brightness(_fontColor);
    float aValue = alpha(_fontColor);

    float dt = t - aValue;

    if (abs(dt) > 1) {
      _fontOpacity += dt * 0.05;
      _fontColor = color(hValue, sValue, bValue, int(_fontOpacity));
    }
  }
}

