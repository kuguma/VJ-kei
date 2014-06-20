public class Phrase {
  float x, y, a, size=1;
  int f = 50;
  int midiassign=0;
  int decknum;
  int S_min = 0;
  int S_max = 255;
  PGraphics thispg;
  PGraphics layerspg;
  OscData oscdata;
  color dcolor = color(#FFFFFF);

  Phrase(PGraphics _layerspg, OscData _oscdata, float _x, float _y, float _a) {
    layerspg = _layerspg;
    oscdata = _oscdata;
    x=_x;
    y=_y;
    a=_a;
    thispg = new PGraphics();
    thispg = createGraphics(displayWidth, displayHeight, P2D);
  }

  public void setDeckNumber(int num) {
    decknum = num;
  }


  public void draw() {
  }

  public void trace() {
    image(thispg, 0, 0);
  }

  public void update() {
  }

  void fade(int _alpha) {
    thispg.beginDraw();
    thispg.noStroke();
    thispg.fill(#000000, _alpha);
    thispg.rectMode(CORNER);
    thispg.rect(0, 0, displayWidth, displayHeight);
    thispg.endDraw();
  }

  void controller_volume(int level, int _decknum) {
    if (_decknum ==decknum) {
      a = level/127.0*255;
    }
  }


  void controller_filter(int level, int _decknum) {
    if (_decknum == decknum) {
      if (0<=level && level<=64) {
        S_max = 255;
        S_min = 255-level*2;
      }
      else {
        S_max = 255-(level-64)*4;
        S_min = 255-level*2;
      }
    }
    println(S_max);
    println(S_min);
  }

  void controller_EQ(int hi, int md, int lo) {
  }

  void controller_FX(int fx1, int fx2) {
  }

  void controller_tap(int level, int _decknum) {
  }
}

