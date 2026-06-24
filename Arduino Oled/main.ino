#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <SPI.h>
// Tamaño de pantalla
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 32
// Crear objeto display
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);
void setup() {
  // Inicializar OLED
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    while(true); // Si falla, se queda aquí
  }
  display.clearDisplay();
  // Texto 1
  display.setTextSize(1); display.setTextColor(WHITE);
  display.setCursor(0,0); display.println("Proteus + OLED");
  // Texto 2
  display.setCursor(0,12); display.println("Arduino UNO");
  display.display(); // Actualizar pantalla
}

void loop() {
  // Ejemplo simple animado
  display.clearDisplay(); 
  display.setCursor(0,10); 
  display.println("Contador:");
  static int i = 0; 
  display.setCursor(0,20); 
  display.print(i);
  display.display(); i++; delay(500);
}