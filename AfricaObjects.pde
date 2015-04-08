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
  for (int yr = 1997; yr <= 2014; yr++) {
    loadYear(yr);
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

void loadYear(int setYear) {
  String tempFile;

  switch(setYear) {
  case 1997:
    tempFile = "ac_1997.csv";
    populateSet(tempFile);


    break;
  case 1998: {
    tempFile = "ac_1998.csv";
    populateSet(tempFile);

    break;
  }
  case 1999: {
    tempFile = "ac_1999.csv";
    populateSet(tempFile);

    break;
  }
  case 2000: {
    tempFile = "ac_2000.csv";
    populateSet(tempFile);

    break;
  }
  case 2001: 
    tempFile = "ac_2001.csv";
    populateSet(tempFile);

    break;
  }
}

void populateSet(String fileLocation) {
  String africanData[][];
  String csv[];

  csv = loadStrings(fileLocation);

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
}

