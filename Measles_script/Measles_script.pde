//Global Variables
int appWidth, appHeight, smallerDimension;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDimater;
float noseX1, noseY1, noseX2, noseY2, noseX3, noseY3;
float mouthX1, mouthY1, mouthX2, mouthY2, mouthOpen, mouthReset;
float measleX, measleY, measleDiameter;
float button1X, button1Y, button2X, button2Y, button3X, button3Y, buttonSide;
color resetColour = #FFFFFF, purple = #2C08FF, yellow = #E9FF00, blackInk=#000000;
color hoverOverColour=resetColour;
String start="Start", stop="STOP", quit="X";
PFont buttonFont;
//
void setup() {
  //fullscreen:
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
  measleX = random( 0, appWidth);
  measleY = random( 0, appHeight);
  measleDiameter = random( smallerDimension*1/50, smallerDimension*1/30);
  buttonFont = createFont("Harrington", 55);
  //
  //
  //DIVs
  rect( backgroundX, backgroundY, backgroundWidth, backgroundHeight ); //Circle ONLY
  ellipse( faceX, faceY, faceDiameter, faceDiameter );
  //4 Inscribed buttons on the background square not on the circle
  //Solve Isolceles leg length to find rect() width and height
  //2x^2 = radius^2
  buttonSide = smallerDimension/2-sqrt(sq(smallerDimension/2)/2);
  button1X= backgroundX;
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
  //Text Code

  println(button1X, mouseX, button1X+buttonSide, hoverOverColour);
  if ( mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide ) { //Buton 1
    println("here");
    hoverOverColour = yellow;
    fill( hoverOverColour );
    rect( button1X, button1Y, buttonSide, buttonSide );
    fill( resetColour );
  } else if ( mouseX>button2X && mouseX<button2X+buttonSide && mouseY>button2Y && mouseY<button2Y+buttonSide ) { //Button 2
    hoverOverColour = yellow;
    fill( hoverOverColour );
    rect( button2X, button2Y, buttonSide, buttonSide );
  } else if ( mouseX>button3X && mouseX<button3X+buttonSide && mouseY>button3Y && mouseY<button3Y+buttonSide ) { //button 3
    hoverOverColour = purple;
    fill( hoverOverColour );
    rect( button3X, button3Y, buttonSide, buttonSide );
  } else { //No Buttons
    hoverOverColour = resetColour;
    fill( hoverOverColour );
    rect( button1X, button1Y, buttonSide, buttonSide );
    rect( button2X, button2Y, buttonSide, buttonSide );
    rect( button3X, button3Y, buttonSide, buttonSide );
  }
  //
  fill(blackInk);
  textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  int size = 21;
  textFont(buttonFont, size);
  text( start, button1X, button1Y, buttonSide, buttonSide);
  text( stop, button2X, button2Y, buttonSide, buttonSide);
  text( quit, button3X, button3Y, buttonSide, buttonSide);
  //
  ellipse ( leftEyeX, leftEyeY, eyeDimater, eyeDimater ); //Left Eye
  ellipse ( rightEyeX, rightEyeY, eyeDimater, eyeDimater ); //Right Eye
  triangle( noseX1, noseY1, noseX2, noseY2, noseX3, noseY3 ); //Nose
  strokeWeight(mouthOpen);
  line( mouthX1, mouthY1, mouthX2, mouthY2 ); //mouth
  strokeWeight(mouthReset); //1=reset
  //
  color measleColour = color( 255, random(0, 84), random(0, 103) );
  fill(measleColour);
  measleDiameter = random( smallerDimension*1/100, smallerDimension*1/30 );
  measleX = random( backgroundX+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
  measleY = random( backgroundY+(measleDiameter/2), (backgroundY+backgroundHeight)-(measleDiameter/2) );
  println( "Start", measleX, measleY, measleDiameter );
  if ( measleX <= button1X+buttonSide+(measleDiameter/2) && measleY <= button1Y+buttonSide+(measleDiameter/2)) 
    println("\t\tXhere", measleX, button1X+buttonSide);
    measleX = random( button1X+buttonSide+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
    //
    if ( measleX <= button2X+buttonSide+(measleDiameter/2) && measleY <= button2Y+buttonSide+(measleDiameter/2)) {
      println("\t\tXhere", measleX, button1X+buttonSide);
      measleX = random( button2X+buttonSide+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
    }
    noStroke();
    ellipse( measleX, measleY, measleDiameter, measleDiameter );
    stroke(1); //default is 1
    fill(resetColour);
    //
  } //End draw
  //
  void keyPressed()
  {
    if ( key==' ' ) measlesON=true ;//START, SPACE-Bar
    if ( keyCode==BACKSPACE ) measlesON=false; //STOP
    if ( keyCode==ESC) println("quit"); //QUIT
  } // End keyPressed
  //
  void mousePressed()
  {
   /*
  if(mouseX> mouseX< mouseY> mouseY< ) measlesON=true; //START
     if() println("stop"); //STOP
     if() println("quit"); //QUIT
     */
 } //End mousePressed
 //
  //End MAIN Program
