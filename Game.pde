int playerX = 300, playerY = 400;
int playerXD = 0, playerYD = 0;
int lazerX = playerX, lazerY = playerY, lazerSPD = 0;
int ball1X = 0, ball1Y = 25, ball2X = 10, ball2Y = 25, ball3X = 20, ball3Y = 25;
int ball1S = 2, ball2S = 4 , ball3S = 6;
boolean ball1=true, ball2=true, ball3=true;
int score = 0;
boolean GameOver = false;
void setup(){
  size(500,550);
  background(255);
  textSize(40);
}

void draw(){
  if (GameOver == false)
   fill(255);
   rect(0,0,displayWidth,displayHeight);
  fill(200, 200);
  rect(playerX,playerY,25,50);
  fill(0,255,0);
  rect(lazerX, lazerY, 2, 25);
  fill(255,0,0);
  if(ball1 == true){
  ellipse(ball1X,ball1Y,30,30);
  } 
  if(ball2 == true){
  ellipse(ball2X,ball2Y,30,30);
  } 
  if(ball3 == true){
  ellipse(ball3X,ball3Y,30,30);
  }
  playerX+=playerXD;
  playerY+=playerYD;
  lazerX=playerX;
  lazerY+=lazerSPD;
  ball1X+=ball1S;
  ball2X+=ball2S;
  ball3X+=ball3S;
  if(lazerY < 0){
    lazerX=playerX;
    lazerY=playerY;
    lazerSPD=0;
  }
    if(ball1X > 525 || ball1X < 0){
    ball1S=-ball1S;
    } else if(ball2X > 525 || ball2X < 10){
      ball2S=-ball2S;
    } else if(ball3X > 525 || ball3X < 10){
      ball3S=-ball3S;
    }
  if(lazerX > ball1X && lazerX < ball1X+30 && lazerY < ball1Y){
    ball1=false;
    ball1S=0;
    score++;
  }
  if(lazerX > ball2X && lazerX < ball2X+30 && lazerY < ball2Y){
    ball2=false;
    ball2S=0;
    score++;
  }
  if(lazerX > ball3X && lazerX < ball3X+30 && lazerY < ball3Y){
    ball3=false;
    ball3S=0;
    score++;
  }
  if(score > 2) {
    GameOver=true;
  }

  if(GameOver == true){
    End();
  }
}
void End(){
  clear();
  text("You Win!" ,180,200);
  
}
void keyReleased(){
  playerXD=0;
  playerYD=0;
  
}


void keyPressed(){
  if(keyCode == RIGHT) {
  playerXD=5;
} else if(keyCode == LEFT) {
playerXD=-5;
} else if(key == ' '){
  lazerSPD=-30;
}


}
