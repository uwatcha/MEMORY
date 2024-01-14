void menu() {
  fill(255);
  rect (0, 650, width, 200);
  bet();
  fill(0);
  textSize(30);
  text("SCORE", 75, 700);
  text("LIFE", 450-75, 700);
  textFont(font2);
  textSize(20);
  text(score, 75, 740);
  for (int i=0; i<life; i++) {
    image(heart, 326+i*33, 725);
  }
}
