class player {
  //variables
  int x;
  int y;
  int w;
  int h;
  int playerSpeed=7;
    int restartx;
    int restarty;

  int left;
  int right;
  int top;
  int bottom;
  
boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;

PImage[] upImages;
PImage[] downImages;
PImage[] leftImages;
PImage[] rightImages;
PImage[] idleImages;

Animation upAnim;
Animation downAnim;
Animation leftAnim;
Animation rightAnim;
Animation idleAnim;




  //constructor
  player(int startingX, int startingY, int startingW, int startingH){
    x= startingX;
    y= startingY;
    h= startingH;
    w= startingW;
    
    left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;
    
    isMovingLeft=false;
    isMovingRight=false;
    isMovingUp=false;
    isMovingDown=false;
    
    
    restarty=850;
    restartx=600;
    
  upImages = new PImage[3];
  downImages = new PImage[3];
  leftImages = new PImage[3];
  rightImages = new PImage[3];
  idleImages = new PImage[3];
    
   for (int index=0; index<= upImages.length-1; index++){
    upImages[index] = loadImage("FroggyUp" + index + ".png");
  }
  for (int index=0; index<= downImages.length-1; index++){
    downImages[index] = loadImage("FroggyDown" + index + ".png");
  }
  for (int index=0; index<= leftImages.length-1; index++){
    leftImages[index] = loadImage("FroggyLeft" + index + ".png");
  }
  for (int index=0; index<= rightImages.length-1; index++){
    rightImages[index] = loadImage("FroggyRight" + index + ".png");
  }
   for (int index=0; index<= idleImages.length-1; index++){
    idleImages[index] = loadImage("Froggy" + index + ".png");
  }
 
   upAnim = new Animation(upImages, 0.1, 2);
  downAnim = new Animation(downImages, 0.1, 2);
  leftAnim = new Animation(leftImages, 0.1, 2);
  rightAnim = new Animation(rightImages, 0.1, 2);
  idleAnim = new Animation(idleImages, 0.1, 2);
}
 
  
  
  void render(){
      if(isMovingUp==true){
      upAnim.display(x,y);
      upAnim.isAnimating=true;
  }
  else if(isMovingDown==true){
    downAnim.display(x,y);
      downAnim.isAnimating=true;}
  else if(isMovingLeft==true){
    leftAnim.display(x,y);
      leftAnim.isAnimating=true;}
 else if(isMovingRight==true){
   rightAnim.display(x,y);
      rightAnim.isAnimating=true;}
 else{
idleAnim.display(x,y);
    idleAnim.isAnimating=true;}
  }

void move(){
  
  if(isMovingUp==true){
    y -= playerSpeed;}
  if(isMovingDown==true){
    y+=playerSpeed;}
  if(isMovingLeft==true){
    x -=playerSpeed;}
  if(isMovingRight==true){
    x+=playerSpeed;
  }
  
    
    left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;
}
void WindowCollsion(){
  if (y<=0 && y>=height || x<0||x>width){
  x=restartx;
  y=restarty;
  }

}
}
