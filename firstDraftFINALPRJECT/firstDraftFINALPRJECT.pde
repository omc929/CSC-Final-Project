

player p1;
Log log1;
Log log2;
Log log3;
Log log6;
Log log7;
Log log8;
Log log9;
Log log10;
Log log11;
Log log12;
Log log13;
Log log14;
Log log15;


Car car1;
Car car2;
Car car3;
Car car4;
Car car5;
Car car6;
Car car7;
Car car8;
Car car9;

Alligator gator1;
Alligator gator2;
Alligator gator3;
Alligator gator4;
Alligator gator5;

LandingZones zone1;
LandingZones zone2;
Lilypads lilypad1;
Lilypads lilypad2;
Lilypads lilypad3;
Lilypads lilypad4;

Animation lilyAnim;
Animation upAnim;
Animation downAnim;
Animation leftAnim;
Animation rightAnim;
Animation idleAnim;
Animation GatorAnim;
Animation Car1Anim;
Animation Car2Anim;
Animation Car3Anim;

int startTime=0;
int currentTime;
int restart;
int interval=45000;
int totalMillis;
int padsLeft=0;
boolean gameStarted = false;
int elapsedSeconds = 0;

ArrayList<Car> carList; 
ArrayList<Log> LogList;
ArrayList<Lilypads> lilypadList;
ArrayList<Alligator>gatorList;
int state=0;
  
  PImage[] LilyImages;
 PImage[] Car1;
 PImage[]Car2;
 PImage[] Car3;
 PImage[] Log;
 PImage[]Gator;  


  
import processing.sound.*;
SoundFile hitSound;
SoundFile Jump;
SoundFile crock;
void setup(){
  size(1200,900);
  imageMode(CENTER);
  println(millis() );
  startTime=millis();
  
  p1= new player(600,850, 50,50);
  
  zone1= new LandingZones(600,850,1200,100);
  zone2= new LandingZones(600,400,1200,100);
  
  log1= new Log(300,190,150,50);
  log2= new Log(800,250,150,50);
  log3= new Log(1000,190,150,50);
  log6= new Log(600,190,150,50);
  log7= new Log(500,250,150,50);
  log8= new Log(300,190,150,50);
  log9= new Log(300,190,150,50);
  log10= new Log(600,320,150,50);
  log11= new Log(100,320,150,50);
  log12= new Log(1200,320,150,50);
  log13= new Log(700,320,150,50);
  log14= new Log(1000,320,150,50);
  log15=new Log(1000,250,150,50);
  LogList= new ArrayList<Log>(); 
   
  car1= new Car(800,750,75,50, 1);
  car2= new Car(100,650,75,50,2);
  car3= new Car(600,550,100,50,3);
  car4= new Car(900,550,100,50,3); 
  car5= new Car(1200,550,100,50,3);
  car6=new Car(500,750,75,50,1);
  car7=new Car(400,650,75,50,2);
  car8=new Car(1000,650,75,50,2);
  car9= new Car(1200,750,75,50,1);

  carList= new ArrayList<Car>(); 
  
  lilypad1= new Lilypads(100,100,100);
  lilypad2= new Lilypads(400,100,100);
  lilypad3= new Lilypads(750,100,100);
  lilypad4= new Lilypads(1000,100,100);
    lilypadList=new ArrayList<Lilypads>();
  
  gator1=new Alligator(200,250,150,50);
  gator2=new Alligator(400,320,150,50);
  gator3= new Alligator(1200,190,150,50);
    gatorList=new ArrayList<Alligator>();

  
  carList.add(car1);
  carList.add(car2);
  carList.add(car3);
  carList.add(car4);
  carList.add(car5);
  carList.add(car6);
  carList.add(car7);
  carList.add(car8);
  carList.add(car9);
  
  LogList.add(log1);
  LogList.add(log2);
  LogList.add(log3);
  LogList.add(log6);
  LogList.add(log7);
  LogList.add(log8);
  LogList.add(log9);
  LogList.add(log10);
    LogList.add(log11);
  LogList.add(log12);
  LogList.add(log13);
  LogList.add(log14);
  LogList.add(log15);


  lilypadList.add(lilypad1);
  lilypadList.add(lilypad2);
  lilypadList.add(lilypad3);
  lilypadList.add(lilypad4);

gatorList.add(gator1);
gatorList.add(gator2);
gatorList.add(gator3);
//gatorList.add(gator4);
//gatorList.add(gator5);

  LilyImages = new PImage[3];
  Car1= new PImage[0];
  Car2= new PImage[0];
  Car3= new PImage[0];
//Background= loadImage("Background.png");
//Background
 
  //initalize sound vars
  hitSound= new SoundFile(this,"Jump.mp3");
  Jump= new SoundFile(this, "Jump.mp3");
  //hitSound= new SoundFile(this,"crock.mp3");
  crock = new SoundFile(this, "crock.mp3");
}

void draw(){
  background(42);

       switch (state){ //start screen
    case 0:
  background(42);
  DisplayStart();

  break;
  
  case 1:
  background(42);
  
  currentTime= millis();
  if(gameStarted){
    elapsedSeconds=(millis()-startTime)/1000;}
      fill(#81E7FF);
  textSize(50);
 text(elapsedSeconds,1100,100);
    if(Jump.isPlaying()==false){
 Jump.play();}

 
 for(Log aLog: LogList){   
   aLog.render();
 aLog.collide(p1);
  aLog.wallDetect();
  aLog.move();
 }
 zone1.render();
 zone2.render();
 zone1.collide(p1);
 zone2.collide(p1);
 

 
 p1.render();
  p1.move();
p1.WindowCollsion();
 
 for(Car aCar: carList){ 
  aCar.render();
  aCar.wallDetect();
  aCar.move();
  aCar.collide(p1);
 }
 for(Alligator aAlligator: gatorList){
  aAlligator.render();
  aAlligator.wallDetect();
  aAlligator.move();
  aAlligator.collide(p1);}
     padsLeft=0;

  for(Lilypads aLilypads: lilypadList){
   if(aLilypads.isVisible){
   padsLeft++;
   }
     aLilypads.render();
   aLilypads.wallDetect();
      aLilypads.move();
    if (aLilypads.PlayerOnPad(p1)&& aLilypads.isVisible){
           aLilypads.isVisible=false;

   //if (aLilypads.PlayerOnPad(p1) == true){
   //        aLilypads.visible=false;
      for(Car aCar: carList){ 
       aCar.xSpeed += 2;
     }
     for(Alligator aAlligator: gatorList){
       aAlligator.xSpeed += 2;
     }
     for(Log aLog: LogList){
       aLog.xSpeed += 2;
     }
  
   }
  }
  if(padsLeft==0){
    state=3;}
    
if(currentTime-startTime>interval){
  state=2;}
  break;
case 2:
  DisplayLoser();
  
   break;
case 3:
DisplayWinner();
   break;
       }
       }
void keyPressed(){
  if(key==' '){
    state=1;
    gameStarted=true;
    startTime=millis();
    
  }
  
  if(key=='a'){
    p1.isMovingLeft=true; 
  
}
  if(key=='d'){
    p1.isMovingRight=true;
  }
  if(key=='w'){
    p1.isMovingUp=true;
  }
  if(key=='s'){
   p1.isMovingDown=true;
  
}
}

void keyReleased(){
  
  if(key=='a'){ if(crock.isPlaying()==false)
  {crock.play();}
    p1.isMovingLeft=false;}
  if(key=='d'){ if(crock.isPlaying()==false)
  {crock.play();}
    p1.isMovingRight=false;}
  if(key=='w'){
      if(crock.isPlaying()==false)
  {crock.play();}
    p1.isMovingUp=false;}
  if(key=='s'){
    if(crock.isPlaying()==false)
  {crock.play();}
    p1.isMovingDown=false;}
    
}
void DisplayLoser(){
  background(42);
  textAlign(CENTER);
  fill(#EA2B37);
  textSize(100);
text("LOSER", width/2,height/2);
  
}
void DisplayWinner(){
  background(42);
  textAlign(CENTER);
  fill(#00FF01);
  textSize(100);
  text("WINNER",width/2,height/2);
}
void DisplayStart(){
  background(42);
  textAlign(CENTER);
  textSize(300);
  fill(#FFA108);
text("Frogger", 600,300);
  textSize(100);
  fill(#FF08EF);
text("press space to start", width/2,height/2);
}
