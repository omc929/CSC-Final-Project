class Alligator {
  
  int x;
  int y;
  int w;
  int h;
  int d;
  int restart;
  int xSpeed;
  int left;
  int right;
  int top;
  int bottom;
  PImage[] GatorImages;
  
  Animation GatorAnim;
  
  Alligator(int startingX, int startingY, int startingW, int startingH){
    rectMode(CENTER);
    x=startingX;
    y=startingY;
    w= startingW;
    h=startingH;
    

    
    left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;
    
    GatorImages= new PImage[1];
    
    for (int index=0; index<= GatorImages.length-1; index++){
    GatorImages[index] = loadImage("Gator" + index + ".png");
  }
  
  
  GatorAnim= new Animation(GatorImages, 0.1,2);
    
    int speedMag = 7;

    xSpeed = int(random(speedMag, -speedMag));

    if (xSpeed == 0) {
      xSpeed = speedMag;
    }
  }
  void render(){
    fill(0,255,0);
    GatorAnim.display(x,y);
    GatorAnim.isAnimating=true;
  }
    
  
    void collide(player aPlayer){
    if(left< aPlayer.right
    && right> aPlayer.left
    && top < aPlayer.bottom
    && bottom>aPlayer.top){
      println("trigger");
     aPlayer.x = aPlayer.restartx;
     aPlayer.y= aPlayer.restarty;
  }
    }
 void move() {
     left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;
   
    x -= xSpeed;
  }

void wallDetect(){
    if (x-d/2 <= 0) {
      x=width;
    }
    
}
  }
