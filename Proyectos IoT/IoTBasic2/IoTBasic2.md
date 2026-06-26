# 🌡️ Sistema de Monitoreo de Temperatura con Arduino Yún (Proteus + IoT)

## 📖 Descripción

Este proyecto implementa un sistema de medición de temperatura utilizando un **sensor LM35**, conectado a un **Arduino Yún**, simulado en **Proteus** y visualizado mediante un **Virtual Front Panel (interfaz web localhost:8080)**.

El sistema realiza:

- Lectura analógica del sensor LM35  
- Conversión a temperatura  
- Visualización en indicadores gráficos (termómetro y barra)  
- Publicación del valor a un panel virtual tipo IoT  

---
<img width="1365" height="717" alt="IoTBasic2" src="https://github.com/user-attachments/assets/62cac72c-4ac6-4325-941b-6077c2c886df" />
<img width="1365" height="717" alt="IoTBasic2-2" src="https://github.com/user-attachments/assets/01810781-6703-4229-b966-eb070ebb4dbf" />


## 🧰 Componentes utilizados

### 🔧 Hardware (simulado en Proteus)
- Arduino Yún  
- Sensor de temperatura **LM35**  
- Resistencias  
- Capacitores  
- Fuente de alimentación  

### 💻 Software
- Proteus Professional (Visual Designer + VSM Studio)
- Virtual Front Panel (interfaz web)
- Flowchart (programación gráfica)

---

## ⚙️ Funcionamiento del sistema

### 🔌 Conexión del LM35

| Pin LM35 | Conexión |
|----------|---------|
| Pin 1    | +5V     |
| Pin 2    | A4 (AD4) Arduino |
| Pin 3    | GND     |

---


