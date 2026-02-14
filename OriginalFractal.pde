double saz = 3; //3
boolean[] inputs = new boolean[3];
void setup(){
  size(400,400);
  rectMode(CENTER);
  pushMatrix();
  pushMatrix();
  //myFractal(200,200,200, 100);
  for (int i = 0; i < inputs.length;i++){
    inputs[i] = false;
  }
}

void draw(){
  background(0);
  stroke(1);
  fill(255,0,0);
  if (saz < 200){
    myFractal(200,200,(int)saz, (int)(saz/2));
  }else{myFractal(200,200,(int)saz, 100);}
  detectInputs();
  popMatrix();
  fill(0);
  shard(200,200,(int)(saz/200));
  pushMatrix();
  if(saz < 1){
    saz = 3.808213964374158E11;
  }
  
}

public void detectInputs(){
  if(inputs[2]){
  if (inputs[0]){
    saz+=saz/20;
  }
  if (inputs[1]){
    saz-=saz/20;
  }
  } else{
  if (inputs[0]){
    saz+=saz/200;
  }
  if (inputs[1]){
    saz-=saz/200;
  }
  }
  
}

void keyPressed(){
  if (keyCode == UP){
    inputs[0] = true;
  }
  if (keyCode == DOWN){
    inputs[1] = true;
  }
  if (keyCode == SHIFT){
    inputs[2] = true;
  }
  
}

void keyReleased(){
  if (keyCode == UP){
    inputs[0] = false;
  }
  if (keyCode == DOWN){
    inputs[1] = false;
  }
  if (keyCode == SHIFT){
    inputs[2] = false;
  }
  
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
    if (dis != 0 || dis <= siz/2){// || dis != 0){
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
  //eyes
  if (saz > 40000){
  fill(255,255,0);
  ellipse(x+size/3.0+size/300.0,y+size/2.0,size/180.0, size/180.0);
  fill(255,0,255);
  ellipse(x+size/3.0-size/300.0,y+size/2.0,size/180.0, size/180.0);
  fill(0);
  ellipse(x+size/3.0+size/300.0,y+size/2.0,size/330.0, size/330.0);
  ellipse(x+size/3.0-size/300.0,y+size/2.0,size/330.0, size/330.0);
  //tree
  if (saz>4000000){ //avoid rendering until distance achieved
  stroke(255,0,0);
  rect(x+size/3.0+size/300000,y+size/2.0+size/25000-size/75000.0,size/40000.0,size/20000.0); //toptrunk
  rect(x+size/3.0-size/110000.0,y+size/2.0+size/15000-size/75000.0,size/20000.0,size/80000.0, 100); //jointtrunk
  rect(x+size/3.0-size/45000,y+size/2.0+size/14000-size/75000.0,size/40000.0,size/50000.0, 100); //bottrunk
  triangle(x+size/3.0-size/45000, y+size/2.0+size/15000-size/75000.0,
          x+size/3.0-size/20000, y+size/2.0+size/12000-size/75000.0,
          x+size/3.0+size/100000.0, y+size/2.0+size/12000-size/75000.0); //roots
  noStroke();
  //flatteners
  rect(x+size/3.0+size/300000,y+size/2.0+size/25000-size/75000.0,size/41000.0,size/20000.0); //toptrunk
  rect(x+size/3.0-size/110000.0,y+size/2.0+size/15000-size/75000.0,size/20100.0,size/90000.0, 100); //jointtrunk
  rect(x+size/3.0-size/45000,y+size/2.0+size/14000-size/75000.0,size/41000.0,size/50000.0, 100); //bottrunk
  //leaves
  fill(255,0,0);
  rect(x+size/3.0+size/50000,y+size/2.0-size/22000-size/75000.0,size/40000.0,size/80000.0); //floater
  rect(x+size/3.0+size/250000.0,y+size/2.0-size/35000.0-size/75000.0,size/15000.0,size/60000.0); //big flat top
  rect(x+size/3.0,y+size/2.0-size/75000.0,size/10000.0,size/20000.0); //base
  rect(x+size/3.0+size/30000.0,y+size/2.0-size/75000.0-size/100000000,size/20000.0,size/34000.0); //right
  fill(200,0,100);
  rect(x+size/3.0-size/30000.0,y+size/2.0-size/75000.0+size/100000,size/20000.0,size/34000.0); //chungus
  rect(x+size/3.0-size/20000.0,y+size/2.0-size/75000.0,size/100000.0,size/20000.0);//vertical slice
  rect(x+size/3.0+size/60000,y+size/2.0-size/70000-size/75000.0,size/40000.0,size/80000.0);// one in the middle
  rect(x+size/3.0+size/250000.0,y+size/2.0+size/35000.0-size/75000.0,size/15000.0,size/60000.0); //big flat bottom
  rect(x+size/3.0+size/24000.0,y+size/2.0+size/50000-size/75000.0,size/60000.0,size/80000.0);//bottom right square
  fill(255,0,0);
  rect(x+size/3.0-size/15000,y+size/2.0-size/75000.0-size/200000,size/40000.0,size/100000.0); //left skinny one
  rect(x+size/3.0-size/45000,y+size/2.0+size/42000-size/75000.0,size/30000.0,size/60000.0); //2nd bottom dotter
  rect(x+size/3.0,y+size/2.0+size/25000-size/75000.0,size/40000.0,size/60000.0); //bottom dotter
  if (saz > 2000000000){
    System.out.println(saz);
    fill(0);
    stroke(255,0,0);
    rect(x+size/3.0,y+size/2.0,size/3000000,size/3000000);
    if (saz > 3.808213964374158E11){saz = 1;}
  }
  }}
}



