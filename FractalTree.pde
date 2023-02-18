private double fractionLength = .8; //0.8
private int smallestBranch = 6;  //10
private double branchAngle = .5;  //0.2
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(55,95,121);   
  strokeWeight(2);
  line(320,480,320,380);   
  drawBranches(320, 380, 80, 3*Math.PI/2);  //will add later
  
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle; //hold the angles of the branches, create V shape 
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  branchLength = branchLength * fractionLength; //shorter length of the new branch
  
  //cosmetics 
  stroke(239,241,243);
  line(x, y, endX1, endY1);
  strokeWeight(3);
  stroke(219,211,216);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
