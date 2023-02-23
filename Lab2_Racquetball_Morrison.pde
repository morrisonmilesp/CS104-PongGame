// Pong 2.0 //

// General Game Variables
int pointCount = 0;
float stage = 0;
PFont bold;

// Initialize Ball variables
float ballX;
float ballY;
int ballDiameter = 50;
float ballR;
float ballG;
float ballB;
float ballStartGap = 25;
float ballSpeedX;
float ballSpeedY;

// Initialize Paddle variables
float paddleX;
int paddleY;
float paddleWidth;
float paddleHeight = 50;
float gameIncrDifficulty = 0.5;


void setup(){
  // Initialize window
  size(1040, 760);
  
  //Set ball direction and start position
  ballMovement();
  
  //Load Font for Startscreen
  bold = loadFont("AlBayan-Bold-60.vlw");
}


void draw(){
  if (stage == 0){
  startscreen();
  }
  
  if (stage == 1){
  game();
  }
}

void startscreen(){
   //Initialize 
   background(57,57,57);
   
    //Title
    rectMode(CORNERS);
    rect(8*width/20,1*height/20,12*width/20,3*height/20);
    fill(57,57,57);
    textFont(bold);
    textSize(60);
    text("PONG", 8.3*width/20,1.45*height/20,12*width/20,3*height/20);
    fill(255);
    
    
    //Directions & Titles
    textSize(50);
    text("Directions", 2.5*width/20,2.3*height/10,9*width/20,4*height/10);
    rect(1*width/20,3*height/10,9*width/20,8*height/10);
    textSize(25);
    fill(57,57,57);
    text("Welcome to Pong.", 1*width/20+10,3*height/10+10,9*width/20,8*height/10);
    text("Keep the ball from hitting the ground. Each hit you get with the paddle earns you one point.", 1*width/20+10,3*height/10+50,9*width/20,8*height/10);
    text("To the right you can select your paddle size. The bigger your paddle the faster the ball starts.", 1*width/20+10,3*height/10+160,9*width/20,8*height/10);
    text("Press your mouse while you play and be dazzeled.", 1*width/20+10,3*height/10+270,9*width/20,8*height/10);
    text("Best of luck.", 1*width/20+10,3*height/10+350,9*width/20,8*height/10);
    textSize(50);
    fill(255);
    text("Size", 2.5*width/20 + 400,2.3*height/10,9*width/20 + 400,4*height/10);
    text("Speed", 2.5*width/20 + 690,2.3*height/10,9*width/20 + 690,4*height/10);
    
    
    //Button One Graphics
    strokeWeight(3);
    stroke(255);
    fill(57,57,57);
    rect(5*width/10,3*height/10,9.5*width/10,4*height/10);
    fill(255);
    text("Slow", 2.5*width/20 + 720,2.3*height/10+75,9*width/20 + 720,4*height/10+75);
    rect(5*width/10 + 20,3*height/10 + 20,5*width/10 + 120,3*height/10 + 50);
    
    //Button Two Grpahics
    fill(57,57,57);
    rect(5*width/10,5*height/10,9.5*width/10,6*height/10);
    fill(255);
    text("Medium", 2.5*width/20 + 650,2.3*height/10 + 225,9*width/20 + 650,4*height/10 + 225);
    rect(5*width/10  + 20,5*height/10 + 20,5*width/10 + 220,5*height/10 + 50);
           
 
    //Button Three Grpahics
    fill(57,57,57);
    rect(5*width/10,7*height/10,9.5*width/10,8*height/10);
    fill(255);
    text("Fast", 2.5*width/20 + 735,2.3*height/10 + 375,9*width/20 + 735,4*height/10 + 375);
    rect(5*width/10 + 20,7*height/10 + 20,5*width/10 + 300,7*height/10 + 50);
    fill(255);
    
    //Button One Action
    if (mouseX>5*width/10 && mouseX<9.5*width/10 && mouseY >= 3*height/10 && mouseY <= 4*height/10 && mousePressed == true){
        //Set desired paddle width and ball speed
        paddleWidth =  100;
        ballSpeedX = width * 4/1040;
        ballSpeedY = height * 4/760;
  
        // Load background frame once so instructions are removed if player continues to press mouse
        background(57,57,57);
  
        stage = 1;
       }
       
     //Button Two Action
     if (mouseX>5*width/10 && mouseX<9.5*width/10 && mouseY >= 5*height/10 && mouseY <= 6*height/10 && mousePressed == true){
        //Set desired paddle width and ball speed
        paddleWidth =  200;
        ballSpeedX = width * 6/1040;
        ballSpeedY = height * 6/760;
  
        // Load background frame once so instructions are removed if player continues to press mouse
        background(57,57,57);
  
        stage = 1;
       }
       
       
     //Button Three Action
     if (mouseX>=5*width/10 && mouseX<=9.5*width/10 && mouseY >= 7*height/10 && mouseY <= 8*height/10 && mousePressed == true){
         //Set desired paddle width and ball speed
         paddleWidth =  300;
         ballSpeedX = width * 12/1040;
         ballSpeedY = height * 12/760;
    
         // Load background frame once so instructions are removed if player continues to press mouse
         background(57,57,57);
    
         stage = 1;
      }
}


void game(){
  // Allows for 'crazy rainbow' functionality because background function resets frame
  if (mousePressed == false){
     background(57,57,57);
  }
  if(mousePressed == true){
    //Rectangle for scores so that they don't overlap during 'rainbow mode"
    fill(57,57,57);
    noStroke();
    rectMode(CORNERS);
    rect(width, 0, width-165, 40);
    rectMode(CENTER);
    //reset 'background' for paddle so that it doesn't get printed multiple times
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    rectMode(CORNERS);
  }
  
  //Display Points
  stroke(15);
  fill(57,108,138);
  textSize(30);
  text("Points:" + pointCount, width - 150, 30);
  
  // Ball Color
  ballR = random(255);
  ballG = random(255);
  ballB = random(255);
  fill(ballR, ballG, ballB);
  
  // Ball Movement
  ballX += ballSpeedX;
  ballY += ballSpeedY;
  
  // Create Ball
  strokeWeight(1);
  circle(ballX,ballY,ballDiameter);
  fill(255);
  
  // Wall Constraints
  if ((ballX >= width - ballDiameter/2) || (ballX <= 0 + ballDiameter/2)){
    ballSpeedX = ballSpeedX * -1;
  }
  
  if(ballY < 0 + ballDiameter/2){
  ballY = ballDiameter/2;
  ballSpeedY = ballSpeedY * -1;
  }
  
  if(ballY > height - ballDiameter/2){
    //Rectangle so that crazy Rainbow does not make it difficult to see game over message
    fill(57,57,57);
    stroke(57,108,138);
    strokeWeight(4);
    rectMode(CORNERS);
    rect(380, 320, 740, 430);
    
    //Display game over message to player
    fill(57,108,138);
    textSize(50);
    text("Game Over", width/2-120, height/2);
    textSize(25);
    text("Press any key to start over", width/2-120, height/2+25);
    stage = 2;
    noLoop();
  }

  paddleX = constrain(mouseX, paddleWidth/2, width - paddleWidth/2);
  
  // Code to keep paddle 30 pix above bottom
  paddleY = height - 60;
  
  //Make Paddle Move//
  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  
  if(ballY > paddleY - paddleHeight/2 - ballDiameter/2 && ballX <= paddleX + paddleWidth/2 && ballX >= paddleX -paddleWidth/2){
    hit();
    }
    
}


void hit(){
    ballY = paddleY - paddleHeight/2 - ballDiameter/2;
    ballSpeedY += gameIncrDifficulty;
    ballSpeedY = ballSpeedY * -1;
        
      if(ballSpeedX > 0){
        ballSpeedX += gameIncrDifficulty;
      }
      else if(ballSpeedX < 0){
        ballSpeedX -= gameIncrDifficulty;
      }
    pointCount += 1;
}

void ballMovement(){
  float ballStartGap = 25;
  ballX = random(ballStartGap, width - ballStartGap);
  ballY = 50;
  // Pick a random X direction for ball
  int[] startXSpeed = { -1, 1};
  int index = int(random(startXSpeed.length));
  ballSpeedX = ballSpeedX*(startXSpeed[index]);
}

void keyPressed() { 
  if (stage == 2){
    // Reset Ball Movement
    ballMovement();
    pointCount = 0;
    stage = 0;
    loop();
  }
  }
