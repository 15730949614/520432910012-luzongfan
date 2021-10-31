float g;
ArrayList lightPointsArr = new ArrayList();
PVector gravity = new PVector(g,g);

void setup() {
  size(640,640);
}

void draw() {
  background(0);
  for(int i = 0;i< lightPointsArr.size();i++){
       lightPoints points = (lightPoints) lightPointsArr.get(i);
       points.draw();
     }
       
    for (int i = 0; i < mouseX/12; i++) {
       lightPointsArr.add(new lightPoints());
         }
  
}

class lightPoints{
    PVector location;
    PVector speed;
    PVector acceleration;
    float circleR;
    float topspeed;
    lightPoints(){
       location = new PVector(mouseX,mouseY);
       speed =  new PVector(0,0);
       acceleration = new PVector(0, random(0, 1));
       circleR = random(5,10);      
       topspeed = 4;
    }

void draw(){
  PVector mouse = new PVector(mouseX,mouseY);
    acceleration = PVector.sub(mouse,location);
    acceleration.setMag(0.2); 
    speed.add(acceleration);
    speed.limit(topspeed);
    location.add(speed);
    acceleration.add(gravity);
    gravity.mult(0);
    fill(random(0,255), random(0, 255), 0,  random(50, 255));
    ellipse(location.x, location.y, circleR, circleR);   
  }
}
