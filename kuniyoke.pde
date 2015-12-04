import ddf.minim.*;
Minim minim;
AudioPlayer player;
int radius=40;
int hankei=25;
int counter=0;
int flg=0;
int tm0=0;
int tm=0;
int ms;
int s;
int m;
int safe;

PFont font;
PImage img;

int[] x=new int[14];

float dx1,dx2,dx3;
float dx4,dx5,dx6;
float dx7,dx8,dx9;
float dx10,dx11,dx12;
float dx13,dx14,dx15;

float y1=radius,y2=radius,y3=radius;
float y4=radius,y5=radius,y6=radius;
float y7=radius,y8=radius,y9=radius;
float y10=radius,y11=radius,y12=radius;
float y13=radius,y14=radius,y15=radius;

float[] speed=new float[14];


int ran1,ran2,ran3;
int ran4,ran5,ran6;
int ran7,ran8,ran9;
int ran10,ran11,ran12;
int ran13,ran14,ran15;

void setup(){
  size(600,600);
  minim=new Minim(this);
  player=minim.loadFile("bgm.mp3");
  player.play();
   ellipseMode(RADIUS);
   
   img=loadImage("nihon.jpg");
   
 font=loadFont("SansSerif-48.vlw");
 textFont(font,50);


  for(int i = 0; i <= 13; i++){
  x[i] = (int) random(0, 500);
  speed[i] = random(0.5, 2.5);
}

  ran1 = (int) random(0,3);
  ran2 = (int) random(0,3);
  ran3 = (int) random(0,3);
  ran4 = (int) random(3,6);
  ran5 = (int) random(3,6);
  ran6 = (int) random(3,6);
  ran7 = (int) random(6,9);
  ran8 = (int) random(6,9);
  ran9 = (int) random(6,9);
  ran10 = (int) random(9,12);
  ran11 = (int) random(9,12);
  ran12 = (int) random(9,12);
  ran13 = (int) random(12,15);
  ran14 = (int) random(12,15);
  ran15 = (int) random(12,15);
  
  safe=(int) random(0,3);
}



void draw(){
  background(255);
  if(flg==0){
    startWindow();
  }

  if(flg==1){
    if(tm == 0){
      tm0=millis();
      print(tm0);
    }
    
    tm=millis()-tm0;
    
     ms=tm%1000;
     if (ms>=1){
     s=(tm-ms)/1000;
      }

text(nf(s,3)+":"+nf(ms,2),400,50);

   if(s<=20){
    level1();
  }
if(s>=21 && s<=39){
  level2();
  }
if(s>=40 && s<=59){
  level3();
  }
if(s>=60 && s<=79){
  level4();
  }
if(s>=80){
  level5();
  }
  fill(255,0,0);
  noCursor();
  ellipse(mouseX,mouseY,hankei,hankei);
  }

//ゲームオーバの処理----------------------------------------------------------------------------------------------------------------------------------  

if(flg==2){
  stop();
//  void stop(){
//  player.close();  
//  minim.stop();
//  super.stop();
//  }
//stop();
  background(0,0,0);
  textSize(100);
  text("GAME OVER",10,100);
  textSize(40);
  text("YOUR SCORE:",50,200);
  text(s,320,200);
  fill(255,0,0);
 
  
//  if(mousePressed){
//    flg=0;
//  }
}
  println(flg);
}


// スタート画面-----------------------------------------------------------------------------------------------------

void startWindow(){
  title();
  startword();
}

void title(){
  
  
  fill(0,0,0);
//  image(img,20,10,600,600);
image(img,200,100,450,450);
  textAlign(CENTER);
  textSize(120);
  text("国避け",280,260);
}

void startword(){
  fill(0);
  textAlign(LEFT);
  textSize(20);
  text("画面をクリックするとゲームがはじまるよ",125,570);
  if(mousePressed==true){
    flg=flg+1;
//    mouseClickCount=mouseClickCount+1;
    
}
}
  

    //レベル毎の処理--------------------------------------------------------------------------------------------------------------------------------------------------

void level1(){
    country1();
    country2();
    country3();
    safe();
    leveltext(); 
    
}

void level2(){
    country1();
    country2();
    country3();
    country4();
    country5();
    country6();    
    safe();
    leveltext2();
}
  
void level3(){
    country1();
    country2();
    country3();
    country4();
    country5();
    country6();
    country7();
    country8();
    country9();   
    safe();
    leveltext3();
}
  
void level4(){
    country1();
    country2();
    country3();
    country4();
    country5();
    country6();
    country7();
    country8();
    country9();
    country10();
    country11();
    country12();
    safe();
    leveltext4();
}
  
void level5(){
    country1();
    country2();
    country3();
    country4();
    country5();
    country6();
    country7();
    country8();
    country9();
    country10();
    country11();
    country12();
    country13();
    country14();
    country15();
    safe();
    leveltext5();
}


   //-----------国の出現----------------------------------------------------------------------------------------------------------------------------------
    
    
void country1(){
  if(ran1==0){
    textFont(font,50);
    fill(255,255,0);
    text("米",x[0],y1);
    if(safe==1 || safe==2){
      hit0();
    }
  }
  if(ran1==1){
    textFont(font,50);
    fill(0,255,0);
    text("英",x[0],y1);
    if(safe==0 || safe==2){
      hit0();
    }
  }
  if(ran1==2){
    textFont(font,50);
    fill(0,0,255);
    text("露",x[0],y1);
    if(safe==0 || safe==1){
      hit0();
    }
  }
  x[0]+=dx1;
  
  if(x[0]<0||x[0]>550){
    dx1=-dx1;
  }
  y1+=speed[0];
  if(y1>610){
     ran1 = (int) random(0,3); 
     x[0]  = (int) random(0,500);
     speed[0] = random(0.5,2.5);
     dx1 = random(0,10);
     y1=-100;
  }
}

void country2(){
  if(ran2==0){
    fill(255,255,0);
    text("米",x[1],y2);
    if(safe==1 || safe==2){
      hit1();
    }
  }
  if(ran2==1){
    fill(0,255,0);
    text("英",x[1],y2);
    if(safe==0 || safe==2){
      hit1();
    }
  }
  if(ran2==2){
    fill(0,0,255);
    text("露",x[1],y2);
    if(safe==0 || safe==1){
      hit1();
    }
  }
  x[1]+=dx2;
  if(x[1]<0||x[1]>550){
    dx2=-dx2;
  }
  y2+=speed[1];
  if(y2>600){
     ran2 = (int) random(0,3);    
     x[1]  = (int) random(0,500);
     speed[1] = random(0.5,2.5);
     dx2 = random(0,10);
     y2=-100;
  }
}

void country3(){
  if(ran3==0){
    fill(255,255,0);
    text("米",x[2],y3);
    if(safe==1 || safe==2){
      hit2();
    }
  }
  if(ran3==1){
    fill(0,255,0);
    text("英",x[2],y3);
    if(safe==0 || safe==2){
      hit2();
    }
  }
  if(ran3==2){
    fill(0,0,255);
    text("露",x[2],y3);
    if(safe==0 || safe==1){
      hit2();
    }
  }
  x[2]+=dx3;
  if(x[2]<0||x[2]>550){
    dx3=-dx3;
  }
  y3+=speed[2];
  if(y3>600){
     ran3 = (int) random(0,3);
     x[2]  = (int) random(0,500);
     speed[2] = random(0.5,2.5);
     dx3 = random(0,10);
     y3=-100;
  }
  
}

void country4(){
  if(ran4==3){
    fill(255,255,0);
    text("加",x[3],y4);
    if(safe==1 || safe==2){
      hit3();
    }
  }
  if(ran4==4){
    fill(0,255,0);
    text("独",x[3],y4);
    if(safe==0 || safe==2){
      hit3();
    }
  }
  if(ran4==5){
    fill(0,0,255);
    text("中",x[3],y4);
    if(safe==0 || safe==1){
      hit3();
    }
  }
  x[3]+=dx4;
  if(x[3]<0||x[3]>550){
    dx4=-dx4;
  }
  y4+=speed[3];
  if(y4>600){
     ran4 = (int) random(3,6);
     x[3]  = (int) random(0,500);
     speed[3] = random(0.5,2.5);
     dx4 = random(0,10);
     y4=-100;
  }
  
}

void country5(){
  if(ran5==3){
    fill(255,255,0);
    text("加",x[4],y5);
    if(safe==1 || safe==2){
      hit4();
    }
  }
  if(ran5==4){
    fill(0,255,0);
    text("独",x[4],y5);
    if(safe==0 || safe==2){
      hit4();
    }
  }
  if(ran5==5){
    fill(0,0,255);
    text("中",x[4],y5);
    if(safe==0 || safe==1){
      hit4();
    }
  }
  x[4]+=dx5;
  if(x[4]<0 || x[4]>550){
    dx5=-dx5;
  }
  y5+=speed[4];
  if(y5>600){
     ran5 = (int) random(3,6);
     x[4]  = (int) random(0,500);
     speed[4] = random(0.5,2.5);
     dx5 = random(0,10);
     y5=-100;
  }
  
}

void country6(){
  if(ran6==3){
    fill(255,255,0);
    text("加",x[5],y6);
    if(safe==1 || safe==2){
      hit5();
    }
  }
  if(ran6==4){
    fill(0,255,0);
    text("独",x[5],y6);
    if(safe==0 || safe==2){
      hit5();
    }
  }
  if(ran6==5){
    fill(0,0,255);
    text("中",x[5],y6);
    if(safe==0 || safe==1){
      hit5();
    }
  }
  x[5]+=dx6;
  if(x[5]<0 || x[5]>550){
    dx6=-dx6;
  }
  y6+=speed[5];
  if(y6>600){
     ran6 = (int) random(3,6);
     x[5]  = (int) random(0,500);
     speed[5] = random(0.5,2.5);
     dx6 = random(0,10);
     y6=-100;
  }
  
}

void country7(){
  if(ran7==6){
    fill(255,255,0);
    text("巴",x[6],y7);
    if(safe==1 || safe==2){
      hit6();
    }
  }
  if(ran7==7){
    fill(0,255,0);
    text("伊",x[6],y7);
    if(safe==0 || safe==2){
      hit6();
    }
  }
  if(ran7==8){
    fill(0,0,255);
    text("稲",x[6],y7);
    if(safe==0 || safe==1){
      hit6();
    }
  }
  x[6]+=dx7;
  if(x[6]<0 || x[6]>550){
    dx7=-dx7;
  }
  y7+=speed[6];
  if(y7>600){
     ran7 = (int) random(6,9);
     x[6]  = (int) random(0,500);
     speed[6] = random(0.5,2.5);
     dx7 = random(0,10);
     y7=-100;
  }
  
}

void country8(){
  if(ran8==6){
    fill(255,255,0);
    text("巴",x[7],y8);
    if(safe==1 || safe==2){
      hit7();
    }
  }
  if(ran8==7){
    fill(0,255,0);
    text("伊",x[7],y8);
    if(safe==0 || safe==2){
      hit7();
    }
  }
  if(ran8==8){
    fill(0,0,255);
    text("稲",x[7],y8);
    if(safe==0 || safe==1){
      hit7();
    }
  }
  x[7]+=dx8;
  if(x[7]<0 || x[7]>550){
    dx8=-dx8;
  }
  y8+=speed[7];
  if(y8>600){
     ran8 = (int) random(6,9);
     x[7]  = (int) random(0,500);
     speed[7] = random(0.5,2.5);
     dx8 = random(0,10);
     y8=-100;
  }
  
}

void country9(){
  if(ran9==6){
    fill(255,255,0);
    text("巴",x[8],y9);
    if(safe==1 || safe==2){
      hit8();
    }
  }
  if(ran9==7){
    fill(0,255,0);
    text("伊",x[8],y9);
    if(safe==0 || safe==2){
      hit8();
    }
  }
  if(ran9==8){
    fill(0,0,255);
    text("稲",x[8],y9);
    if(safe==0 || safe==1){
      hit8();
    }
  }
  x[8]+=dx9;
  if(x[8]<0 || x[8]>550){
    dx9=-dx9;
  }
  y9+=speed[8];
  if(y9>600){
     ran9 = (int) random(6,9);
     x[8]  = (int) random(0,500);
     speed[8] = random(0.5,2.5);
     dx9 = random(0,10);
     y9=-100;
  }
  
}

void country10(){
  if(ran10==9){
    fill(255,255,0);
    text("墨",x[9],y10);
    if(safe==1 || safe==2){
      hit9();
    }
  }
  if(ran10==10){
    fill(0,255,0);
    text("欄",x[9],y10);
    if(safe==0 || safe==2){
      hit9();
    }
  }
  if(ran10==11){
    fill(0,0,255);
    text("泰",x[9],y10);
    if(safe==0 || safe==1){
      hit9();
    }
  }
  x[9]+=dx10;
  if(x[9]<0 || x[9]>550){
    dx10=-dx10;
  }
  y10+=speed[9];
  if(y10>600){
     ran10 = (int) random(9,12);
     x[9]  = (int) random(0,500);
     speed[9] = random(0.5,2.5);
     dx10 = random(0,10);
     y10=-100;
  }
  
}

void country11(){
  if(ran11==9){
    fill(255,255,0);
    text("墨",x[10],y11);
    if(safe==1 || safe==2){
      hit10();
    }
  }
  if(ran11==10){
    fill(0,255,0);
    text("欄",x[10],y11);
    if(safe==0 || safe==2){
      hit10();
    }
  }
  if(ran11==11){
    fill(0,0,255);
    text("泰",x[10],y11);
    if(safe==0 || safe==1){
      hit10();
    }
  }
  x[10]+=dx11;
  if(x[10]<0 || x[10]>550){
    dx11=-dx11;
  }
  y11+=speed[10];
  if(y11>600){
     ran11 = (int) random(9,12);
     x[10]  = (int) random(0,500);
     speed[10] = random(0.5,2.5);
     dx11 = random(0,10);
     y11=-100;
  }
  
}

void country12(){
  if(ran12==9){
    fill(255,255,0);
    text("墨",x[11],y12);
    if(safe==1 || safe==2){
      hit11();
    }
  }
  if(ran12==10){
    fill(0,255,0);
    text("欄",x[11],y12);
    if(safe==0 || safe==2){
      hit11();
    }
  }
  if(ran12==11){
    fill(0,0,255);
    text("泰",x[11],y12);
    if(safe==0 || safe==1){
      hit11();
    }
  }
  x[11]+=dx12;
  if(x[11]<0 || x[11]>550){
    dx12=-dx12;
  }
  y12+=speed[11];
  if(y12>600){
     ran12 = (int) random(9,12);
     x[11]  = (int) random(0,500);
     speed[11] = random(0.5,2.5);
     dx12 = random(0,10);
     y12=-100;
  }
  
}

void country13(){
  if(ran13==12){
    fill(255,255,0);
    text("玖",x[12],y13);
    if(safe==1 || safe==2){
      hit12();
    }
  }
  if(ran13==13){
    fill(0,255,0);
    text("希",x[12],y13);
    if(safe==0 || safe==2){
      hit12();
    }
  }
  if(ran13==14){
    fill(0,0,255);
    text("印",x[12],y13);
    if(safe==0 || safe==1){
      hit12();
    }
  }
  x[12]+=dx13;
  if(x[12]<0 || x[12]>550){
    dx13=-dx13;
  }
  y13+=speed[12];
  if(y13>600){
     ran13 = (int) random(12,15);
     x[12]  = (int) random(0,500);
     speed[12] = random(0.5,2.5);
     dx13 = random(0,10);
     y13=-100;
  }
  
}

void country14(){
  if(ran14==12){
    fill(255,255,0);
    text("玖",x[13],y14);
    if(safe==1 || safe==2){
      hit13();
    }
  }
  if(ran14==13){
    fill(0,255,0);
    text("希",x[13],y14);
    if(safe==0 || safe==2){
      hit13();
    }
  }
  if(ran14==14){
    fill(0,0,255);
    text("印",x[13],y14);
    if(safe==0 || safe==1){
      hit13();
    }
  }
  x[13]+=dx14;
  if(x[13]<0 || x[13]>550){
    dx14=-dx14;
  }
  y14+=speed[13];
  if(y14>600){
     ran14 = (int) random(12,15);
     x[13]  = (int) random(0,500);
     speed[13] = random(0.5,2.5);
     dx14 = random(0,10);
     y14=-100;
  }
  
}

void country15(){
  if(ran15==12){
    fill(255,255,0);
    text("玖",x[14],y15);
    if(safe==1 || safe==2){
      hit14();
    }
  }
  if(ran15==13){
    fill(0,255,0);
    text("希",x[14],y15);
    if(safe==0 || safe==2){
      hit14();
    }
  }
  if(ran15==14){
    fill(0,0,255);
    text("印",x[14],y15);
    if(safe==0 || safe==1){
      hit14();
    }
  }
  x[14]+=dx15;
  if(x[14]<0 || x[14]>550){
    dx15=-dx15;
  }
  y15+=speed[14];
  if(y15>600){
     ran15 = (int) random(12,15);
     x[14]  = (int) random(0,500);
     speed[14] = random(0.5,2.5);
     dx15 = random(0,10);
     y15=-100;
  }
  
}

//------------当たり判定----------------------------------------------------------------------------------------------------------------------------------

void hit0(){
 
  float d1=dist(x[0],y1,mouseX,mouseY);
  float d2=dist(x[0]+25,y1,mouseX,mouseY);
  float d3=dist(x[0]+50,y1,mouseX,mouseY); 
  float d4=dist(x[0],y1-25,mouseX,mouseY);
  float d5=dist(x[0],y1-50,mouseX,mouseY);
  float d6=dist(x[0]+25,y1-50,mouseX,mouseY); 
  float d7=dist(x[0]+50,y1-25,mouseX,mouseY);
  float d8=dist(x[0]+50,y1-50,mouseX,mouseY);
  
  if(d1<=hankei || d2<=hankei || d3<=hankei || d4<=hankei || d5<=hankei || d6<=hankei || d7<=hankei || d8<=hankei){
  flg+=1;
}
}
  
void hit1(){  
  
  float d9=dist(x[1],y2,mouseX,mouseY);
  float d10=dist(x[1]+25,y2,mouseX,mouseY);
  float d11=dist(x[1]+50,y2,mouseX,mouseY); 
  float d12=dist(x[1],y2-25,mouseX,mouseY);
  float d13=dist(x[1],y2-50,mouseX,mouseY);
  float d14=dist(x[1]+25,y2-50,mouseX,mouseY); 
  float d15=dist(x[1]+50,y2-25,mouseX,mouseY);
  float d16=dist(x[1]+50,y2-50,mouseX,mouseY);
  
  if(d9<=hankei || d10<=hankei || d11<=hankei || d12<=hankei || d13<=hankei || d14<=hankei || d15<=hankei || d16<=hankei){
  flg+=1;
}
}
  
void hit2(){
  
  float d17=dist(x[2],y3,mouseX,mouseY);
  float d18=dist(x[2]+25,y3,mouseX,mouseY);
  float d19=dist(x[2]+50,y3,mouseX,mouseY); 
  float d20=dist(x[2],y3-25,mouseX,mouseY);
  float d21=dist(x[2],y3-50,mouseX,mouseY);
  float d22=dist(x[2]+25,y3-50,mouseX,mouseY); 
  float d23=dist(x[2]+50,y3-25,mouseX,mouseY);
  float d24=dist(x[2]+50,y3-50,mouseX,mouseY);
  
  if(d17<=hankei || d18<=hankei || d19<=hankei || d20<=hankei || d21<=hankei || d22<=hankei || d23<=hankei || d24<=hankei){
  flg+=1;
}
}

void hit3(){
  float d25=dist(x[3],y4,mouseX,mouseY);
  float d26=dist(x[3]+25,y4,mouseX,mouseY);
  float d27=dist(x[3]+50,y4,mouseX,mouseY); 
  float d28=dist(x[3],y4-25,mouseX,mouseY);
  float d29=dist(x[3],y4-50,mouseX,mouseY);
  float d30=dist(x[3]+25,y4-50,mouseX,mouseY); 
  float d31=dist(x[3]+50,y4-25,mouseX,mouseY);
  float d32=dist(x[3]+50,y4-50,mouseX,mouseY);
  
  if(d25<=hankei || d26<=hankei || d27<=hankei || d28<=hankei || d29<=hankei || d30<=hankei || d31<=hankei || d32<=hankei){
  flg+=1;
}
}
  
void hit4(){  
  float d33=dist(x[4],y5,mouseX,mouseY);
  float d34=dist(x[4]+25,y5,mouseX,mouseY);
  float d35=dist(x[4]+50,y5,mouseX,mouseY); 
  float d36=dist(x[4],y5-25,mouseX,mouseY);
  float d37=dist(x[4],y5-50,mouseX,mouseY);
  float d38=dist(x[4]+25,y5-50,mouseX,mouseY); 
  float d39=dist(x[4]+50,y5-25,mouseX,mouseY);
  float d40=dist(x[4]+50,y5+50,mouseX,mouseY);
  
  if(d33<=hankei || d34<=hankei || d35<=hankei || d36<=hankei || d37<=hankei || d38<=hankei || d39<=hankei || d40<=hankei){
  flg+=1;
}
}

void hit5(){
  float d41=dist(x[5],y6,mouseX,mouseY);
  float d42=dist(x[5]+25,y6,mouseX,mouseY);
  float d43=dist(x[5]+50,y6,mouseX,mouseY); 
  float d44=dist(x[5],y6-25,mouseX,mouseY);
  float d45=dist(x[5],y6-50,mouseX,mouseY);
  float d46=dist(x[5]+25,y6-50,mouseX,mouseY); 
  float d47=dist(x[5]+50,y6-25,mouseX,mouseY);
  float d48=dist(x[5]+50,y6+50,mouseX,mouseY);
  
  if(d41<=hankei || d42<=hankei || d43<=hankei || d44<=hankei || d45<=hankei || d46<=hankei || d47<=hankei || d48<=hankei){
  flg+=1;
}
}

void hit6(){
 
  float d49=dist(x[6],y7,mouseX,mouseY);
  float d50=dist(x[6]+25,y7,mouseX,mouseY);
  float d51=dist(x[6]+50,y7,mouseX,mouseY); 
  float d52=dist(x[6],y7-25,mouseX,mouseY);
  float d53=dist(x[6],y7-50,mouseX,mouseY);
  float d54=dist(x[6]+25,y7-50,mouseX,mouseY); 
  float d55=dist(x[6]+50,y7-25,mouseX,mouseY);
  float d56=dist(x[6]+50,y7-50,mouseX,mouseY);
  
  if(d49<=hankei || d50<=hankei || d51<=hankei || d52<=hankei || d53<=hankei || d54<=hankei || d55<=hankei || d56<=hankei){
  flg+=1;
}
}

void hit7(){  
  float d57=dist(x[7],y8,mouseX,mouseY);
  float d58=dist(x[7]+50,y8+50,mouseX,mouseY);
  float d59=dist(x[7]+25,y8,mouseX,mouseY);
  float d60=dist(x[7]+50,y8,mouseX,mouseY); 
  float d61=dist(x[7],y8-25,mouseX,mouseY);
  float d62=dist(x[7],y8-50,mouseX,mouseY);
  float d63=dist(x[7]+25,y8-50,mouseX,mouseY); 
  float d64=dist(x[7]+50,y8-25,mouseX,mouseY);
  
  if(d57<=hankei || d58<=hankei || d59<=hankei || d60<=hankei || d61<=hankei || d62<=hankei || d63<=hankei || d64<=hankei){
  flg+=1;
}
}

void hit8(){  
  float d65=dist(x[8],y9,mouseX,mouseY);
  float d66=dist(x[8]+25,y9,mouseX,mouseY);
  float d67=dist(x[8]+50,y9,mouseX,mouseY);
  float d68=dist(x[8],y9-25,mouseX,mouseY); 
  float d69=dist(x[8],y9-50,mouseX,mouseY);
  float d70=dist(x[8]+25,y9-50,mouseX,mouseY);
  float d71=dist(x[8]+50,y9-25,mouseX,mouseY); 
  float d72=dist(x[8]+50,y9+50,mouseX,mouseY);
  
  if(d65<=hankei || d66<=hankei || d67<=hankei || d68<=hankei || d69<=hankei || d70<=hankei || d71<=hankei || d72<=hankei){
  flg+=1;
}
}


void hit9(){
 
  float d73=dist(x[9],y10,mouseX,mouseY);
  float d74=dist(x[9]+25,y10,mouseX,mouseY);
  float d75=dist(x[9]+50,y10,mouseX,mouseY); 
  float d76=dist(x[9],y10-25,mouseX,mouseY);
  float d77=dist(x[9],y10-50,mouseX,mouseY);
  float d78=dist(x[9]+25,y10-50,mouseX,mouseY); 
  float d79=dist(x[9]+50,y10-25,mouseX,mouseY);
  float d80=dist(x[9]+50,y10+50,mouseX,mouseY);
  
  if(d73<=hankei || d74<=hankei || d75<=hankei || d76<=hankei || d77<=hankei || d78<=hankei || d79<=hankei || d80<=hankei){
  flg+=1;
}
}

void hit10(){  
  float d81=dist(x[10],y11,mouseX,mouseY);
  float d82=dist(x[10]+25,y11,mouseX,mouseY);
  float d83=dist(x[10]+50,y11,mouseX,mouseY); 
  float d84=dist(x[10],y11-25,mouseX,mouseY);
  float d85=dist(x[10],y11-50,mouseX,mouseY);
  float d86=dist(x[10]+25,y11-50,mouseX,mouseY); 
  float d87=dist(x[10]+50,y11-25,mouseX,mouseY);
  float d88=dist(x[10]+50,y11+50,mouseX,mouseY);
  
  if(d81<=hankei || d82<=hankei || d83<=hankei || d84<=hankei || d85<=hankei || d86<=hankei || d87<=hankei || d88<=hankei){
  flg+=1;
}
}
  
void hit11(){  
  float d89=dist(x[11],y12,mouseX,mouseY);
  float d90=dist(x[11]+25,y12,mouseX,mouseY);
  float d91=dist(x[11]+50,y12,mouseX,mouseY); 
  float d92=dist(x[11],y12-25,mouseX,mouseY);
  float d93=dist(x[11],y12-50,mouseX,mouseY);
  float d94=dist(x[11]+25,y12-50,mouseX,mouseY); 
  float d95=dist(x[11]+50,y12-25,mouseX,mouseY);
  float d96=dist(x[11]+50,y12+50,mouseX,mouseY);
  
  if(d89<=hankei || d90<=hankei || d91<=hankei || d92<=hankei || d93<=hankei || d94<=hankei || d95<=hankei || d96<=hankei){
  flg+=1;
}
}

void hit12(){
 
  float d97=dist(x[12],y13,mouseX,mouseY);
  float d98=dist(x[12]+25,y13,mouseX,mouseY);
  float d99=dist(x[12]+50,y13,mouseX,mouseY); 
  float d100=dist(x[12],y13-25,mouseX,mouseY);
  float d101=dist(x[12],y13-50,mouseX,mouseY);
  float d102=dist(x[12]+25,y13-50,mouseX,mouseY); 
  float d103=dist(x[12]+50,y13-25,mouseX,mouseY);
  float d104=dist(x[12]+50,y13+50,mouseX,mouseY);
  
  if(d97<=hankei || d98<=hankei || d99<=hankei || d100<=hankei || d101<=hankei || d102<=hankei || d103<=hankei || d104<=hankei){
  flg+=1;
}
}

void hit13(){  
  float d105=dist(x[13],y14,mouseX,mouseY);
  float d106=dist(x[13]+25,y14,mouseX,mouseY);
  float d107=dist(x[13]+50,y14,mouseX,mouseY); 
  float d108=dist(x[13],y14-25,mouseX,mouseY);
  float d109=dist(x[13],y14-50,mouseX,mouseY);
  float d110=dist(x[13]+25,y14-50,mouseX,mouseY); 
  float d111=dist(x[13]+50,y14-25,mouseX,mouseY);
  float d112=dist(x[13]+50,y14+50,mouseX,mouseY);
  
  if(d105<=hankei || d106<=hankei || d107<=hankei || d108<=hankei || d109<=hankei || d110<=hankei || d111<=hankei || d112<=hankei){
  flg+=1;
}
}
  
void hit14(){  
  float d113=dist(x[14],y15,mouseX,mouseY);
  float d114=dist(x[14]+25,y15,mouseX,mouseY);
  float d115=dist(x[14]+50,y15,mouseX,mouseY); 
  float d116=dist(x[14],y15-25,mouseX,mouseY);
  float d117=dist(x[14],y15-50,mouseX,mouseY);
  float d118=dist(x[14]+25,y15-50,mouseX,mouseY); 
  float d119=dist(x[14]+50,y15-25,mouseX,mouseY);
  float d120=dist(x[14]+50,y15+50,mouseX,mouseY);
  
  if(d113<=hankei || d114<=hankei || d115<=hankei || d116<=hankei || d117<=hankei || d118<=hankei || d119<=hankei || d120<=hankei){
  flg+=1;
}
}

  //  ----------------レベルの表示------------------------------------------------------------------------------------------------------------------------

void leveltext(){
  fill(255,0,0);
    text("level1",20,50);
}

void leveltext2(){
  fill(255,0,0);
    text("level2",20,50);
}

void leveltext3(){
  fill(255,0,0);
    text("level3",20,50);
}

void leveltext4(){
  fill(255,0,0);
    text("level4",20,50);
}

void leveltext5(){
    text("level5",20,50);
}

//セーフティゾーンの設定---------------------------------------------------------------------------------------------------------------------------------------

void safe(){
  if(safe==0){
    text("Safety Area:",10,500);
    text("北アメリカ",10,550);
    if(s==10 || s==20 || s==30 || s==40 || s==50 || s==60 || s==70 || s==80 || s==90){
    safe = (int) random(0,3);
    }
  }
  
  if(safe==1){
    text("Safety Area:",10,500);
    text("ヨーロッパ",10,550);
    if(s==10 || s==20 || s==30 || s==40 || s==50 || s==60 || s==70 || s==80 || s==90){
    safe = (int) random(0,3);
    }
  }
  
  if(safe==2){
    text("Safety Area:",10,500);
    text("アジア",10,550);
    if(s==10 || s==20 || s==30 || s==40 || s==50 || s==60 || s==70 || s==80 || s==90){
    safe = (int) random(0,3);
    }
  }
}
//void stop(){
//  if(mousePressed){
//    flg = 0;
//  }
//  
//  
//  player.close();  
//  minim.stop();
//  super.stop();
//  }
