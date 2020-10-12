//Haiku_sketch
//Creado: 23/11/2010
//Modificado 9/4/2011
//Roger, Andrea, Fany

import processing.serial.*; 
import java.io.*;

//String portname = "/dev/ttyUSB0";   //Este será el puerto al que esté conectado el arduino en el ordenador 
String portname = "COM5";
Serial port;  // Nombre para eferirnos al puerto
int val=0; // Aquí guardaremos el valor recibido en el puerto serie
String inBuffer="";
boolean isStringRead=false;
String dir="";
String frase="";


String array_win_H1 = {
  "A","A","U","O","I","A","A","E","E","U"
};  

int iLevel_H1=0;//
String sHaiku="H1";//
boolean H1_win=false;
ArrayList alUserKeys=new ArrayList();//
int iDelayGongSmall=100;

//bandera

boolean bandera1=true;
boolean bandera2=false;
boolean bandera3=false;


void setup() {
  //background(255);
  size(300,300);
  println(Serial.list());
  port = new Serial(this, portname, 9600);   // El último valor es el BaudRate
}

void draw() {

  while (port.available() > 0) {  

    if (bandera1==true) { // bandera1

      //Imprime cadena:
      inBuffer = port.readString();   
      if (inBuffer != null) {
        println("inBuffer: "+inBuffer);
      }

      if(inBuffer.equals("1")) {  
        lee("H1","gong");
        delay(500);
        lee("H1","1");
        delay(iDelayGongSmall);
        lee("H1","gong2");
        //background(0);
        text("Inicio", 15, 30);
      }

      if(!inBuffer.equals("") && !inBuffer.equals("1")) {
        //background(0);
        //text(inBuffer, 15, 30);
        alUserKeys.add(inBuffer);
        decide("H1",iLevel_H1,alUserKeys.size());
      }
    }//while
  }//draw

  void lee (String dir, String frase) {
    try { 
      String command = "C:\\haiku\\playwav C:\\haiku\\"+dir+"\\"+dir+"_"+frase+".wav";        
      Process child = Runtime.getRuntime().exec(command);
      BufferedReader in = new BufferedReader(new InputStreamReader(child.getInputStream()));  
      String line = null;  
      println(in.readLine());
      /*while ((line = in.readLine()) != null) {
       println(line);
       }*/
    } 
    catch (IOException e) {
      println(e.toString());
    }
  }

  void decide(String sHaiku, int iLevel, int alUserKeysSize) {

    if(sHaiku.equals("H1")) {

      if(iLevel==0 && alUserKeysSize==1) {//level 0
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0])) {
          println("LA MARIPOSA");
          lee("H1","2");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=1; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0])) {
          println("LA");
          lee("H1","1");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      } 

      else if(iLevel==1 && alUserKeysSize==2) {//level 1
        if(alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H1[1])) {
          println("LA MARIPOSA VUELA");
          lee("H1","3");
          iLevel_H1=2;
          delay(iDelayGongSmall);
          lee("H1","gong2"); 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H1[1])) {
          println("LA MARIPOSA");
          lee("H1","2");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }

      else if(iLevel==2 && alUserKeysSize==3) {//level 2
        if(alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().toString().trim().equals(array_win_H1[2])) {
          println("LA MARIPOSA VUELA COMO");
          lee("H1","4");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=3; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().toString().trim().equals(array_win_H1[2])) {
          println("LA MARIPOSA VUELA");
          lee("H1","3");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }
      else if(iLevel==3 && alUserKeysSize==4) {//level 3
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])) {
          println("LA MARIPOSA VUELA COMO SI");
          lee("H1","5");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=4; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])) {
          //println("LA MARIPOSA VUELA COMO");
          lee("H1","4");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }
      else if(iLevel==4 && alUserKeysSize==5) {//level 4
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          && alUserKeys.get(4).toString().trim().equals(array_win_H1[4])) {
          println("LA MARIPOSA VUELA COMO SI NADA");
          lee("H1","6");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=5; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H1[4])) {
          //println("LA MARIPOSA VUELA COMO SI");
          lee("H1","5");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }
      else if(iLevel==5 && alUserKeysSize==6) {//level 5
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          && alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H1[5])) {
          println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE");
          lee("H1","7");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=6; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H1[5])) {
          println("LA MARIPOSA VUELA COMO SI NADA");
          lee("H1","6");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }
      else if(iLevel==6 && alUserKeysSize==7) {//level 6
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          && alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          && alUserKeys.get(6).toString().trim().equals(array_win_H1[6])) {
          println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN");
          lee("H1","8");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=7; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          || !alUserKeys.get(6).toString().trim().equals(array_win_H1[6])) {
          println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE");
          lee("H1","7");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }
      else if(iLevel==7 && alUserKeysSize==8) {//level 7
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          && alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          && alUserKeys.get(6).toString().trim().equals(array_win_H1[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H1[7])) {
          //println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN ESTE");
          lee("H1","9");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=8; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          || !alUserKeys.get(6).toString().trim().equals(array_win_H1[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H1[7])) {
          //println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN");
          lee("H1","8");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          alUserKeys.clear();
        }
      }
      else if(iLevel==8 && alUserKeysSize==9) {//level 8
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          && alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          && alUserKeys.get(6).toString().trim().equals(array_win_H1[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H1[7])
          && alUserKeys.get(8).toString().trim().equals(array_win_H1[8])) {
          //println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN ESTE MUNDO");
          lee("H1","10");
          delay(iDelayGongSmall);
          lee("H1","gong2");
          iLevel_H1=9; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          || !alUserKeys.get(6).toString().trim().equals(array_win_H1[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H1[7])
          || !alUserKeys.get(8).toString().trim().equals(array_win_H1[8])) {
          //println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN ESTE");
          lee("H1","9");
          alUserKeys.clear();
        }
      }

      else if(iLevel==9 && alUserKeysSize==10) {//level 9
        if(alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          && alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          && alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          && alUserKeys.get(6).toString().trim().equals(array_win_H1[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H1[7])
          && alUserKeys.get(8).toString().trim().equals(array_win_H1[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H1[9])) {
          //println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN ESTE MUNDOOOOOO");
          lee("H1","10");//deberia ser el 11 "cantado"
          delay(300);
          lee("H1","win");
          delay(300);
          lee("H1","gong");
          H1_win=true; 
          alUserKeys.clear()
          } 

        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H1[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H1[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H1[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H1[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H1[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H1[5])
          || !alUserKeys.get(6).toString().trim().equals(array_win_H1[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H1[7])
          || !alUserKeys.get(8).toString().trim().equals(array_win_H1[8]) || !alUserKeys.get(9).toString().trim().equals(array_win_H1[9])) {
          lee("H1","10");
          alUserKeys.clear();
          //println("LA MARIPOSA VUELA COMO SI NADA AMBICIONASE EN ESTE MUNDO");
        }

        bandera1==false;
        bandera2==true;
        bandera3==false;
      }
    }//H1
  }//funct



  String array_win_H2 = {
    "O","A","U","E","U","E","A","I","E","A","U", "E","A"
  };  

  int iLevel_H2=0;//
  String sHaiku="H2";//
  boolean H2_win=false;
  ArrayList alUserKeys=new ArrayList();//
  int iDelayGongSmall=100;

  //bandera
  boolean bandera1=false;
  boolean bandera2=true;
  boolean bandera3=false;

  void setup() {
    //background(255);
    size(300,300);
    println(Serial.list());
    port = new Serial(this, portname, 9600);   // El último valor es el BaudRate
  }

  void draw() {

    while (port.available() > 0) {  

      if (bandera2==true) {

        //Imprime cadena:
        inBuffer = port.readString();   
        if (inBuffer != null) {
          println("inBuffer: "+inBuffer);
        }

        if(inBuffer.equals("2")) {  
          lee("H2","gong");
          delay(500);
          lee("H2","1");
          delay(iDelayGongSmall);
          lee("H2","gong2");
          //background(0);
          text("Inicio", 15, 30);
        }

        if(!inBuffer.equals("") && !inBuffer.equals("2")) {
          //background(0);
          //text(inBuffer, 15, 30);
          alUserKeys.add(inBuffer);
          decide("H2",iLevel_H2,alUserKeys.size());
        }
      }//while
    }//draw

    void lee(String dir, String frase) {
      try { 
        String command = "C:\\haiku\\playwav C:\\haiku2\\"+dir+"\\"+dir+"_"+frase+".wav";        
        Process child = Runtime.getRuntime().exec(command);
        BufferedReader in = new BufferedReader(new InputStreamReader(child.getInputStream()));  
        String line = null;  
        println(in.readLine());
        /*while ((line = in.readLine()) != null) {
         println(line);
         }*/
      } 
      catch (IOException e) {
        println(e.toString());
      }
    }

    void decide(String sHaiku2, int iLevel2, int alUserKeysSize) {

      if(sHaiku.equals("H2")) {

        if(iLevel2==0 && alUserKeysSize==1) {//level 0
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0])) {
            //println("TODO VA");
            lee("H2","0");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=1; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0])) {
            println("TODO");
            lee("H2","1");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        } 

        else if(iLevel==1 && alUserKeysSize==2) {//level 1
          if(alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H2[1])) {
            println("TODO VA FLUYENDO");
            lee("H2","3");
            iLevel_H2=2;
            delay(iDelayGongSmall);
            lee("H2","gong2"); 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H2[1])) {
            //println("TODO VA");
            lee("H2","2");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }

        else if(iLevel==2 && alUserKeysSize==3) {//level 2
          if(alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().toString().trim().equals(array_win_H2[2])) {
            println("TODO VA FLUYENDO, EL");
            lee("H2","4");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=3; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().toString().trim().equals(array_win_H2[2])) {
            println("TODO VA FLUYENDO");
            lee("H2","3");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==3 && alUserKeysSize==4) {//level 3
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])) {
            //println("TODO VA FLUYENDO, EL SUEÑO");
            lee("H2","5");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=4; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])) {
            //println("TODO VA FLUYENDO, EL");
            lee("H2","4");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==4 && alUserKeysSize==5) {//level 4
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE");
            lee("H2","6");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=5; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4])) {
            //println("TODO VA FLUYENDO, EL SUEÑO");
            lee("H2","5");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==5 && alUserKeysSize==6) {//level 5
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS");
            lee("H2","7");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=6; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE");
            lee("H2","6");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==6 && alUserKeysSize==7) {//level 6
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H2[6])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS");
            lee("H2","8");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=7; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS");
            lee("H2","7");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==7 && alUserKeysSize==8) {//level 7
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H2[7])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN");
            lee("H2","9");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=8; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H2[7])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS");
            lee("H2","8");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==8 && alUserKeysSize==9) {//level 8
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H2[8])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS");
            lee("H2","10");
            delay(iDelayGongSmall);
            lee("H2","gong2");
            iLevel_H2=9; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H2[8])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN");
            lee("H2","9");
            alUserKeys.clear();
          }
        }

        else if(iLevel==9 && alUserKeysSize==10) {//level 9
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H2[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H2[9])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS BURBUJAS");
          }

          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H2[8])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS");
            lee("H2","9");
            alUserKeys.clear();
          }
        }

        else if(iLevel==10 && alUserKeysSize==11) {//level 10
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H2[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H2[9])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS BURBUJAS DEL");
          }

          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H2[8])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS BURBUJAS");
            lee("H2","10");
            alUserKeys.clear();
          }
        }

        else if(iLevel==11 && alUserKeysSize==12) {//level 11
          if(alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H2[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H2[9])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS BURBUJAS DEL AGUA");
          }

          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H2[8])) {
            //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS BURBUJAS DEL");
            lee("H2","11");
            alUserKeys.clear();
          }

          lee("H2","12");
          delay(300);
          lee("H2","win");
          delay(300);
          lee("H2","gong");
          H2_win=true; 
          alUserKeys.clear();
        } 
        else if(!alUserKeys.get(0).toString().trim().equals(array_win_H2[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H2[1])
          || !alUserKeys.get(2).toString().trim().equals(array_win_H2[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H2[3])
          || !alUserKeys.get(4).toString().trim().equals(array_win_H2[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H2[5])
          || !alUserKeys.get(6).toString().trim().equals(array_win_H2[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H2[7])
          || !alUserKeys.get(8).toString().trim().equals(array_win_H2[8]) || !alUserKeys.get(9).toString().trim().equals(array_win_H2[9])) {
          lee("H2","10");
          alUserKeys.clear();
          //println("TODO VA FLUYENDO, EL SUEÑO DE LAS LIBELULAS EN LAS BURBUJAS DEL AGUA");
        }

        bandera1==false;
        bandera2==false;
        bandera3==true;
      }
    }//H2
  }//funct


  String array_win_H3 = {
    "A","I","U","E","I","O","E","E","E","I","A","E","O","E","A"
  };  

  int iLevel_H3=0;//
  String sHaiku="H3";//
  boolean H3_win=false;
  ArrayList alUserKeys=new ArrayList();//
  int iDelayGongSmall=100;

  //bandera
  boolean bandera1=false;
  boolean bandera2=false;
  boolean bandera3=true;

  void setup() {
    //background(255);
    size(300,300);
    println(Serial.list());
    port = new Serial(this, portname, 9600);   // El Asltimo valor es el BaudRate
  }

  void draw() {

    while (port.available() > 0) {  
      if (bandera3==true) {

        //Imprime cadena:
        inBuffer = port.readString();   
        if (inBuffer != null) {
          println("inBuffer: "+inBuffer);
        }

        if(inBuffer.equals("1")) {  
          lee("H3","gong");
          delay(500);
          lee("H3","1");
          delay(iDelayGongSmall);
          lee("H3","gong2");
          //background(0);
          //text("Inicio", 15, 30);
        }

        if(!inBuffer.equals("") && !inBuffer.equals("1")) {
          //background(0);
          //text(inBuffer, 15, 30);
          alUserKeys.add(inBuffer);
          decide("H3",iLevel_H3,alUserKeys.size());
        }
      }//while
    }//draw

    void lee(String dir, String frase) {
      try { 
        String command = "C:\\haiku\\playwav C:\\haiku3\\"+dir+"\\"+dir+"_"+frase+".wav";        
        Process child = Runtime.getRuntime().exec(command);
        BufferedReader in = new BufferedReader(new InputStreamReader(child.getInputStream()));  
        String line = null;  
        println(in.readLine());
        /*while ((line = in.readLine()) != null) {
         println(line);
         }*/
      } 
      catch (IOException e) {
        println(e.toString());
      }
    }

    void decide(String sHaiku, int iLevel, int alUserKeysSize) {

      if(sHaiku.equals("H3")) {

        if(iLevel==0 && alUserKeysSize==1) {//level 0
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0])) {
            //println("LA PRIMERA");
            lee("H3","2");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=1; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0])) {
            //println("LA");
            lee("H3","1");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        } 

        else if(iLevel==1 && alUserKeysSize==2) {//level 1
          if(alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H3[1])) {
            //println("LA PRIMERA LUCIERNAGA");
            lee("H3","3");
            iLevel_H3=2;
            delay(iDelayGongSmall);
            lee("H3","gong2"); 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H3[1])) {
            //println("LA PRIMERA");
            lee("H3","2");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }

        else if(iLevel==2 && alUserKeysSize==3) {//level 2
          if(alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().toString().trim().equals(array_win_H3[2])) {
            //println("LA PRIMERA LUCIERNAGA, EL");
            lee("H3","4");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=3; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().toString().trim().equals(array_win_H3[2])) {
            //println("LA PRIMERA LUCIERNAGA");
            lee("H3","3");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==3 && alUserKeysSize==4) {//level 3
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG");
            lee("H3","5");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=4; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])) {
            //println("LA PRIMERA LUCIERNAGA, EL");
            lee("H3","4");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==4 && alUserKeysSize==5) {//level 4
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON");
            lee("H3","6");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=5; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG");
            lee("H3","5");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==5 && alUserKeysSize==6) {//level 5
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL");
            lee("H3","7");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=6; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON");
            lee("H3","6");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==6 && alUserKeysSize==7) {//level 6
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE");
            lee("H3","8");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=7; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL");
            lee("H3","7");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==7 && alUserKeysSize==8) {//level 7
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO");
            lee("H3","9");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=8; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])) {
            //println("LA PRIMERA LUCIERNAGA,EL ZIGZAG CON EL QUE");
            lee("H3","8");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            alUserKeys.clear();
          }
        }
        else if(iLevel==8 && alUserKeysSize==9) {//level 8
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO MI");
            lee("H3","10");
            delay(iDelayGongSmall);
            lee("H3","gong2");
            iLevel_H3=9; 
            alUserKeys.clear();
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO");
            lee("H3","9");
            alUserKeys.clear();
          }
        }

        else if(iLevel==9 && alUserKeysSize==10) {//level 9
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H3[9])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO MI MANO");
            lee("H3","11");
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA,  EL ZIGZAG CON EL QUE ESQUIVO MI");
            lee("H3","10");
            alUserKeys.clear();
          }
        }

        else if(iLevel==10 && alUserKeysSize==11) {//level 10
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H3[9])) {
            //println("LA PRIMERA LUCIERNAGA,EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE");
            lee("H3","12");
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA,EL ZIGZAG CON EL QUE ESQUIVO MI MANO");
            lee("H3","11");
            alUserKeys.clear();
          }
        }

        else if(iLevel==11 && alUserKeysSize==12) {//level 11
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H3[9])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE");
            lee("H3","13");
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA,  EL ZIGZAG CON EL QUE ESQUIVO MI MANO");
            lee("H3","12");
            alUserKeys.clear();
          }
        }

        else if(iLevel==12 && alUserKeysSize==12) {//level 12
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H3[9])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE SOPLO");
            lee("H3","14");
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA,  EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE ");
            lee("H3","13");
            alUserKeys.clear();
          }
        }

        else if(iLevel==13 && alUserKeysSize==13) {//level 13
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H3[9])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE SOPLO DE");
            lee("H3","15");
          } 
          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA,  EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE SOPLO ");
            lee("H3","14");
            alUserKeys.clear();
          }
        }

        else if(iLevel==14 && alUserKeysSize==13) {//level 14
          if(alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) && alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            && alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) && alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            && alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) && alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            && alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) && alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            && alUserKeys.get(8).toString().trim().equals(array_win_H3[8]) && alUserKeys.get(9).toString().trim().equals(array_win_H3[9])) {
            //println("LA PRIMERA LUCIERNAGA, EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE SOPLO DE AIRE");
            lee("H3","16")  
              alUserKeys.clear();
            delay(300);
            lee("H3","win");
            delay(300);
            lee("H3","gong");
            H3_win=true; 
            alUserKeys.clear();
          } 

          else if(!alUserKeys.get(0).toString().trim().equals(array_win_H3[0]) || !alUserKeys.get(1).toString().trim().equals(array_win_H3[1])
            || !alUserKeys.get(2).toString().trim().equals(array_win_H3[2]) || !alUserKeys.get(3).toString().trim().equals(array_win_H3[3])
            || !alUserKeys.get(4).toString().trim().equals(array_win_H3[4]) || !alUserKeys.get(5).toString().trim().equals(array_win_H3[5])
            || !alUserKeys.get(6).toString().trim().equals(array_win_H3[6]) || !alUserKeys.get(7).toString().trim().equals(array_win_H3[7])
            || !alUserKeys.get(8).toString().trim().equals(array_win_H3[8])) {
            //println("LA PRIMERA LUCIERNAGA,  EL ZIGZAG CON EL QUE ESQUIVO MI MANO, LEVE SOPLO DE AIRE");
            lee("H3","15");
            alUserKeys.clear();
          }     
          bandera1==false;
          bandera2==false;
          bandera3==false;
        }
      }//H3
    }//funct









