//Global Varaiables
int appWidth, appHight;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
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
  backgroundX = faceX - faceDiameter*1/2;
  backgroundY = faceY - faceDiameter*1/2; 
  backgroundWidth = faceDiameter;
  backgroundHeight = faceDiameter; 
  //
  //DIVs
  //
} //End setup
//
void draw() {
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight); //Circle ONLY
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
