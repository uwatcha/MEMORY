void click() {//カードをタッチしたらopened配列にそのカードの場所ナンバーを代入 //<>//
  int I;
  int J;
  int ret = -1;
  
  if (mouseClicked) {
    I = mouseY;
    J = mouseX;
    for (int i=0; i < 7; i++) {
      for (int j=0; j < 6; j++) {
        if ((rectW(j) <= J && J <= rectW(j)+50 && rectH(i) <= I && I <= rectH(i)+50*1.42) && place[i][j] != -1) {
          ret = i*10+j;
          break;
        }
      }
    }
  }
  
  if (opened[0] == -1 && opened[1] == -1) {
    opened[0] = ret; 
    return;
  } else if (opened[0] != -1 && opened[1] == -1 && opened[0] != ret) {
    opened[1] = ret;
    return;
  }
}

void judge() {//カードがそろったかどうかを判断し、スコアやライフを増減する。
  if (opened[0] != -1 && opened[1] != -1) {//2枚めくられているとき
    if (hundreds(0) != 5 || hundreds(1) != 5) {//２枚のうちどちらかがジョーカーでないとき
      if ( (tenthFirst(0) == tenthFirst(1)) && (hundreds(0) != 5 && hundreds(1) != 5) ) {//カードの数字がそろった、かつどちらもジョーカーでないとき
        timer++;
        if (timer == 60) {
          Up();

          place[ten(0)][one(0)] = -1;
          place[ten(1)][one(1)] = -1;

          opened[0] = -1;
          opened[1] = -1;
          
          timer = 0;
        }
      } else {//カードの数字がそろってないとき
        timer++;
        if (timer == 60) {
          Down();
          
          opened[0] = -1;
          opened[1] = -1;
          
          timer = 0;
        }
      }
    } else {//どちらもジョーカーのとき
      timer++;
      if (timer == 60) {
        Up();

        place[ten(0)][one(0)] = -1;
        place[ten(1)][one(1)] = -1;

        opened[0] = -1;
        opened[1] = -1;
        
        timer = 0;
      }
    }
  }
}
