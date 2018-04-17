class Button {
  //Member variables
  int x, y, w, h, v;
  char o;
  boolean hov, num; //Hover

  // Constructor
  Button(int x, int y, int w, int h) {  
    this.x = x;   
    this.y = y;   
    this.w = w;   
    this.h = h;
  }

  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  void display() {
    rect(x, y, w, h, 3);
    fill(255);
    if (num) {
      textSize(12);
      text(v, x+7, y+10);
    } else {
      if (o == 'n') {
        text("+/-", x, y+10);
      } else if (o == 'e') {
        text("e", x+5, y+13);
        text("x", x+11, y+7);
      } else {
        textSize(12);
        text(o, x+7, y+10);
      }
    }
    fill(0);
  }
  //Click
  void over() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}
