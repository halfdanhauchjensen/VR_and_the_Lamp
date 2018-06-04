#pragma once

#include "ofMain.h"
#include "ofxOpenCv.h"
#include "ofxKinect.h"
#include "ofxOsc.h"

// send host (aka ip address)
#define HOST "10.29.172.238"//"localhost"

/// send port
#define SEND_PORT 12345
#define RECEIVE_PORT 54321

#define AREA_THREAS 1000

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();
        void exit();
    
        void drawPointCloud();


		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void mouseEntered(int x, int y);
		void mouseExited(int x, int y);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
    
        void sendDmxOverSerial(int addr, int val);
    
        ofxKinect kinect;
    
        ofSerial serial;
        int dmxAddress;
        int dmxValue;
        long dmxSendTimer;
        #define DMX_SEND_INTERVAL 1000//dmxSendInterval;
    

#ifdef USE_TWO_KINECTS
    ofxKinect kinect2;
#endif
    
    ofxCvColorImage colorImg;
    
    ofxCvGrayscaleImage grayImage; // grayscale depth image
    ofxCvGrayscaleImage grayThreshNear; // the near thresholded image
    ofxCvGrayscaleImage grayThreshFar; // the far thresholded image
    
    ofxCvContourFinder contourFinder;
    
    bool bThreshWithOpenCV;
    bool bDrawPointCloud;
    
    int nearThreshold;
    int farThreshold;
    
    int angle;
    
    // used for viewing the point cloud
    ofEasyCam easyCam;
    
    int nrOfBlobs;
    
    ofTrueTypeFont font;
    ofxOscSender sender;
    ofxOscReceiver receiver;
    
};
