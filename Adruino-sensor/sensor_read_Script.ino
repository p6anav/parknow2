#include <SoftwareSerial.h>

#define DEBUG true

SoftwareSerial esp8266(2, 3);  // RX, TX for software serial

String AP = "Airtel_abhi_1245";   // AP Name
String PASS = "air96380";         // AP Password
const int ledPin = 13;            // The number of the LED pin
const int ldrPin = A0;            // LDR pin for sensor data

void setup() {
  Serial.begin(9600);             // Serial communication with the computer
  esp8266.begin(115200);            // Serial communication with the ESP8266

  pinMode(ledPin, OUTPUT);        // Initialize the LED pin as an output
  pinMode(ldrPin, INPUT);         // Initialize the LDR pin as an input

  // Reset the ESP8266 module
  sendCommand("AT+RST\r\n", 2000, DEBUG);
  delay(2000);

  // Set the ESP8266 to station mode
  sendCommand("AT+CWMODE=1\r\n", 1000, DEBUG);
  delay(1000);

  // Connect to the specified WiFi network
  sendCommand("AT+CWJAP=\"" + AP + "\",\"" + PASS + "\"\r\n", 5000, DEBUG);
  delay(10000);  // Wait for connection to stabilize

  // Get the IP address
  sendCommand("AT+CIFSR\r\n", 1000, DEBUG);
  delay(1000);

  // Enable multiple connections
  sendCommand("AT+CIPMUX=0\r\n", 1000, DEBUG);
  delay(1000);

  // Start the server on port 80
  sendCommand("AT+CIPSERVER=1,80\r\n", 1000, DEBUG);
  delay(1000);

  Serial.println("Server Ready");
}

void loop() {
  int ldrStatus = getSensorData();
  String data = "Sensor Value: " + String(ldrStatus);  // Create data string
sendHttpPost("192.168.1.5","/updateSensor",9000,"sensorData="+data);

}


void sendHttpPost(String server, String resource, int port, String data) {
  // Establish TCP connection
  sendCommand(String("AT+CIPSTART=\"TCP\",\"") + server + "\"," + String(port) + "\r\n", 2000, DEBUG);
  delay(2000);

  // Prepare HTTP POST request
  String httpRequest = String("POST ") + resource + " HTTP/1.1\r\n" +
                       "Host: " + server + "\r\n" +
                       "Content-Type: application/x-www-form-urlencoded\r\n" +
                       "Content-Length: " + String(data.length()) + "\r\n\r\n" +
                       data;

  // Send the length of the request
  sendCommand("AT+CIPSEND=" + String(httpRequest.length()) + "\r\n", 1000, DEBUG);
  delay(100);  // Wait for ">" prompt

  // Send the HTTP request
  sendCommand(httpRequest, 2000, DEBUG);
  delay(2000);

  // Close the connection
  sendCommand("AT+CIPCLOSE\r\n", 1000, DEBUG);
}


int getSensorData() {
  int ldrStatus = analogRead(ldrPin);  

  if (ldrStatus <= 80) {
    digitalWrite(ledPin, LOW);  // Turn LED on
  } else {
    digitalWrite(ledPin, HIGH); // Turn LED off
  }
  return ldrStatus;
}

String sendCommand(String command, const int timeout, boolean debug) {
  String response = "";

  esp8266.print(command);  // Send the command to the ESP8266
  
  long int time = millis();

  while ((time + timeout) > millis()) {
    while (esp8266.available()) {
      char c = esp8266.read();  // Read the next character
      response += c;
    }
  }

  if (debug) {
    Serial.print(response);
  }
  return response;
}
