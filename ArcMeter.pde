public class ArcMeter extends Phrase {
  float[] volume = new float[10];
  float r = 0;

  ArcMeter(PGraphics _layerspg, OscData _oscdata, float _x, float _y, float _a) {
    super(_layerspg, _oscdata, _x, _y, _a);

    //P2Dだとarcが何故か動かないのでこうしている
    thispg = new PGraphics();
    thispg = createGraphics(displayWidth, displayHeight, JAVA2D);
    
    midiassign = 0;
  }

  public void draw() {
    fade(255);
    thispg.beginDraw();
    thispg.strokeCap(SQUARE);
    thispg.strokeWeight(80);
    thispg.noFill();
    thispg.colorMode(HSB,255);
    for (int i=0;i<10;i++) {
      thispg.stroke(random(0, 255), random(S_min, S_max), random(0, 255), a);
      if (volume[i]>=0.01) {
        thispg.arc(x, y, displayHeight/10*(i+1), displayHeight/10*(i+1), r*((i%2)-0.5)*2 + PI*2/10*(i+1) - volume[i]*volume[i]*30, r*((i%2)-0.5)*2 + PI*2/10*(i+1) + volume[i]*volume[i]*30);
      }
    }
    thispg.endDraw();
  }

  public void update() {
    for (int i=0;i<10;i++) {
      if (volume[i] < oscdata.multi[i]) {
        volume[i] = oscdata.multi[i];
      }
      volume[i] = volume[i]-0.005;
    }
    r = r + oscdata.volume/50;
    if (r>=PI*2) r=0.0;
  }
}

