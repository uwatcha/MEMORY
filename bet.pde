void bet() {//betボタンと、その機能
  if (bet) {
    fill(254, 67, 67);
  } else {
    fill(74, 223, 101);
  }
  circle(width/2, 725, 120);
  fill(0);
  textSize(25);
  text("BET", width/2, 723);

  if ( (sqrt(sq(mouseX - width/2) + sq(mouseY - 725)) <= 60) && mouseClicked && !first && opened[0] == -1) {
    if (!bet) {
      bet = true;
    } else {
      bet = false;
    }
  }
}

void Up() {//正解した場合にスコアをアップする
  if (bet) {
    score += 100;
    bet = false;
  } else {
    score += 10;
  }
}

void Down() {//負正解した場合にスコア、またはライフをダウンする
  if (bet) {
    life--;
    score -= 100;
    bet = false;
  } else {
    score -= 10;
  }
}
