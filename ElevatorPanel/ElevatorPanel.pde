import controlP5.*;
ControlP5 cp5;

color [] colors = new color[10];
color active = color(0);
int column1;
int column2;
int row1;
int row2;
int row3;
int row4;
int size;
int currentFloor = 1;
int floor=1;
int countdown;
int flag1 = 1;
int flag2 = 0;
String [] floorLables = {"B","G","M","S1","S2","S3","S4","S5"};
int signTextSize = 60;
String direction = "";
int doorOffset = 160;

void setup() {
  size(600, 1000);
  cp5 = new ControlP5(this);
  //Button and event handler
  cp5.setColorBackground(color(150))
    .setColorForeground(color(100))
    .setColorActive(color(200));
  size = 70;
  column1 = width-(width/2)-(size+25);
  column2 = width-(width/2)+25;
  row1 = height-300;
  row2 = row1-(size+25);
  row3 = row2-(size+25);
  row4 = row3-(size+25);
  PFont font = createFont("Arial",32,true);
  
  cp5.setFont(font);
 
  cp5.addButton("B")
    .setSize(size, size)
    .setPosition(column1, row1);
  cp5.addButton("G")
    .setSize(size, size)
    .setPosition(column1, row2);
  cp5.addButton("M")
    .setSize(size, size)
    .setPosition(column1, row3);
  cp5.addButton("S1")
    .setSize(size, size)
    .setPosition(column1, row4);
  cp5.addButton("S2")
    .setSize(size, size)
    .setPosition(column2, row1);
  cp5.addButton("S3")
    .setSize(size, size)
    .setPosition(column2, row2);
  cp5.addButton("S4")
    .setSize(size, size)
    .setPosition(column2, row3);
  cp5.addButton("S5")
    .setSize(size, size)
    .setPosition(column2, row4);
    
  cp5.addButton("<|>")
    .setSize(size, size)
    .setPosition(column1, row1+doorOffset);
  cp5.addButton(">|<")
    .setSize(size, size)
    .setPosition(column2, row1+doorOffset);
   
  for (int i=0; i<6; i++){
    colors[i] = active;
  }
  
}

void floorDisplay(){
  stroke(color(0));
  fill(color(0));
  rect(width-(width/2)-signTextSize-10, signTextSize-16, signTextSize*2+15, signTextSize+15);
  
  textFont(createFont("Arial",1,true), signTextSize);
  fill(255);
  text(floorLables[currentFloor], width-(width/2)-signTextSize+35, signTextSize+40);
  text(direction, width-(width/2)-signTextSize, signTextSize+40);
}

void draw() {
  stroke(color(0));
  fill(color(0));
  rect(width-(width/2)-3, height-610, 6, 406);
  rect(column1-80, row1+size+20, 160, 6);
  rect(column1-50+(size+80)+10, row1-10-(3*(size+25))-14, 160, 6);
  
  if(flag2==2){
    int delay= 500;
    textFont(createFont("Arial",1,true), signTextSize);
    fill(255);
    if (currentFloor>floor){
      direction = "v";
      delay(delay);
      currentFloor--;
      println(currentFloor);
    }
    if (currentFloor<floor){
      direction = "^";
      delay(delay);
      currentFloor++;
      println(currentFloor);
    }
    if (currentFloor==floor){
      direction = "";
      delay(delay/2);
      flag2=0;
      colors[0]=colors[1]=colors[2]=colors[3]=colors[4]=colors[5]=colors[6]=colors[7]=colors[8]=colors[9]=color(0);
    }
  }
  
  floorDisplay();
  
  active = color(220);
  for(int i=0; i<8; i++){
    stroke(color(0));
    fill(color(0));
    rect(column1-80+((size+120)*(i%2)),row1-10-(((i-(i%2))/2)*(size+25)), size+90, size+20);
    
    stroke(colors[i]);
    fill(colors[i]); 
    rect(column1-5+((size+50)*(i%2)),row1-5-(((i-(i%2))/2)*(size+25)), size+10, size+10);
  }
  
  for(int i=0; i<2; i++){
    stroke(color(0));
    fill(color(0));
    rect(column1-80+((size+120)*(i%2)),row1+doorOffset-10-(((i-(i%2))/2)*(size+25)), size+90, size+20);
    
    stroke(colors[i+8]);
    fill(colors[i+8]); 
    rect(column1-5+((size+50)*(i%2)),row1+doorOffset-5-(((i-(i%2))/2)*(size+25)), size+10, size+10);
  }
  
  if (flag2==1){
    flag2=2;
  }
}

//Generic event handler
void controlEvent(ControlEvent theEvent){
    
  
  if (theEvent.isController()){
    int multi = 0;
    if(theEvent.getName()=="B"){
      colors[0] = active;
      floor = 0;
    }
    if(theEvent.getName()=="G"){
      colors[2] = active;
      floor = 1;
    }
    if(theEvent.getName()=="M"){
      colors[4] = active;
      floor = 2;
    }
    if(theEvent.getName()=="S1"){
      colors[6] = active;
      floor = 3;
    }
    if(theEvent.getName()=="S2"){
      colors[1] = active;
      floor = 4;
    }
    if(theEvent.getName()=="S3"){
      colors[3] = active;
      floor = 5;
    }
    if(theEvent.getName()=="S4"){
      colors[5] = active;
      floor = 6;
    }
    if(theEvent.getName()=="S5"){
      colors[7] = active;
      floor = 7;
    }
    if(theEvent.getName()=="<|>"){
      colors[8] = active;
    }
    if(theEvent.getName()==">|<"){
      colors[9] = active;
    }
    
    countdown = 120 * multi;
    flag2=1;
  }
}
