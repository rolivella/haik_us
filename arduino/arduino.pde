int inputPin_A = 2;
int inputPin_E = 3;
int inputPin_I = 4;
int inputPin_O = 5;
int inputPin_U = 6;
int val_A = 0;
int val_E = 0;
int val_I = 0;
int val_O = 0;
int val_U = 0;
int iDelay=200;
//int outputPinReady=7;
int outputPinClick=8;

void setup() {
  pinMode(inputPin_A, INPUT); 
  pinMode(inputPin_E, INPUT); 
  pinMode(inputPin_I, INPUT); 
  pinMode(inputPin_O, INPUT); 
  pinMode(inputPin_U, INPUT); 
  //pinMode(outputPinReady, OUTPUT);
  pinMode(outputPinClick, OUTPUT);
  Serial.begin(9600);
  Serial.print("1"); 
  //secuenciaReady(outputPinReady);
}

void loop(){
  val_A = digitalRead(inputPin_A);
  val_E = digitalRead(inputPin_E);
  val_I = digitalRead(inputPin_I);
  val_O = digitalRead(inputPin_O);
  val_U = digitalRead(inputPin_U);

  if (val_A == HIGH) { 
    secuenciaKey(outputPinClick);
    delay (iDelay);
    Serial.print("A");
  } 
  else if(val_E == HIGH) {
    secuenciaKey(outputPinClick);
    delay (iDelay);
    Serial.print("E");
  } 
  else if (val_I == HIGH) {
    secuenciaKey(outputPinClick);
    delay (iDelay);
    Serial.print("I");
  }   
  else if (val_O == HIGH) {
    secuenciaKey(outputPinClick);
    delay (iDelay);
    Serial.print("O");
  }   
  else if (val_U == HIGH) {
    secuenciaKey(outputPinClick);
    delay (iDelay);
    Serial.print("U");
  }
}
/*
void secuenciaReady(int pin){
  digitalWrite(pin, HIGH);
  delay(200);  
  digitalWrite(pin, LOW);
  delay(200);
  digitalWrite(pin, HIGH);
  delay(200);
  digitalWrite(pin, LOW);
  delay(200);
  digitalWrite(pin, HIGH);
}
*/
void secuenciaKey(int pin){
  digitalWrite(pin, HIGH);
  delay(200);  
  digitalWrite(pin, LOW);
}

