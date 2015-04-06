class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  PFont _font;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;

    PFont font;
    // The font must be located in the sketch's 
    // "data" directory to load successfully
    _font = loadFont("SansSerif-24.vlw");
    textFont(_font, 24);
  }

  // Starting the timer
  void startTimer() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }


  // The function isFinished() returns true if 5,000 ms have passed. 
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }

  float getSeconds() { 
    float passedTime = millis()- savedTime;
    fill(200);
    text(nf(passedTime/1000, 3, 1), 10, 30);
    return passedTime;
  }
}

