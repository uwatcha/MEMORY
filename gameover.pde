void gameover() {
  fill(0);
  textSize(70);
  text("GAMEOVER", width/2, 300);
  textSize(50);
  text("SCORE", width/2-90, 400);
  text(score, width/2+140, 400);

  hiscore();
  if (hiscore < score) {
    hiscore = score;
    String lines [] = new String[1];
    // str(整数) は整数を表す文字列を返す
    lines[0] = str(hiscore);
    saveStrings("data.txt", lines);
  }

  if (mouseClicked) {
    scene = 0; 
    score = 0;
    life = 3;
  }
}
