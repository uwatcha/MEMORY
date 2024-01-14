void title() {
  fill(0);
  text("Touch to Start", width/2, 500);
  textSize(25);
  image(logo, width/2 - 48*4, 200);

  hiscore = loadHiscore();
  hiscore();

  if (mouseClicked && sqrt(sq(mouseX - 380) + sq(mouseY - 725)) > 60) {
    scene = 1;
  }
}

void hiscore() {//ハイスコアを司る関数
  if (scene == 0) {
    if (mouseClicked && sqrt(sq(mouseX - 380) + sq(mouseY - 725)) <= 60) {
      hiscore = 0;
      String reset [] = new String[1];
      reset[0] = str(0);
      saveStrings("data.txt", reset);
    }
    
    fill(254, 67, 67);
    circle(380, 725, 120);
    textSize(20);
    fill(0);
    text("HIGHSCORE", 380, 720);
    text("RESET", 380, 740);
    text("HIGHSCORE", 170, 710);
    text(hiscore, 170, 740);
  }
  
  if (scene == 2) {
    textSize(25);
    text("HIGHSCORE", width/2, 680);
    text(hiscore, width/2, 720);
  }
}

int loadHiscore() {
  String lines[];
  lines = loadStrings("data.txt");
  if (lines == null) { // data.txt というファイルが読めなかった時
    return 0;
  } else {
    return int(lines[0]);
  }
}
