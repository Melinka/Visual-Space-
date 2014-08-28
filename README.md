Visual-Space-
=============

Interactive, motion-based video manipulation. 

Visual Space is an interactive, digital installation, which creates a fully immersive environment. The application uses computer vision technology to enable particpants to trigger video, sound and visual effects in real-time. The position of different limbs is detected via a Microsoft Xbox Kinect. Tracking data are extracted in Processing and manipulated in Max/MSP Jitter. In addition,
the system features a customisable interface, which allows users to load in their own video clips and which offers a palette of effects to select from. As a result, every interaction is unique and individual to the user.

Please note that this is environment has been created for single user interaction.

-------------------------------------------

System Requirements:
-------

- Mac OS X 
- Processing 1.5.1 (also works with Processing 2.1, but might not work with later versions)
- Max/MSP Jitter 6

Installation:
-------------

- Save the folder "InteractiveSystem" on your Desktop. 

- Download and install:

    SimpleOpenNI for Processing (http://code.google.com/p/simple-openni/wiki/Installation).

      MaxLink for Max and Processing (http://jklabs.net/maxlink/index.html%3Fpage=downloads.html)

- Installing "startprocessing":

- For Max/MSP 6

    Drag the "startprocessing_java_max_external" folder into the /Library/Application Support/Cycling '74/java/classes folder.

- Restart Max.

- Start Visual Space by opening VisualSpace.maxpat.

For better tracking performance, consider using jit.openni (https://github.com/diablodale/jit.openni), which provides faster and more 
accurate tracking.

Hardware:
----

- MacBook
- XBox 360
- Screen
- Webcam

---------------------------------------

To use the customised user interface, you just need to run the Max Patch in presentation mode. The user interface features different panels that allow you to load in a main video clip for which you can select interactive video controls that can be linked to different limbs and their movement along x, y and z. In addtion, VS enables to load in a second video clip that can be mixed in on movement as well as an audio file. You can also select a video input source to enable the participant to mix in live-video. Make sure the controls for showing live video or the uploaded media are selected! Sound control is restricted to motion-based adjustment of volume as Visual Space focuses mainly on video manipulation. As soon as you have selected the controls of your choice and have loaded in all your media assets, you are ready to go! In order to be tracked you need to stand in front of the Kinect in a 'Y' shape position. The Processing library I'm using doesn't always track the user instantly, so please be patient!

Each controls can only be linked to one joint at a time. 

This video shows how to load in the media assets using the VS interface and demonstrates the interactions the application features:
https://www.youtube.com/watch?v=44C15RXux3Q
