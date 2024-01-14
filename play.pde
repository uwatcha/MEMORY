void play() {
  menu();
  click();
  judge();
  boolean flg = false;
  
  for (int i = 0; i < 7; i++) {//カードをすべてめくったら、再配置
    for (int j = 0; j < 6; j++) {
      if (place[i][j] != -1) {
        flg = true;
        break;
      }
      if (i==6 && j==5) {
        initCard();
      }
    }
    if (flg) {
      break;
    }
  }

  for (int i = 0; i < 7; i++) {//適切なカードの画像を表示
    for (int j = 0; j < 6; j++) {
      if (place[i][j] != -1) {
        back.resize(50, 81);
        image(back, rectW(j), rectH(i));
      }
      if (opened[0] == i*10+j) {
        image[i][j].resize(50, 81);
        image(image[i][j], rectW(j), rectH(i));
      }
      if (opened[1] == i*10+j) {
        image[i][j].resize(50, 81);
        image(image[i][j], rectW(j), rectH(i));
      }
    }
  }

  if (life <= 0) {
    scene = 2;
  }
}
