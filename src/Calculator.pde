Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];

String ls, rs;
String displayVal = "0";
String valToCompute = "";  //string value left of the operator
String valToCompute2 = "";  //string right of the operator
float valToComputeI = 0;  //float value left of the operator
float valToComputeII = 0;  //float value right of operator
float result = 0;
char opVal;
boolean firstNum; //detects if its first number?
float ans; // answer
char op; //operator
boolean left, eq; //Left of Operator, After equal is hit

void setup() {
  size(400, 800);
  background(255);

  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;


  //numbers on calculator
  numButtons[0] = new Button(130, 420, 22, 13) .asNumber(0);
  numButtons[1] = new Button(130, 400, 22, 13) .asNumber(1);
  numButtons[2] = new Button(168, 400, 22, 13) .asNumber(2);
  numButtons[3] = new Button(206, 400, 22, 13) .asNumber(3);
  numButtons[4] = new Button(130, 380, 22, 13) .asNumber(4);
  numButtons[5] = new Button(168, 380, 22, 13) .asNumber(5);
  numButtons[6] = new Button(206, 380, 22, 13) .asNumber(6);
  numButtons[7] = new Button(130, 360, 22, 13) .asNumber(7);
  numButtons[8] = new Button(168, 360, 22, 13) .asNumber(8);
  numButtons[9] = new Button(206, 360, 22, 13) .asNumber(9);


  //functions on calculator
  opButtons[0] = new Button(245, 440, 22, 11) .asOperator('+');
  opButtons[1] = new Button(245, 420, 22, 13) .asOperator('-');
  opButtons[2] = new Button(245, 400, 22, 13) .asOperator('x');
  opButtons[3] = new Button(245, 380, 22, 13) .asOperator('÷');
  opButtons[4] = new Button(245, 360, 22, 13) .asOperator('C');
  opButtons[5] = new Button(168, 460, 60, 13) .asOperator('=');
  opButtons[6] = new Button(168, 420, 22, 13) .asOperator('.');
  opButtons[7] = new Button(206, 420, 22, 13) .asOperator('%');
  opButtons[8] = new Button(130, 440, 22, 13) .asOperator('e');
  opButtons[9] = new Button(168, 440, 22, 13) .asOperator('√');
  opButtons[10] = new Button(206, 440, 22, 13) .asOperator('n');
}

void draw() {
  background(255);

  //Watchface
  fill(70);
  strokeWeight(2);
  stroke(0);
  rect(110, 280, 180, 210);
  rect(120, 290, 160, 190, 20);
  quad(110, 490, 290, 490, 260, 675, 140, 675);
  quad(110, 280, 290, 280, 260, 100, 140, 100);


  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mouseReleased () {  
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') { 
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'x') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '÷') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalculation();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 'e') {
      if (left) {
        ans = exp(float(ls));
        ls = str((float)ans);
      } else {
        ans = exp(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '√') {
      if (left) {
        ans = sqrt(float(ls));
        ls = str((float)ans);
      } else {
        ans = sqrt(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}

void performCalculation() {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-': 
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case 'x': 
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '÷': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}
//  result = valToComputeI + valToComputeII;
//  displayVal = str(result);
//} else if (opVal == '-'); 
//{
//  result = valToComputeI - valToComputeII;
//  displayVal = str(result);
//}

////let = work multiple times'
//if (firstNum) {
//  valToCompute = displayVal;
//} else {
//  valToCompute = displayVal;
//  valToCompute2 = "";
//}
//}

void performClear() {
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}



void updateDisplay() {
  fill(215, 245, 205);
  rect(130, 300, 140, 50, 10);
  fill(0);
  textSize(30);
  text(ls, 140, 335);
}
