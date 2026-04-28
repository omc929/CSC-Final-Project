class Car {
  
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
  int carNumber;
 PImage[] Car1;
  PImage[]Car2;
 PImage[] Car3;
 Animation Car1Anim;
 Animation Car2Anim;
 Animation Car3Anim;

  
  

  
  Car(int startingX, int startingY, int startingW, int startingH, int startingCarNumber){
    rectMode(CENTER);
    x=startingX;
    y=startingY;
    w= startingW;
    h=startingH;
    carNumber = startingCarNumber;
    
       Car1 = new PImage[1];
       Car2 = new PImage[1];
       Car3 = new PImage[1];

  for (int index=0; index<= Car1.length-1; index++){
    Car1[index] = loadImage("GreenCar" + index + ".png");}
      for (int index=0; index<= Car2.length-1; index++){
    Car2[index] = loadImage("GrayCar" + index + ".png");}
      for (int index=0; index<= Car3.length-1; index++){
    Car3[index] = loadImage("Truck" + index + ".png");}
    
    
      Car1Anim= new Animation(Car1, 0.1,2);
      Car2Anim= new Animation(Car2, 0.1,2);
      Car3Anim= new Animation(Car3, 0.1,2);


  
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
  void render(){
    if (carNumber == 1){
      image(Car1[0], x, y);
    Car1Anim.display(x,y);
    Car1Anim.isAnimating=true;
    }
    if(carNumber==2){
      image(Car2[0],x,y);
    Car2Anim.display(x,y);
    Car2Anim.isAnimating=true;}
    if(carNumber==3){
      image(Car3[0],x,y);
    Car3Anim.display(x,y);
    Car3Anim.isAnimating=true;}
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
