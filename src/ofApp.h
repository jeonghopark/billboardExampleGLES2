#pragma once

#include "ofxiOS.h"

#define NUM_BILLBOARDS 5000

class ofApp : public ofxiOSApp {
public:
    void setup();
    void update();
    void draw();
    
    void touchDown(ofTouchEventArgs &touch);
    void touchMoved(ofTouchEventArgs &touch);
    void touchUp(ofTouchEventArgs &touch);
    void touchDoubleTap(ofTouchEventArgs &touch);
    void touchCancelled(ofTouchEventArgs &touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    

    ofEasyCam camera;
    float zoom, zoomTarget;
    
    // billboard particles
    float billboardSizeTarget[NUM_BILLBOARDS];
    
    ofShader billboardShader;
    ofImage image;
    ofTexture texture;
    ofVboMesh billboards;
    ofVec3f billboardVels[NUM_BILLBOARDS];
};









