public class Tile extends Phrase {
  int rectsize = 150;
  float gap = 5;
  float count=0;

  Tile(PGraphics _layerspg, OscData _oscdata, float _x, float _y, float _a) {
    super(_layerspg, _oscdata, _x, _y, _a);
    a = 100;
  }

  public void draw() {
    fade(100);
    thispg.beginDraw();

    gap =0.0;
    for (int i=0;i<5;i++) {
      gap += oscdata.multi[i];
    }
    gap *=25.0;

    //gap = oscdata.multi[0]*25;
    count = count+0.1;
    if (count==100) count=0;

    for (int i=0;i<displayWidth/rectsize+1;i++) {
      for (int j=0;j<displayHeight/rectsize+1;j++) {
        noStroke();
        thispg.fill(dcolor, a);
        thispg.rectMode(CORNERS);
        thispg.fill(noise(i, count)*255, noise(count, j)*255, noise(j, count)*255, a);
        thispg.rect(i*rectsize+gap, j*rectsize+gap, (i+1)*rectsize-gap, (j+1)*rectsize-gap);
      }
    }

    thispg.endDraw();
  }

  public void update() {
  }

  void controller_tap(int level, int _decknum) {
    if (a==255) {
      a = 0;
    }
    else {
      a = 255;
    }
  }
}

