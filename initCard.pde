void initCard() {//カードをシャッフルし、配置する場所と紐づけする。
  int I, J;
  int ii;//noDouble1()に渡す変数
  int che;//noDouble2()に渡す変数
  for (int i=0; i<7; i++) {
    tmp [i] = -1;
  }
  for (int i=0; i<7; i++) {
    ii = int(random(0, 7));
    if (noDouble1(ii)) {
      tmp[i] = ii;
      for (int j=0; j<6; j++) {
        I = int(random(0, 5));
        if (I != 4) {
          J = int(random(0, 10));
        } else {
          J = int(random(0, 2));
        }
        che = card [I][J];
        if (noDouble2(che)) {
          place [ii][j] = che;
          loadImages(ii, j);
        } else {
          che = 0;
          j--;
        }
      }
    } else {
      ii = 0;
      i--;
    }
  }
}

boolean noDouble1(int _ii) {//place配列の１つ目の[]に入る、random()が生成した値がダブっていないか判断する。
  for (int i=0; i<7; i++) {
    if (_ii == tmp[i]) {
      return false;
    }
  }
  return true;
}

boolean noDouble2(int _che) {//抽選した配置場所の座標がダブっていないか判断する。。
  for (int i=0; i<7; i++) {
    for (int j=0; j<6; j++) {
      if (_che == place[i][j]) {
        return false;
      }
    }
  }
  return true;
}
