//--------------------------------------------INIT

//OpenGL
import javax.media.opengl.*;
import processing.opengl.*;
GL2 gl;
PGraphicsOpenGL pgogl;

//oscP5
import oscP5.*;
OscP5 oscP5;

//PGraphics
PGraphics pg = new PGraphics();
PGraphics[] phrasepg = new PGraphics[1];

Layers layers;
OscData oscdata;

void setup() {
  size(displayWidth, displayHeight, P3D);
  colorMode(ARGB, 100);
  background(#000000);
  frameRate(30);

  //new object
  oscdata = new OscData();
  layers = new Layers(pg, oscdata);

  //OpenGL for Processing 2.x
  pgogl = (PGraphicsOpenGL) g;
  PGL pgl = pgogl.beginPGL();
  gl = pgl.gl.getGL().getGL2();
  pgogl.endPGL();

  //start oscP5
  oscP5 = new OscP5(this, 8888);

  //layers-init
  pg = createGraphics(displayWidth, displayHeight, P3D);

  //phrase-new
  CircleMeter circlemeter = new CircleMeter(layers.pg, oscdata, displayWidth/2, displayHeight/2, 255);
  BlockMeter blockmeter = new BlockMeter(layers.pg, oscdata, displayWidth/2, displayHeight/2, 255);
  ArcMeter arcmeter = new ArcMeter(layers.pg, oscdata, displayWidth/2, displayHeight/2, 255);
  Tile tile = new Tile(layers.pg, oscdata, displayWidth/2, displayHeight/2, 255);
  Noise noise = new Noise(layers.pg, oscdata, displayWidth/2, displayHeight/2, 255);

  //phrase-add
  //0=Grobal, 1=DeckA, 2=DeckB
  //layers.add(1, circlemeter);
  layers.add(2, blockmeter);
  layers.add(1, arcmeter);
  layers.add(0, tile);
  //layers.add(noise);

  oscP5.plug(this, "oscVolumeA", "/A/volume");
  oscP5.plug(this, "oscFilterA", "/A/filter");
  oscP5.plug(this, "oscEQhiA", "/A/EQ/hi");
  oscP5.plug(this, "oscEQmdA", "/A/EQ/md");
  oscP5.plug(this, "oscEQloA", "/A/EQ/lo");
  //oscP5.plug(this, "oscFX1buttonA", "/A/FX/1b");
  //oscP5.plug(this, "oscFX2buttonA", "/A/FX/2b");

  oscP5.plug(this, "oscVolumeB", "/B/volume");
  oscP5.plug(this, "oscFilterB", "/B/filter");
  oscP5.plug(this, "oscEQhiB", "/B/EQ/hi");
  oscP5.plug(this, "oscEQmdB", "/B/EQ/md");
  oscP5.plug(this, "oscEQloB", "/B/EQ/lo");
  //oscP5.plug(this, "oscFX1buttonB", "/B/FX/1b");
  //oscP5.plug(this, "oscFX2buttonB", "/B/FX/2b");

  oscP5.plug(this, "oscTap", "/G/tap");
  oscP5.plug(this, "oscActiveL", "/G/activeL");
  oscP5.plug(this, "oscActiveR", "/G/activeR");
  oscP5.plug(this, "oscSet", "/G/set");
  oscP5.plug(this, "oscPrev", "/G/prev");
  oscP5.plug(this, "setNext", "/G/next");
  //oscP5.plug(this, "oscFX1buttonG", "/G/FX/1b");
  //oscP5.plug(this, "oscFX2buttonG", "/G/FX/2b");
  //oscP5.plug(this, "oscFX1sliderG", "/G/FX/1s");
  //oscP5.plug(this, "oscFX2sliderG", "/G/FX/2s");
  
}

void oscVolumeA(int value) {layers.controller_volume(value, 1);}
void oscVolumeB(int value) {layers.controller_volume(value, 2);}
void oscFilterA(int value) {layers.controller_filter(value, 1);}
void oscFilterB(int value) {layers.controller_filter(value, 2);}
void oscEQhiA(int value) {layers.controller_eq(value, 1, 0);}
void oscEQmdA(int value) {layers.controller_eq(value, 1, 1);}
void oscEQloA(int value) {layers.controller_eq(value, 1, 2);}
void oscEQhiB(int value) {layers.controller_eq(value, 2, 0);}
void oscEQmdB(int value) {layers.controller_eq(value, 2, 1);}
void oscEQloB(int value) {layers.controller_eq(value, 2, 2);}

void oscTap(int value) {layers.controller_tap(value, 0);}
void oscActiveL(int value) {layers.controller_activeL(value, 0);}
void oscActiveR(int value) {layers.controller_activeR(value, 0);}
void oscSet(int value) {layers.controller_set(value, 0);}
void oscPrev(int value) {layers.controller_prev(value, 0);}
void oscNext(int value) {layers.controller_next(value, 0);}

void draw() {
  //debug();

  noCursor();
  
  pgogl.beginPGL();
  gl.glBlendFunc(gl.GL_ONE, gl.GL_ZERO);
  noStroke();
  fill(#000000, 255);
  rectMode(CORNER);
  rect(0, 0, displayWidth, displayHeight);
  layers.draw();
  pgogl.endPGL();

  pgogl.beginPGL();
  gl.glBlendFunc(gl.GL_SRC_ALPHA, gl.GL_ONE);
  //gl.glBlendFunc(gl.GL_ZERO, gl.GL_);
  layers.trace();
  pgogl.endPGL();
  
  //Movie
  //saveFrame("A:\frame/#####.tif");
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/multi")) {
    int i;
    for (i=0;i<10;i++) {
      oscdata.multi[i] = theOscMessage.get(i).floatValue();
    }
  }
  if (theOscMessage.checkAddrPattern("/volume")) {
    oscdata.volume = theOscMessage.get(0).floatValue();
    layers.update();
  }
}

void debug() {
  for (int i=0;i<10;i++) {
    print(oscdata.multi[i] + "  ");
  }
  print("\n");
}
