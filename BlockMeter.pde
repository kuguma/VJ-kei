public class BlockMeter extends Phrase {
  int metermax = 10;
  float[] volume = new float[metermax];

  BlockMeter(PGraphics _layerspg, OscData _oscdata, float _x, float _y, float _a) {
    super(_layerspg, _oscdata, _x, _y, _a);
  }

  public void draw() {
    fade(255);
    thispg.beginDraw();
    for (int i=0;i<metermax;i++) {
      noStroke();
      thispg.colorMode(HSB,255);
      thispg.fill(random(0, 255), random(S_min, S_max), random(0, 255), a);
      rectMode(CORNERS);     
      thispg.rect((displayWidth/metermax)*i, (1.5-volume[i])*displayHeight/1.5, displayWidth/30, displayHeight);
    }
    thispg.endDraw();
    //fade(f);
  }

  public void update() {
    for (int i=0;i<10;i++) {
      if (volume[i] < oscdata.multi[i]) {
        volume[i] = oscdata.multi[i];
      }
      volume[i] = volume[i]-0.005;
    }
  }
}

