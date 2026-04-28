class LandingZones{
   int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  boolean isPlayerOn;
  

  
    LandingZones(int startingX, int startingY, int startingW, int startingH){
    x= startingX;
    y= startingY;
    h= startingH;
    w= startingW;
    


    
    left=x-w/2;
    right= x+w/2;
    top= y-h/2;
    bottom= y+h/2;
    }
     void render(){
    fill(#08621C);   
    rect(x,y,w,h);
    
  }
  void collide(player aPlayer){
    if(left<= aPlayer.right
    && right>= aPlayer.left
    && top<= aPlayer.bottom
    && bottom>=aPlayer.top && isPlayerOn==false){
      //aPlayer.y=h/2+w/2;
      isPlayerOn=true;
    }
 if(! (left<= aPlayer.right
    && right>= aPlayer.left
    && top<= aPlayer.bottom
    && bottom>=aPlayer.top)){
      isPlayerOn=false;}
  
  }
}
