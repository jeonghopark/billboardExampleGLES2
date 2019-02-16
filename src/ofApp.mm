#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {

    ofBackground(10);
    
    zoom = -500;
    zoomTarget = 200;
    
    billboards.setUsage( GL_DYNAMIC_DRAW );
    billboards.setMode(OF_PRIMITIVE_POINTS);
    billboards.enableColors();
    billboards.enableTextures();
    
    
    for (int i=0; i<NUM_BILLBOARDS; i++) {
        billboardVels[i].set(ofRandomf(), -1.0, ofRandomf());
        billboards.addVertex(ofVec3f(ofRandom(-500, 500), ofRandom(-500, 500), ofRandom(-500, 500)));
        billboards.addNormal(ofVec3f(1, 0, 0));
        billboards.addColor(ofColor::fromHsb(ofRandom(96, 160), 255, 255));
        billboardSizeTarget[i] = ofRandom(4, 64);
    }
    
    billboardShader.load("BillboardGLES.vert", "BillboardGLES.frag", "");
    
    ofDisableArbTex();
    image.load("dot_e.png");
    texture = image.getTexture();
    ofEnableAlphaBlending();

}


//--------------------------------------------------------------
void ofApp::update() {
    
    float t = (ofGetElapsedTimef()) * 0.9f;
    float div = 250.0;
    
    for (int i=0; i<NUM_BILLBOARDS; i++) {
        ofVec3f _vec(ofSignedNoise(t, billboards.getVertex(i).y/div, billboards.getVertex(i).z/div), ofSignedNoise(billboards.getVertex(i).x/div, t, billboards.getVertex(i).z/div), ofSignedNoise(billboards.getVertex(i).x/div, billboards.getVertex(i).y/div, t));
        
        _vec *= 10 * ofGetLastFrameTime();
        billboardVels[i] += _vec;
        billboards.getVertices()[i] += billboardVels[i];
        billboardVels[i] *= 0.94;
        billboards.setNormal(i, ofVec3f(12 + billboardSizeTarget[i] * ofNoise(t+i),0,0));
    }
        
}


//--------------------------------------------------------------
void ofApp::draw() {
    
    string info = ofToString(ofGetFrameRate(), 2)+"\n";
    info += "Particle Count: " + ofToString(NUM_BILLBOARDS);
    ofDrawBitmapStringHighlight(info, 30, 30);
    

    camera.begin();

    ofPushMatrix();

    billboardShader.begin();

    ofEnablePointSprites();
    texture.bind();
    billboards.draw();
    texture.unbind();
    ofDisablePointSprites();

    billboardShader.end();
    
    ofPopMatrix();
    
    camera.end();
    
}




//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs &touch){
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs &touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs &touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs &touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs& args){
    
}


