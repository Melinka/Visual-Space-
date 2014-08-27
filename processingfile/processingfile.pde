
// Adapted from: http://learning.codasign.com/index.php?title=Getting_Joint_Position_in_3D_Space_from_the_Kinect and 
//http://www.filosophy.org/2011/01/making-music-with-the-body-connecting-a-kinect-to-max-msp-via-processing/
//http://jklabs.net/maxlink/index.html%3Fpage=reference.html

import SimpleOpenNI.*;
import maxlink.*;
 
SimpleOpenNI  context;

MaxLink link = new MaxLink(this, "kinect");
 
void setup()
{
    
  context = new SimpleOpenNI(this);
 
  // enable depthMap generation 
  context.enableDepth();
 
  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
 
  background(200,0,0);
  stroke(0,0,255);
  strokeWeight(3);
  smooth();
 
  // create a window the size of the depth information
  size(context.depthWidth(), context.depthHeight()); 
}
 
void draw()
{
  line(0, 0, width, height);
  // update the camera
  context.update();
 
  // draw depth image
  image(context.depthImage(),0,0); 
 
  // for all users from 1 to 10
  int i;
  for (i=1; i<=1; i++)
  {
    // check if the skeleton is being tracked
    if(context.isTrackingSkeleton(i))
    {
      // draw the skeleton
      drawSkeleton(i);  
 
      // draw a circle for a head 
      circleForAHead(i);
      circleForRightHand(i);
      circleForLeftHand(i);
      circleForRightShoulder(i);
      circleForLeftShoulder(i);
    }
  }
}
 

// draws a circle at the position of the head
void circleForAHead(int userId)
{
  // get 3D position of a joint
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_HEAD,jointPos);
  println(" Position Head x: " + jointPos.x);
  println(" Position Head y: " + jointPos.y);
  println(" Position Head z: " + jointPos.z);
 
  // convert real world point to projective space
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
 
  // a 200 pixel diameter head
  float headsize = 200;
 
  // create a distance scalar related to the depth (z dimension)
  float distanceScalar = (525/jointPos_Proj.z);
 
  // set the fill colour to make the circle green
  fill(255,0,0); 
 
  // draw the circle at the position of the head with the head size scaled by the distance scalar
  ellipse(jointPos_Proj.x,jointPos_Proj.y, distanceScalar*headsize,distanceScalar*headsize);  
  
  link.output(0, 42 + jointPos.x + " " + jointPos.y + " " + jointPos.z); 
  
 // link.output(jointPos.x); calculates the sum of x, y, z
  //link.output(jointPos.y);
  //link.output(jointPos.z);
}

void circleForLeftHand(int userId)
{
  // get 3D position of a joint
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND,jointPos);
  println(" Position Left Hand x: " + jointPos.x);
  println(" Position Left Hand y: " + jointPos.y);
  println(" Position Left Hand z: " + jointPos.z);
 
  // convert real world point to projective space
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
  
   link.output(1, 42 + jointPos.x + " " + jointPos.y + " " + jointPos.z); 
  
}

//For left shoulder 
void circleForRightHand(int userId)
{
  // get 3D position of a joint
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND,jointPos);
  println(" Position Right Hand x: " + jointPos.x);
  println(" Position Right Hand y: " + jointPos.y);
  println(" Position Right Hand z: " + jointPos.z);
 
  // convert real world point to projective space
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
  
   link.output(2, 42 + jointPos.x + " " + jointPos.y + " " + jointPos.z); 
  
}

void circleForLeftShoulder(int userId)
{
  // get 3D position of a joint
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_SHOULDER,jointPos);
  println(" Position Left Shoulder x: " + jointPos.x);
  println(" Position Left Shoulder y: " + jointPos.y);
  println(" Position Left Shoulder z: " + jointPos.z);
 
  // convert real world point to projective space
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
  
   link.output(3, 42 + jointPos.x + " " + jointPos.y + " " + jointPos.z); 
  
}

void circleForRightShoulder(int userId)
{
  // get 3D position of a joint
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_SHOULDER,jointPos);
  println(" Position Right Shoulder x: " + jointPos.x);
  println(" Position Right Shoulder y: " + jointPos.y);
  println(" Position Right Shoulder z: " + jointPos.z);
 
  // convert real world point to projective space
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
  
   link.output(4, 42 + jointPos.x + " " + jointPos.y + " " + jointPos.z); 
  
}

 
// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{  
  // draw limbs  
  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
}


// Event-based Methods
 
// when a person ('user') enters the field of view
void onNewUser(int userId)
{
  println("New User Detected - userId: " + userId);
 
 // start pose detection
  context.startPoseDetection("Psi",userId);
}
 
// when a person ('user') leaves the field of view 
void onLostUser(int userId)
{
  println("User Lost - userId: " + userId);
}
 
// when a user begins a pose
void onStartPose(String pose,int userId)
{
  println("Start of Pose Detected  - userId: " + userId + ", pose: " + pose);
 
  // stop pose detection
  context.stopPoseDetection(userId); 
 
  // start attempting to calibrate the skeleton
  context.requestCalibrationSkeleton(userId, true); 
}
 
// when calibration begins
void onStartCalibration(int userId)
{
  println("Beginning Calibration - userId: " + userId);
}
 
// when calibration ends - successfully or unsucessfully 
void onEndCalibration(int userId, boolean successful)
{
  println("Calibration of userId: " + userId + ", successful: " + successful);
 
  if (successful) 
  { 
    println("  User calibrated !!!");
 
    // begin skeleton tracking
    context.startTrackingSkeleton(userId); 
  } 
  else 
  { 
    println("  Failed to calibrate user !!!");
 
    // Start pose detection
    context.startPoseDetection("Psi",userId);
  }
}
