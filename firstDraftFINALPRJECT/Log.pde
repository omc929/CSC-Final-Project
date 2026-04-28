class Log {
  int x;
  int y;
  int w;
  int h;
  int d;
  int xSpeed;
  int left;
  int right;
  int top;
  int bottom;
  boolean isPlayerOn;
  Animation LogAnim;
  PImage[]LogImage;
  Log(int startingX, int startingY, int startingW, int startingH) {
    rectMode(CENTER);
    x=startingX;
    y=startingY;
    w= startingW;
    h=startingH;


    
 
 LogImage= new PImage[1];
 
    for (int index=0; index<= LogImage.length -1; index++){
    LogImage[index] = loadImage("Log" + index + ".png");
  }

 LogAnim= new Animation(LogImage,0.1,2.0);

    left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;

    int speedMag = 7;

    xSpeed = int(random(speedMag, -speedMag));

    if (xSpeed == 0) {
      xSpeed = speedMag;
    }
  }
  void render() {
      LogAnim.display(x,y);
      LogAnim.isAnimating=true;
   }
 
  void collide(player aPlayer) {
    if (left<= aPlayer.right
      && right>= aPlayer.left
      && top<= aPlayer.bottom
      && bottom>=aPlayer.top && isPlayerOn==false) {
      //aPlayer.x-=xSpeed;
      isPlayerOn=true;
    }
    else{
      isPlayerOn = false;
    }
    //println(isPlayerOn);

    if (isPlayerOn == true) {
      println("yep");
      aPlayer.x-=xSpeed;
    } else {
      println("n");
    }
    if ((left>= aPlayer.right
      && right<= aPlayer.left
      && top>= aPlayer.bottom
      && bottom<=aPlayer.top)) {
      isPlayerOn=false;
      aPlayer.x = aPlayer.restartx;
      aPlayer.y= aPlayer.restarty;
      aPlayer.x+=xSpeed;
    }
  }
  void move() {
    left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;

    x -= xSpeed;
  }

  void wallDetect() {
    if (x-d/2 <= 0) {
      x=width;
    }
  }
}
