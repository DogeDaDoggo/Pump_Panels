/////////////
///Imports///
/////////////
import processing.io.*;

///////////////
///Variables///
///////////////

//P1 Button Pins//
int buttonPinP1BotRight = 27;
int buttonPinP1BotLeft = 17;
int buttonPinP1TopLeft = 4;
int buttonPinP1TopRight = 3;
int buttonPinP1Center = 2;
//P2 Button Pins//
int buttonPinP2BotRight = 5;
int buttonPinP2BotLeft = 6;
int buttonPinP2TopLeft = 13;
int buttonPinP2TopRight = 19;
int buttonPinP2Center = 26;

//P1 Screen Pos//
int P1BotRightPosX = 0;
int P1BotRightPosY = 128;
int P1BotLeftPosX = 0;
int P1BotLeftPosY = 64;
int P1TopLeftPosX = 64;
int P1TopLeftPosY = 64;
int P1TopRightPosX = 64;
int P1TopRightPosY = 128;
int P1CenterPosX = 0;
int P1CenterPosY = 0;

//P2 Screen Pos//
int P2BotRightPosX = 192;
int P2BotRightPosY = 128;
int P2BotLeftPosX = 192;
int P2BotLeftPosY = 64;
int P2TopLeftPosX = 128;
int P2TopLeftPosY = 64;
int P2TopRightPosX = 128;
int P2TopRightPosY = 128;
int P2CenterPosX = 192;
int P2CenterPosY = 0;

//Brightness//
int pressedBrightness = 255; //Default = 255
int unpressedBrightness = 75; //Default = 75


//Animation Frame Count//
int numFramesCenter = 24;
int numFramesArrows = 12;

//Modes//
int P1mode = 0;
int P2mode = 0;

////////////
///Images///
////////////

//Arrows//
PImage blueArrowBotLeft;
PImage redArrowTopLeft;
PImage center;
PImage redArrowTopRight;
PImage blueArrowBotRight;
//Arrow Image Directories//
String botLeftArrowDir = "Arrows/Bottom_Left.png";
String topLeftArrowDir = "Arrows/Top_Left.png";
String centerDir = "Arrows/Center.png";
String topRightArrowDir = "Arrows/Top_Right.png";
String botRightArrowDir = "Arrows/Bottom_Right.png";

//Test Squares//
PImage blueSquare;
PImage redSquare;
PImage yellowSquare;
//Test Square Directories//
String blueSquareDir = "Test_Squares/blue64x64.jpg";
String redSquareDir = "Test_Squares/red64x64.jpg";
String yellowSquareDir = "Test_Squares/yellow64x64.jpg";

//Custom Images//
PImage cheems;
PImage doge;
PImage screamingDoge;
//Custom Image Directories//
String cheemsDir = "Memes/Cheemsburbger_Low_Res.png";
String dogeDir = "Memes/doge_Low_Res.png";
String screamingDogeDir = "Memes/ScreamingDoge_Low_Res.png";

///////////////////////////////////////////////
///Creating array of images for animation(s)///
///////////////////////////////////////////////
PImage[] bot_Left_Animation = new PImage[numFramesArrows];
PImage[] top_Left_Animation = new PImage[numFramesArrows];
PImage[] center_Animation = new PImage[numFramesCenter];
PImage[] top_Right_Animation = new PImage[numFramesArrows];
PImage[] bot_Right_Animation = new PImage[numFramesArrows];

//Animation Directories//
String botLeftAnimationDir = "Arrow_Animations/Bottom_Left_Panels/Bottom_Left";
String topLeftAnimationDir = "Arrow_Animations/Top_Left_Panels/Top_Left";
String centerAnimationDir = "Arrow_Animations/Center_Panels/Center";
String topRightAnimationDir = "Arrow_Animations/Top_Right_Panels/Top_Right";
String botRightAnimationDir = "Arrow_Animations/Bottom_Right_Panels/Bottom_Right";

void setup()
{
  ////////////////
  ///GPIO Setup///
  ////////////////

  //P1 GPIO//
  GPIO.pinMode(buttonPinP1BotRight, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP1BotLeft, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP1TopLeft, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP1TopRight, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP1Center, GPIO.INPUT_PULLUP);
  //P2 GPIO//
  GPIO.pinMode(buttonPinP2BotRight, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP2BotLeft, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP2TopLeft, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP2TopRight, GPIO.INPUT_PULLUP);
  GPIO.pinMode(buttonPinP2Center, GPIO.INPUT_PULLUP);

  ///////////////////////////////
  ///Setting up window/display///
  ///////////////////////////////
  fullScreen();
  noCursor();
  background(0, 0, 0);
  frameRate(24);

  ///////////////////////
  ///Preloading Images///
  ///////////////////////

  //Arrow Images//
  blueArrowBotLeft = loadImage(botLeftArrowDir);
  redArrowTopLeft = loadImage(topLeftArrowDir);
  center = loadImage(centerDir);
  redArrowTopRight = loadImage(topRightArrowDir);  
  blueArrowBotRight = loadImage(botRightArrowDir);
  
  //Test Squares//
  blueSquare = loadImage(blueSquareDir);
  redSquare = loadImage(redSquareDir);
  yellowSquare = loadImage(yellowSquareDir);
  
  //Custom Images//
  cheems = loadImage(cheemsDir);
  doge = loadImage(dogeDir);
  screamingDoge = loadImage(screamingDogeDir);


  /////////////////////////////////////
  ///Preloading Images for animation///
  /////////////////////////////////////
  animationPreLoad(numFramesArrows, bot_Left_Animation, botLeftAnimationDir);
  animationPreLoad(numFramesArrows, top_Left_Animation, topLeftAnimationDir);
  animationPreLoad(numFramesCenter, center_Animation, centerAnimationDir);
  animationPreLoad(numFramesArrows, top_Right_Animation, topRightAnimationDir);
  animationPreLoad(numFramesArrows, bot_Right_Animation, botRightAnimationDir);
  
}

//////////////////////////////
/////////Main Loop////////////
/////////////////////////////
void draw()
{
  clear();  //Clears screen for next frames
  
  /////////////////////////////////////////
  ////////////////Player 1////////////////
  ////////////////////////////////////////
  switch(P1mode)
  {
    //Test Square Images//
    case 1:
      p1ImageHandler(redSquare, redSquare,
                     redSquare, redSquare,
                     yellowSquare, yellowSquare,
                     blueSquare, blueSquare,
                     blueSquare, blueSquare);
    break;
    
    //Cheems to Doge//
    case 2:
      p1ImageHandler(doge, cheems,
                     doge, cheems,
                     doge, cheems,
                     doge, cheems,
                     doge, cheems);   
    break;
    
    //Default Arrow Images//
    default:
      p1ImageHandler(top_Left_Animation[frameCount%numFramesArrows], redArrowTopLeft,
                     top_Right_Animation[frameCount%numFramesArrows], redArrowTopRight,
                     center_Animation[frameCount%numFramesCenter], center,
                     bot_Left_Animation[frameCount%numFramesArrows], blueArrowBotLeft,
                     bot_Right_Animation[frameCount%numFramesArrows], blueArrowBotRight);
  }
  
  /////////////////////////////////////////
  ////////////////Player 2////////////////
  ////////////////////////////////////////
  switch(P2mode)
  {
    //Test Square Images//
    case 1:
      p2ImageHandler(redSquare, redSquare,
                     redSquare, redSquare,
                     yellowSquare, yellowSquare,
                     blueSquare, blueSquare,
                     blueSquare, blueSquare);  
    break;
    
    //Cheems to Doge//
    case 2:
      p2ImageHandler(doge, cheems,
                     doge, cheems,
                     doge, cheems,
                     doge, cheems,
                     doge, cheems);    
    break;
    
    //Default Arrow Images//
    default:
      p2ImageHandler(top_Left_Animation[frameCount%numFramesArrows], redArrowTopLeft,
                     top_Right_Animation[frameCount%numFramesArrows], redArrowTopRight,
                     center_Animation[frameCount%numFramesCenter], center,
                     bot_Left_Animation[frameCount%numFramesArrows], blueArrowBotLeft,
                     bot_Right_Animation[frameCount%numFramesArrows], blueArrowBotRight);
  }
  
}

///////////////////////////////
//Method for Button Handling///
///////////////////////////////
void buttonHandler(int pin, PImage pressedArrowImage, PImage unpressedArrowImage, int posX, int posY)
{
  if (GPIO.digitalRead(pin)==GPIO.LOW)
  {
    tint(pressedBrightness);
    image(pressedArrowImage, posX, posY);
  } 
  else
  {
    tint(unpressedBrightness);
    image(unpressedArrowImage, posX, posY);
  }
}

///////////////////////////////
///////P1 Image Handler////////
///////////////////////////////
void p1ImageHandler(PImage topLeftPressed, PImage topLeftUnPressed, 
                    PImage topRightPressed, PImage topRightUnPressed,
                    PImage centerPressed, PImage centerUnPressed,
                    PImage botLeftPressed, PImage botLeftUnPressed,
                    PImage botRightPressed, PImage botRightUnPressed)
{
  buttonHandler(buttonPinP1TopLeft, topLeftPressed, topLeftUnPressed, P1TopLeftPosX, P1TopLeftPosY);
  buttonHandler(buttonPinP1TopRight, topRightPressed, topRightUnPressed, P1TopRightPosX, P1TopRightPosY);
  buttonHandler(buttonPinP1Center, centerPressed, centerUnPressed, P1CenterPosX, P1CenterPosY);
  buttonHandler(buttonPinP1BotLeft, botLeftPressed, botLeftUnPressed, P1BotLeftPosX, P1BotLeftPosY);
  buttonHandler(buttonPinP1BotRight, botRightPressed, botRightUnPressed, P1BotRightPosX, P1BotRightPosY);  
}

///////////////////////////////
///////P2 Image Handler////////
///////////////////////////////
void p2ImageHandler(PImage topLeftPressed, PImage topLeftUnPressed, 
                    PImage topRightPressed, PImage topRightUnPressed,
                    PImage centerPressed, PImage centerUnPressed,
                    PImage botLeftPressed, PImage botLeftUnPressed,
                    PImage botRightPressed, PImage botRightUnPressed)
{
  buttonHandler(buttonPinP2TopLeft, topLeftPressed, topLeftUnPressed, P2TopLeftPosX, P2TopLeftPosY);
  buttonHandler(buttonPinP2TopRight, topRightPressed, topRightUnPressed, P2TopRightPosX, P2TopRightPosY);
  buttonHandler(buttonPinP2Center, centerPressed, centerUnPressed, P2CenterPosX, P2CenterPosY);
  buttonHandler(buttonPinP2BotLeft, botLeftPressed, botLeftUnPressed, P2BotLeftPosX, P2BotLeftPosY);
  buttonHandler(buttonPinP2BotRight, botRightPressed, botRightUnPressed, P2BotRightPosX, P2BotRightPosY);  
}


//////////////////////////////////////
//Method for Pre-loading Animations///
/////////////////////////////////////
void animationPreLoad(int numOfFrames, PImage[] animationArray, String directory)
{
  for (int i = 0; i<numOfFrames; i++)
  {
    animationArray[i] = loadImage(directory + i +".png");
  }
}

//////////////////////////////////////
///////////Keyboard Handler///////////
/////////////////////////////////////
void keyPressed()
{
  switch(key)
  {
    //Player 1//
    case '1':
    P1mode = 0;
    break;
    
    case '2':
    P1mode = 1;
    break;
    
    case '3':
    P1mode = 2;
    break;
    
    //Player 2//
    case 'q':
    case 'Q':
    P2mode = 0;
    break;
    
    case 'w':
    case 'W':
    P2mode = 1;
    break;
    
    case 'e':
    case 'E':
    P2mode = 2;
    break;
    
    default:
    P1mode = 0;
    P2mode = 0;
  }
}
