class Conflict extends Circle {

  // constructor

  int _myYear;
  int _myDeaths;

  Conflict(float objX, float objY, float objWidth, int timeIn, int myYear, int myDeaths) {



    super(objX, objY, objWidth, timeIn);

    _myYear = myYear;
    _myDeaths = myDeaths;
  }


  void checkYear() {

    //    println("_myYear: " + _myYear + ", globalYear = " + globalYear + " visible = " + _show);

    _show = _countdown.isFinished();
    if (_show && _myYear <= globalYear) {
      if (_myDeaths == 0) {
        fill(#445a6a);
      } else {
        fill(#FF0000);
      }
      ellipse(_objX, _objY, _objWidth, _objHeight);
    } else {
    }
  }
}

