class LSystem{
  String axiom;
  ArrayList<Rule> rules = new ArrayList<Rule>();
  String sentence;
  float angle;
  float lineLen;
  int level;
  
  public LSystem(String axiom_, float angle_, float lineLen_){
    this.axiom = axiom_;
    this.angle = angle_;
    this.level = 1;
    this.lineLen = lineLen_;
    this.sentence = this.axiom;
  }
  
  void addRule(Rule rule){
    rules.add(rule);
  }
  
  void nextLevel(){
    String nextS = "";
    for(int i = 0; i < sentence.length(); ++i){
      char c = sentence.charAt(i);
      boolean find = false;
      for(Rule rule : rules){
        if(c == rule.getA()){
          nextS += rule.getB();
          find = true;
          break;
        }
      }
      if(!find){
        nextS += c;
      }
    }
    //sentence = new String(nextS);
    sentence = nextS;
    level++;
    lineLen /= 2.5;
  }
  
  void drawLine(float dx, float dy){
    stroke(#FFF8DC);
    noFill();
    translate(dx, dy);
    for(int i = 0; i < sentence.length(); ++i){
      char c = sentence.charAt(i);
      if(c == 'F' || c == 'G'){
        line(0, 0, 0, -lineLen);
        translate(0, -lineLen);
      }else if(c == '-'){
        rotate(-radians(angle));
      }else if(c == '+'){
        rotate(radians(angle));
      }else if(c == '['){
        pushMatrix();
      }else if(c == ']'){
        popMatrix();
      }else if(c == '|'){
        rotate(radians(180));
      }
    }
  }
}
