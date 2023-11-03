//Global Variables
int appWidth, appHeight, smallerDimension;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDimater;
float noseX1, noseY1, noseX2, noseY2, noseX3, noseY3;
float mouthX1, mouthY1, mouthX2, mouthY2, mouthOpen, mouthReset;
float measleX, measleY, measleDiameter;
float button1X, button1Y, buttonSide;
color resetColour=#FFFFFF;
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
  //
  //
  //DIVs
  rect( backgroundX, backgroundY, backgroundWidth, backgroundHeight );
  ellipse( faceX, faceY, faceDiameter, faceDiameter );
  //4 Inscribed buttons on the background square not on the circle
  //Solve Isolceles leg length to find rect() width and height
  //2x^2 = radius^2
  button1X= backgroundX;
  button1Y = backgroundY;
  buttonSide = smallerDimension/2-sqrt(sq(smallerDimension/2)/2);
  //
  rect( button1X, button1Y, buttonSide, buttonSide );
  println(backgroundX, smallerDimension, smallerDimension/2, sq( smallerDimension/2 ), sq( smallerDimension/2 ) /2, sqrt( sq( smallerDimension/2 ) /2 ), smallerDimension/2-sqrt(sq(smallerDimension/2)/2) );
  //
} //End setup
//
void draw() {
  //rect( backgroundX, backgroundY, backgroundWidth, backgroundHeight ); //Circle ONLY
  //ellipse ( faceX, faceY, faceDiameter, faceDiameter );
  ellipse ( leftEyeX, leftEyeY, eyeDimater, eyeDimater ); //Left Eye
  ellipse ( rightEyeX, rightEyeY, eyeDimater, eyeDimater ); //Right Eye
  triangle( noseX1, noseY1, noseX2, noseY2, noseX3, noseY3 ); //Nose
  strokeWeight(mouthOpen); 
  line( mouthX1, mouthY1, mouthX2, mouthY2 ); //mouth
  strokeWeight(mouthReset); //1=reset
   //
   color measleColour = color( 255, random(0, 84), random(0, 103) );
  fill(measleColour);
  measleDiameter = random( smallerDimension*1/100, smallerDimension*1/30);
  measleX = random( (backgroundX) + (measleDiameter/2) , (backgroundX+backgroundWidth) - (measleDiameter/2) );
  while (measleX < button1X+buttonSide ) measleX = random( (backgroundX) + (measleDiameter/2) , (backgroundX+backgroundWidth) - (measleDiameter/2) );
  measleY = random( (backgroundY) + (measleDiameter/2) , (backgroundY+backgroundHeight) - (measleDiameter/2) );
  while (measleY < button1Y+buttonSide ) measleY = random( (backgroundY) + (measleDiameter/2) , (backgroundY+backgroundHeight) - (measleDiameter/2) );
  
  noStroke();
  ellipse( measleX, measleY, measleDiameter, measleDiameter );
  stroke(1); //default is 1 
  fill(resetColour=#FFFFFF);
 //
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
