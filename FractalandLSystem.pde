
LSystem ls;

void setup() {
  //size(1300, 700);
  fullScreen();
  ls = new LSystem("FX", 35, 350);
  ls.addRule(new Rule('F', "F[+FF][-FF]F[-F][+F]F"));
  //ls.addRule(new Rule('Y', "YFX[+Y][-Y]"));
}

void draw() {
  background(0);

  // show info.
  fill(#BBFFFF);
  String t = "n = " + ls.level;
  textSize(40);
  text(t, width - 200, 100);

  String t1 = "L-System";
  String t2 = "axiom: FX";
  String t3 = "rules: F -> F[+FF][-FF]F[-F][+F]F";
  String t4 = "angle: 35";
  String t5 = "F: forward and draw a line\n-: turn left by angle\n+: turn right by angle\n";
  t5 += "X: don't do anything\n[: save drawing state\n]: restore drawing state";
  textSize(30);
  fill(#AFEEEE);
  text(t1, 30, 50);
  fill(#00FFFF);
  text(t2, 30, 150);
  text(t3, 30, 200);
  text(t4, 30, 300);
  fill(#00BFFF);
  text(t5, 30, 400);
  //noFill();

  //pushMatrix();
  ls.drawLine(width/2 + 100, height);
  //popMatrix();
  //ls.nextLevel();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    ls.nextLevel();
    //ls.nextLevel();
  }
}
