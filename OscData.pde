public class OscData {
  float[] multi = new float[10];
  float volume;
  int[] midi = new int[64];

  OscData() {
    for (int i=0;i<64;i++) {
      midi[i]=-1;
    }
  }
}

