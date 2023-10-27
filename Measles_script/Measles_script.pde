//Global Varaiables
int appWidth, appHight;
float faceX, faceY, faceDiameter;
 //
  void setup() {
  //fullscreen;
  size(800, 600);
  appWidth = width; //display width
  appHight = height; //display height
  //Ternary Operator
  int smallerDimension = (appWidth >= appHight) ? appHight : appWidth;
  println("Smaller Dimension is", smallerDimension);
  // 
  //population
  faceX = appWidth*1/2;
  faceY = appHight*1/2;
  faceDiameter = smallerDimension;
  //
} //End setup
//
  void draw() {
  ellipse( faceX, faceY, faceDiameter, faceDiameter );
} //End draw
//
  void keyPressed() {

} //End keyPressed
//
  void mousePressed() {

} //End mousePressed
//
//End MAIN Program
