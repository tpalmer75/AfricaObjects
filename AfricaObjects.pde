/*Libraries*/
import processing.pdf.*;

/* global variables */
PShape baseMap;
String csv[];
String africanData[][];
PFont f;

int margin = 20;
int vectorWidth = 602;
int vectorHeight = 642;
int globalYear = 1997;

ArrayList<Conflict> dataPoints = new ArrayList<Conflict>();

void setup() {


  size(1000, 700);
  baseMap = loadShape("AfricaMap4.svg");
  csv = loadStrings("african_conflicts_short.csv"));
  africanData = new String[csv.length][3];
  textFont(createFont("Proxima Nova", 24));


  for (int i=0; i<csv.length; i++) {
    africanData[i] = csv[i].split(",");
  }


  smooth();

  // populate particle system
  for (int i=0; i<africanData.length; i++) {

    int year = int(africanData[i][0]);

    float graphLong = map(float(africanData[i][2]), -17.8, 51.8, margin, vectorWidth + margin);
    float graphLat = map(float(africanData[i][1]), 37.346, -34.342, margin, vectorHeight + margin);
    int dataDeaths = int(africanData[i][3]);
    
    int radius = 5;

    noStroke();
    fill(#445a6a);

    dataPoints.add(new Conflict(graphLong, graphLat, radius, 0, year, dataDeaths));
  }
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

