class Lilypads{
  int x;
  int y;
  int d=75; 
  int xSpeed;
    int left;
  int right;
  int top;
  int bottom  ;
boolean isPlayerOn;
boolean isVisible=true;
  PImage[] LilyImages;
Animation lilyAnim;

 Lilypads(int startingX, int startingY, int startingD){
    x=startingX;
    y=startingY;
    d=startingD;
     
     
 LilyImages = new PImage[15];

    
      for (int index=0; index<= LilyImages.length -1; index++){
    LilyImages[index] = loadImage("LilyPad" + index + ".png");
  }
 
  
  // initialize animation objects
  lilyAnim = new Animation(LilyImages, 0.2, 1);
    
       int speedMag = 7;

    xSpeed = int(random(speedMag, +speedMag));

    if (xSpeed == 0) {
      xSpeed = speedMag;
    }
 }
 void render(){
   if(isVisible){
    
    lilyAnim.display(x,y);
    lilyAnim.isAnimating=true;}}

  // void collide(player aPlayer) {
  //  if (left<= aPlayer.right
  //    && right>= aPlayer.left
  //    && top<= aPlayer.bottom
  //    && bottom>=aPlayer.top && isPlayerOn==false) {
  //    //aPlayer.x-=xSpeed;
  //    isPlayerOn=true;
  //  }
  //  else{
  //    isPlayerOn = false;
  //  }
  //  //println(isPlayerOn);

  //  if (isPlayerOn == true) {
  //    println("yep");
  //    aPlayer.x-=xSpeed;
  //}
  // if ((left>= aPlayer.right
  //    && right<= aPlayer.left
  //    && top>= aPlayer.bottom
  //    && bottom<=aPlayer.top && isVisible)) {
  //    isPlayerOn=false;
  //    aPlayer.x = aPlayer.restartx;
  //    aPlayer.y= aPlayer.restarty;
  //    aPlayer.x+=xSpeed;
  //  }
  // }
   void move() {
   
      x += xSpeed;
      
    left=x-d/2;
    right= x+d/2;
    top= y-d/2;
    bottom= y+d/2;
    }
  
  void wallDetect(){
      // detects wall detection for the right wall
      if (x+d/2 >= width) {
        xSpeed = -abs(xSpeed);
      }
      // wall detection for left wall
      if (x-d/2 <= 0) {
        xSpeed = abs(xSpeed);
      }
  
      //// wall detection for the bottom wall
      //if (y+d/2 >= height) {
      //  ySpeed = -abs(ySpeed);
      //}
      //// wall detection for left wall
      //if (y-d/2 <= 0) {
      //  ySpeed = abs(ySpeed);
      //}
    }
    boolean PlayerOnPad(player aPlayer){
      if(isVisible&& left<= aPlayer.right
      && right>= aPlayer.left
      && top<= aPlayer.bottom
      && bottom>=aPlayer.top){
      aPlayer.y=aPlayer.restarty;
      aPlayer.x=aPlayer.restartx;
      //isVisible=false;
      return true;

  }
    return false;
  }
    }
