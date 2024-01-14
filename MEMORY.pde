//カードナンバー：百の位にスート、一、十の位に数字を表す数があてはめられた数。
//1：スペード, 2：クローバー, 3：ハート, 4：ダイヤ, 5：ジョーカー
//場所ナンバー：カードの場所を示す値が入る。上からx-1番目、左からy-1番目のカードの場所ナンバーは、x*10+y。

//カードのデータを入れる配列----------------------------------------------------------------
int [][] card = new int [][]{//カードナンバーを格納する。
  new int [10], 
  new int [10], 
  new int [10], 
  new int [10], 
  new int [2]
};
int [] opened = new int[2];//開かれたカードの場所ナンバーが入る。
int [] tmp = new int[7];//initCard()で初めにスートを抽選する特性上、ジョーカーとそれ以外のスートが選ばれる確率が同じになるため、ジョーカーが上側に配置されやすくなってしまう。それを防ぐため、行をrandom()でシャッフルする。その際に値がダブらないようにする判断をするために、一時的にrandom()の値を格納する。
int [][] place = new int [7][6];//この配列にカードナンバーを入れることで、その場所にどのカードを表示するかがわかる。
//------------------------------------------------------------------------------------------

//画像やフォント----------------------------------------------------------------------------
PImage [][] image = new PImage[7][6];//カードの表面
PImage back;//カードの裏面
PImage logo;//タイトルロゴ
PImage heart;//ライフのハート
PFont font1;//基本のフォント
PFont font2;//プレイ中のスコア用のフォント
//------------------------------------------------------------------------------------------

//計算をする関数----------------------------------------------------------------------------
float rectW(int _j) {//カードが配置される場所のx座標
  return _j*0.96*width/6+20;
}
float rectH(int _i) {//カードが配置される場所のy座標
  return _i*1.02*height/9+13;
}
int ten(int _i) {//openedに入ったカードの場所ナンバーの十の位
  return (opened[_i] - opened[_i]%10)/10;
}
int one(int _i) {//openedに入ったカードの場所ナンバーの一の位
  return opened[_i]%10;
}
int hundreds(int _opened) {//place配列に入ったカードナンバーの百の位を１桁の数に変換
  return (place[ten(_opened)][one(_opened)] - place[ten(_opened)][one(_opened)]%100)/100;
}
int tenthFirst(int _opened) {//place配列に入ったカードナンバーの一、十の位を１,２桁の数に変換
  return place[ten(_opened)][one(_opened)]%100;
}
//------------------------------------------------------------------------------------------

//変数--------------------------------------------------------------------------------------
int timer = 0;//毎フレーム１を足す
int score = 0;
int hiscore;
int scene = 0;
int life = 3;
boolean first = true;//２回画面にタッチするとfalseになる。画面切り替えとカードめくり、betボタンプッシュが同時に起こらないようにする
boolean bet = false;
boolean mouseClicked;//mouseClicked()でtrueになり、draw()の最終行でfalseになる。
//------------------------------------------------------------------------------------------

void setup() {
  size(450, 800);
  textAlign(CENTER, CENTER);

  back = loadImage("600.png");
  logo = loadImage("LOGO.png");
  logo.resize(48*8, 23*8);
  heart = loadImage("life.jpg");
  heart.resize(30, 30);
  font1 = loadFont("Amiri-Bold-48.vlw");
  font2 = loadFont("BIZ-UDPGothic-48.vlw");

  for (int i=0; i < 7; i++) {
    for (int j=0; j < 6; j++) {
      place[i][j] = -1;
    }
  }
  opened[0] = -1;
  opened[1] = -1;

  for (int i = 0; i < 5; i++) {//カードナンバーを配列に代入
    if (i != 4) {
      for (int j = 0; j < 10; j++) {
        card[i][j] = (i+1)*100+(j+1);
      }
    } else {
      for (int j = 0; j < 2; j++) {
        card[i][j] = (i+1)*100+(j+1);
      }
    }
  }

  initCard();
}

void draw() {
  background(123, 170, 23);
  textFont(font1);
  if (mouseClicked && first) {
    first = false;
  }
  
  switch (scene) {
  case 0:
    title();
    break;
  case 1:
    play();
    break;
  case 2:
    gameover();
    break;
  }
  
  mouseClicked = false;
}

void mouseClicked() {
  mouseClicked = true;
}

//デバッグ
void keyPressed() {
  println();
  if (keyCode == ENTER) {
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 6; j++) {
        print(place[i][j], "");
      }
      println();
    }
  }
}
