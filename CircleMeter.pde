public class CircleMeter extends Phrase {
  float r;
  CircleMeter(PGraphics _layerspg, OscData _oscdata, float _x, float _y, float _a) {
    super(_layerspg, _oscdata, _x, _y, _a);
    midiassign = 7;
  }

  public void draw() {
    thispg.beginDraw();
    thispg.stroke(dcolor, a);
    thispg.strokeWeight(5);
    thispg.noFill();
    thispg.ellipse(x, y, r, r);
    thispg.endDraw();
    fade(f);
  }

  public void update() {
    r = oscdata.volume * displayHeight * 1.1;
  }

}

