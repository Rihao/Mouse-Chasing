float ballinitial,wallcolor,yspd,wallx,wallspeed,wallh1,wallh2,wallx2;
float wallx3,wallh3,wallx4,wallh4,wallh5,wallx5,wallx6,wallh6,ballx;
boolean dead;
boolean intro;
int score,level;
PImage background;
PImage mice345;
void setup() {
  size(1000,400);
  ballinitial=200;
  wallx=1100;
  wallx2=900;
  wallx3=700;
  wallx4=500;
  wallx5=300;
  wallspeed=-1.5;
  wallh1=random(300);
  wallh2=random(300);
  wallh3=random(300);
  wallh4=random(300);
  wallh5=random(300);
  ballx=150;
  score=0;
  level=1;
  intro=true;
  dead=false;
  background = loadImage("background.jpg");
  mice345=loadImage("mice345.jpg");
} 
void draw(){
if(intro){
  image(background,0,0);  
  textSize(30);
  fill(0);
  text("Press Space To Start",50,100);
  text("Poor Mouse",50,150);
}
else{
textSize(20);
sketch();
update();
checkedge();
hit();
death();}
}
void sketch(){
  background(255);
  fill(0);
  //fill(random(255),random(255),random(255));
   image(mice345,ballx,ballinitial,15,15);
  //ellipse(ballx,ballinitial,15,15);
  fill(255);
  rect(wallx,0,50,wallh1); //first up wall
  rect(wallx,400,50,wallh1+100-400);//first down wall
  rect(wallx2,0,50,wallh2);
  rect(wallx2,400,50,wallh2+100-400);
  rect(wallx3,0,50,wallh3);
  rect(wallx3,400,50,wallh3+100-400);
  rect(wallx4,0,50,wallh4);
  rect(wallx4,400,50,wallh4+100-400);
  rect(wallx5,0,50,wallh5);
  rect(wallx5,400,50,wallh5+100-400);
/*  rect(wallx6,0,50,wallh6);
  rect(wallx6,500,50,wallh6+100-500);*/
} 
void update() {
  ballinitial=ballinitial+yspd;
  yspd+=1.25;
  if(yspd>=3) {
    yspd=3;
  }
  wallx=wallx+wallspeed;
  wallx2=wallx2+wallspeed;
  wallx3=wallx3+wallspeed;
  wallx4=wallx4+wallspeed;
  wallx5=wallx5+wallspeed;
//  wallx6=wallx6+wallspeed;
/*  if(wallx<=120) {
    score+=1;
  }*/
  fill(0);
  text("Score:"+score,20,30);
  text("Level:"+level,20,50);
}
void keyPressed(){
yspd = -9;
intro=false;
}
void checkedge(){
  if(ballinitial>=390) {
    ballinitial=390;
  }  
  if(ballinitial<=10){
    ballinitial=10;
  }
    if (wallx<=0) {
    wallx=1100;
    score+=1;
    level+=1;
    wallspeed=wallspeed-0.1;
    wallh1=random(300);
}

    if(wallx2<=0){
      wallx2=1100;
      score+=1;
      wallh2=random(300);
    }
    if(wallx3<=0) {
      wallx3=1100;
      score+=1;
      wallh3=random(300);
    }
     if(wallx4<=0) {
     wallx4=1100;
     score+=1;
     wallh4=random(300);
    }
     if(wallx5<=0) {
     wallx5=1100;
     score+=1;
     wallh5=random(300);
    }
   // if(wallx5<=
 /*   if(wallx6<=0) {
     wallx6=950;
     wallh6=random(300);
    }*/
}
void hit(){
  if((ballinitial<=10)||(ballinitial>=390)){
    dead=true;
  }
  if((ballx>=wallx5)&(ballx<=wallx5+50)){
    if((ballinitial<=wallh5)||(ballinitial>=wallh5+100)){
      dead=true;}
  }
  if((ballx>=wallx4)&(ballx<=wallx4+50)){
  if((ballinitial<=wallh4)||(ballinitial>=wallh4+100)){
      dead=true;}
  }
  if((ballx>=wallx3)&(ballx<=wallx3+50)){
  if((ballinitial<=wallh3)||(ballinitial>=wallh3+100)){
      dead=true;}
  }
  if((ballx>=wallx2)&(ballx<=wallx2+50)){
  if((ballinitial<=wallh2)||(ballinitial>=wallh2+100)){
      dead=true;}
  }
  if((ballx>=wallx)&(ballx<=wallx+50)){
  if((ballinitial<=wallh1)||(ballinitial>=wallh1+100)){
      dead=true;}
  }
  //if((ballx>=wallx5)&(ballx<=wallx5+
  /*if((ballinitial<=wallh)||(ballinitial>=wallh+100-400)){
  dead=true;*/
  /*if((ballinitial<=wallh5)||(ballinitial>=wallh5+100-400)){
    dead=true;
  }*/
} 
void death(){
  if(dead){
    yspd=5;
    wallspeed=0;
    text("Game Over",600,50);
    text("Score:"+score,600,100);
    text("Level:"+level,600,150);
  }    
}
