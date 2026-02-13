double saz = 200;
void setup(){
  size(400,400);
  rectMode(CENTER);
  pushMatrix();
  pushMatrix();
  //myFractal(200,200,200, 100);
}

void draw(){
  background(0);
  fill(255,0,0);
  myFractal(200,200,(int)saz, 100);
  saz+=saz/200;
  popMatrix();
  fill(0);
  shard(200,200,(int)(saz/200));
  pushMatrix();
  
}

public void myFractal(int x, int y, int siz, int dis)
{
  popMatrix();
  pushMatrix();
  translate(x,0);
  translate(0,y);
  ellipse(0,dis,siz,siz);
  for (int i = 0; i < 7; i++){
    rotate(PI/4);
    if (dis <= siz/2){
      ellipse(0,dis,siz,siz);
    }
  }
 if(siz > 5)
 {
   myFractal(x,y,siz-siz/4, dis-dis/4);
   //myFractal(x,y,siz/4 *3);
 }
 //popMatrix();
}

void shard(int x, int y, int size){
  x-=size/3;
  y-=size/2;
  quad(x+size/6.0,y,x+size/2.0+size/7.0, y+size/4.0+size/12.0,x+size/3.0+size/6.0,y+size,x+(0.04*size),y+((size/8.0) *5.5));
  
}



