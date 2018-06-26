String errorString = "";

void setup(){
  size(640, 480);
 
}

void draw(){
  background(255);
  strokeWeight(4);
  stroke(255,0,0);
  rect(0,0,width,height); // draw frame
  stroke(0);
  strokeWeight(3);
  
  // set point 1 and point 2 x & y positions here
  int p1x = 50;
  int p1y = height/2-50;
  int p2x = mouseX;
  int p2y = mouseY;
  
  // draw X & Y axis
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  
  PVector center = new PVector(width/2, height/2);
  PVector point2 = new PVector(p2x, p2y);
  PVector point1 = new PVector(p1x, p1y);
  PVector xAxis = new PVector(width, height/2);
  
  stroke(0,255,0);
  line(center.x, center.y, point1.x, point1.y);
  stroke(0,0,255);
  line(center.x, center.y, point2.x, point2.y);
  stroke(0,255,255);
  line(center.x, center.y, xAxis.x, xAxis.y);
  
  point1.sub(center);
  println(point1.x,point1.y);
  
  point2.sub(center);
  println(point2.x,point2.y);
  
  xAxis.sub(center);
  println(xAxis.x,xAxis.y);
  
  float a1 = degrees(PVector.angleBetween(point1, point2));
  println("DEG between point 1 & point 2: " + a1);  // Prints "10.304827"PVector 
  
  float a2 = degrees(PVector.angleBetween(xAxis, point1));
  println("DEG between xAxis & point 1: " + a2);  // Prints "10.304827"PVector 
  
  float a3 = degrees(PVector.angleBetween(xAxis, point2));
  println("DEG between xAxis & point 2: " + a3);  // Prints "10.304827"PVector 
  
  float p1rotation;
  if (p1y < height/2){
    p1rotation = a2;
    //println("point 1 rotation DEG: " + a2);
  }
  else {
    p1rotation = 360-a2;
    //println("point 1 rotation DEG: " + (360 - a2));
  }
  println("DEG point 1 rotation from x-axis (P1R): " + p1rotation);
  
  float p2rotation;
  if (p2y < height/2){
    p2rotation = a3;
    //println("point 2 rotation DEG: " + a3);
  }
  else {
    p2rotation = 360-a3;
    //println("point 2 rotation DEG: " + (360 - a3));
  }
  println("DEG point 2 rotation from x-axis (P2R): " + p2rotation);

  float rotation = p1rotation-p2rotation;
  println("P1R-P2R : " + rotation);
  if (rotation > 0 && rotation < 180){
    println("clockwise");
  } 
  else if(rotation < -180 && rotation > -360){
    println("clockwise");
  }
  else if (rotation < 0 && rotation > -180){
    println("counter clockwise");
  }
  
  else if(rotation > 180 && rotation < 360){
    println("counter clockwise");
  }
  else {
    errorString = "ERROR: a state not catched";
  }
  println(errorString);
  println();
  println();
  
}

// LOGIC

// clockwise:
//   positive < 180 : between (0) and (180)
//     or
//   negative > 180 : between (-180) and (-360)

// counter clockwise:
//   negative < 180 : between (0) and (-180)
//     or
//   positive > 180 : between (180) and (360)



// ToDo
// include intervals <= and >= 
// since we are dealing with floats im not sure if there is any here, but there might be
// examine this with a else state giving a message when this occurs
