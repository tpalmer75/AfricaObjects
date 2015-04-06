/*Libraries*/
import processing.pdf.*;

/* global variables */
PShape baseMap;

int margin = 20;
int vectorWidth = 602; // to keep svg aspect ratio
int vectorHeight = 642; // to keep svg aspect ratio
int globalYear = 1997;

ArrayList<Conflict> dataPoints = new ArrayList<Conflict>();

void setup() {

  size(1000, 700);
  baseMap = loadShape("AfricaMap4.svg");
  textFont(createFont("Proxima Nova", 24));
  smooth();

  // Loop through CSV files
  //for (int yr = 1997;yr < 2014; yr ++) {
  populateSet(1997);
  //}
}

// Show points on key release
void keyReleased() {
  if (keyCode == RIGHT && globalYear < 2014) {
    globalYear ++;
  } else if (keyCode == LEFT && globalYear > 1997) {
    globalYear --;
  }
}

void draw() {
  background(#162228);
  shape(baseMap, margin, margin, vectorWidth, vectorHeight);


  // loading in the data
  for (int i=0; i<dataPoints.size (); i++) {
      Conflict tempRef = dataPoints.get(i);
      tempRef.checkYear();
   }


  fill(#999999);
  textSize(24);
  text(globalYear, 40, height - 40);
}

void populateSet(int setYear) {
  String csv[];
  String africanData[][];

  int mLength; // to keep old code from breaking

  switch(setYear) {
  case 1997:
    csv = loadStrings("ac_1997.csv");
    africanData = new String[csv.length][3];

    for (int i=0; i<csv.length; i++) {
      africanData[i] = csv[i].split(",");
    }

    for (int i=0; i<africanData.length; i++) {

      int year = int(africanData[i][0]);

      float graphLong = map(float(africanData[i][2]), -17.8, 51.8, margin, vectorWidth + margin);
      float graphLat = map(float(africanData[i][1]), 37.346, -34.342, margin, vectorHeight + margin);
      int dataDeaths = int(africanData[i][3]);

      int radius = 5;

      noStroke();
      fill(#445a6a);

      dataPoints.add(new Conflict(graphLong, graphLat, radius, 0, year, dataDeaths));
      println("loading line " + dataPoints.size());
    }

    break;
  case 2: 
    mLength = 28;
    break;
  case 3:
    mLength = 31;
    break;
  case 4:
    mLength = 30;
    break;
  case 5:
    mLength = 31;
    break;
  case 6:
    mLength = 30;
    break;
  case 7:
    mLength = 31;
    break;
  case 8:
    mLength = 31;
    break;
  case 9:
    mLength = 30;
    break;
  case 10:
    mLength = 31;
    break;
  case 11:
    mLength = 30;
    break;
  case 12:
    mLength = 31;
    break;
  }
}

