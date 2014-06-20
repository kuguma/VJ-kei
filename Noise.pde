public class Noise extends Phrase {

  Noise(PGraphics _layerspg, OscData _oscdata, float _x, float _y, float _a) {
    super(_layerspg, _oscdata, _x, _y, _a);
  }

  public void draw() {
    fade(255);
    thispg.beginDraw();

    float noiseScale=0.02;
    //background(0);
    //float noiseVal = noise((oscdata.volume*500+x)*noiseScale, oscdata.volume*500+noiseScale);
    //stroke(noiseVal*255,a);
    //line(x, mouseY+noiseVal*80, x, height);
    for (int i=0;i<displayWidth;i++) {
      stroke(random(255),a);
      line(i, 0, i, displayHeight);
    }
    for (int j=0;j<displayHeight;j++) {
      stroke(random(255),a);
      line(0, j, displayWidth, j);
    }

    thispg.endDraw();
  }

  public void update() {
  }

}

