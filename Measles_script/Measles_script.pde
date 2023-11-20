 //Global Variables
int appWidth, appHeight, smallerDimension;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDimater;
float noseX1, noseY1, noseX2, noseY2, noseX3, noseY3;
float mouthX1, mouthY1, mouthX2, mouthY2, mouthOpen, mouthReset;
float measleX, measleY, measleDiameter;
float button1X, button1Y, button2X, button2Y, button3X, button3Y, buttonSide;
color purple=#2C08FF, yellow = #E9FF00, blackInk=#000000, resetColour=#FFFFFF;
color hoverOverColour=resetColour;
String start="Start", stop="STOP", quit="X";
PFont buttonFont;
Boolean measlesON=false, splashScreen=false;
//
void setup() {
  size( 600, 400);
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  //Ternary Operator
  smallerDimension = (appWidth >= appHeight) ? appHeight : appWidth;
  println("Smaller Dimension is", smallerDimension); //Started as local variable
  //
  //Population
  faceX = appWidth*1/2;
  faceY = appHeight*1/2;
  faceDiameter = smallerDimension;
  backgroundX = faceX - faceDiameter*1/2;
  backgroundY = faceY - faceDiameter*1/2;
  backgroundWidth = faceDiameter;
  backgroundHeight = faceDiameter;
  //the face parts (Eyes, Mouth, Nose, And Mouth)
  leftEyeX = faceX - smallerDimension*1/5;
  leftEyeY = faceY - faceDiameter*1/6.5;
  eyeDimater = faceDiameter*1/6;
  rightEyeX = faceX + faceDiameter*1/5;
  rightEyeY = faceY - faceDiameter*1/6.5;
  noseX1 = faceX;
  noseY1 = rightEyeY;
  noseX2 = leftEyeX;
  noseY2 = faceY + smallerDimension*1/30;
  noseX3 = rightEyeX;
  noseY3 = faceY + smallerDimension*1/30;
  mouthX1 = noseX2;
  mouthY1 = backgroundY+smallerDimension*3/4;
  mouthX2 = noseX3;
  mouthY2 = mouthY1;
  mouthOpen = smallerDimension*1/10;
  mouthReset = smallerDimension/smallerDimension; //1=reset
  buttonFont = createFont("ArialMT", 55);
  //
  //
  //DIVs
  rect( backgroundX, backgroundY, backgroundWidth, backgroundHeight ); //Circle ONLY
  ellipse( faceX, faceY, faceDiameter, faceDiameter );
  //4 Inscribed buttons on the background square not on the circle
  //Solve Isolceles leg length to find rect() width and height
  //2x^2 = radius^2
  buttonSide = smallerDimension/2-sqrt(sq(smallerDimension/2)/2);
  button1X = backgroundX;
  button1Y = backgroundY;
  button2X = backgroundX + faceDiameter - buttonSide;
  button2Y = button1Y;
  button3X = button2X;
  button3Y = backgroundY + faceDiameter - buttonSide;
  //
  rect( button1X, button1Y, buttonSide, buttonSide );
  rect( button2X, button2Y, buttonSide, buttonSide );
  rect( button3X, button3Y, buttonSide, buttonSide );
  println(button1X, smallerDimension, smallerDimension/2, sq( smallerDimension/2 ), sq( smallerDimension/2 ) /2, sqrt( sq( smallerDimension/2 ) /2 ), buttonSide );
  //
} //End setup
//
void draw() {
  if ( splashScreen==false ) background(0);
  if ( splashScreen==true ) measlesProgram();
}
void keyPressed()
{
  if ( key==' ' ) measlesON=true ;//START, SPACE-Bar
  if ( keyCode==BACKSPACE ) measlesON=false; //STOP //Not Needed key==CODED &&
  if ( keyCode==ESC) exit(); //QUIT //key==CODED &&
} // End keyPressed
//
void mousePressed() {
  /*splashScreen=true;
  if ( mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide ) measlesON=true; //START
  if ( mouseX>button2X && mouseX<button2X+buttonSide && mouseY>button2Y && mouseY<button2Y+buttonSide ) measlesON=false; //STOP
  if ( mouseX>button3X && mouseX<button3X+buttonSide && mouseY>button3Y && mouseY<button3Y+buttonSide ) exit(); //QUIT
  */
  splashScreen = true;

  if (mouseX > button1X && mouseX < button1X + buttonSide && mouseY > button1Y && mouseY < button1Y + buttonSide) {
    measlesON = true; // START
  } else if (mouseX > button2X && mouseX < button2X + buttonSide && mouseY > button2Y && mouseY < button2Y + buttonSide) {
    measlesON = false; // STOP

    // Reset the measles by redrawing the face
    redraw();
  } else if (mouseX > button3X && mouseX < button3X + buttonSide && mouseY > button3Y && mouseY < button3Y + buttonSide) {
    exit(); // QUIT
  }
} //End mousePressed
//
//End MAIN Program
