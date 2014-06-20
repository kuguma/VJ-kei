public class Layers {
  int phmax = 3;
  OscData oscdata;
  PGraphics pg;
  Phrase[][] phrases = new Phrase[3][phmax];
  //0=Global 1=R 2=L

  Layers(PGraphics _pg, OscData _oscdata) {
    oscdata = _oscdata;
    pg = _pg;
  }

  void draw() {
    for (int j=0;j<3;j++) {
      for (int i=0;i<phmax;i++) {
        if (phrases[j][i]!=null) phrases[j][i].draw();
      }
    }
  }

  void trace() {
    for (int j=0;j<3;j++) {
      for (int i=0;i<phmax;i++) {
        if (phrases[j][i]!=null) phrases[j][i].trace();
      }
    }
  }

  void update() {
    for (int j=0;j<3;j++) {
      for (int i=0;i<phmax;i++) {
        if (phrases[j][i]!=null) phrases[j][i].update();
      }
    }
  }

  void add(int decknum, Phrase _phrases) {
    for (int i=0;i<phmax;i++) {
      if (phrases[decknum][i]==null) {
        phrases[decknum][i] = _phrases;
        phrases[decknum][i].setDeckNumber(decknum);
        break;
      }
    }
  }

  void remove(int decknum) {
    for (int i=0;i<phmax;i++) {
      phrases[decknum][i] = null;
    }
  }

  void controller_volume(int value, int decknum) {
    for (int j=0;j<3;j++) {
      for (int i=0;i<phmax;i++) {
        if (phrases[j][i]!=null) phrases[j][i].controller_volume(value, decknum);
      }
    }
  }

  void controller_filter(int value, int decknum) {
    for (int j=0;j<3;j++) {
      for (int i=0;i<phmax;i++) {
        if (phrases[j][i]!=null) phrases[j][i].controller_filter(value, decknum);
      }
    }
  }

  void controller_eq(int value, int decknum, int band) {
  }

  void controller_activeL(int value, int decknum) {
  }

  void controller_activeR(int value, int decknum) {
  }

  void controller_tap(int value, int decknum) {
    for (int j=0;j<3;j++) {
      for (int i=0;i<phmax;i++) {
        if (phrases[j][i]!=null) phrases[j][i].controller_tap(value, decknum);
      }
    }
  }
  void controller_set(int value, int decknum) {
  }
  void controller_prev(int value, int decknum) {
  }
  void controller_next(int value, int decknum) {
  }
}

