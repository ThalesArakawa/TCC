#include <WiFi.h>
#include <ESPAsyncWebServer.h>
#include <SPIFFS.h>

// Replace with your network credentials
const char* ssid = "ANA CLARA";
const char* password = "b38cee27n";

// Create AsyncWebServer object on port 80
AsyncWebServer server(80);

const int potPin = 33;
int sensorValue = 0;
int cmValue = 0;

String readBME280Temperature() {
  // Read temperature as Celsius (the default)
  //float t = bme.readTemperature();
  
  sensorValue = analogRead(potPin);
  cmValue = 8944.44/(sensorValue+1)+3.6;

  if(cmValue >= 30){
    cmValue=30;
  }
  
  Serial.println("teste");
  return String(cmValue);
}

void setup(){
  // Serial port for debugging purposes
  Serial.begin(115200);
  
  // Initialize SPIFFS
  if(!SPIFFS.begin()){
    Serial.println("An Error has occurred while mounting SPIFFS");
    return;
  }

  // Connect to Wi-Fi
  Serial.println("BUSCANDO WIFI");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }

  // Print ESP32 Local IP Address
  Serial.println("IP");
  Serial.println(WiFi.localIP());

  // Route for root / web page
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(SPIFFS, "/index.html");
  });
  server.on("/temperature", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/plain", readBME280Temperature().c_str());
  });

  // Start server
  server.begin();
}
 
void loop(){
}
