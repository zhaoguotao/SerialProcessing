/**
 * SerialProcessing tool
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
//int val;      // Data received from the serial port
int whichKey = -1;  // Variable to hold keystoke values
int inByte = -1;    // Incoming serial data

void setup() 
{
  size(800, 500);

  String[] serials = Serial.list();
  if (serials == null)
  {
    println("There are no seirals available.");
    exit();
  } else 
  {
    println("SerialPort number:", Serial.list().length);
    println("Available serials:");
    // List all the available serial ports:
    printArray(serials);
  }


  String portName = serials[0];
  println("portName:", portName);
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  background(10);             // Set background to white
  text("SerialTool", 10, 300);
  text("SerialTool", 10, 350);
  if (inByte == 0) 
  {              // If the serial value is 0,
    fill(50);                   // set fill to black
  } else 
  {                       // If the serial value is not 0,
    fill(250);                 // set fill to light gray
  }
  rect(50, 50, 100, 100);
  text("Last Received: " + inByte, 10, 400);
  text("Last Sent: " + whichKey, 10, 420);
}

void serialEvent(Serial myPort) 
{
  if ( myPort.available() > 0) 
  {  // If data is available,
    inByte = myPort.read();         // read it and store it in val
  }
}

void keyPressed() 
{
  // Send the keystroke out:
  myPort.write(key);
  whichKey = key;
}
