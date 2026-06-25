; ====================================================================
; PROYECTO: Parpadeo de un LED en RB0
; DISPOSITIVO: PIC16F628A
; COMPILADOR: MPASM / Proteus ASM
; ====================================================================

    LIST P=16F628A          ; Definir el procesador
    INCLUDE <P16F628A.INC>  ; Incluir las definiciones de registros

    ; Configuración de los fusibles (Bits de configuración)
    ; XT: Oscilador de cristal externo (4MHz estándar)
    ; WDT_OFF: Watchdog Timer apagado
    ; PWRTE_ON: Power-up Timer encendido
    ; LVP_OFF: Programación en bajo voltaje apagada
    ; MCLRE_ON: Pin Master Clear habilitado
    __CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _LVP_OFF & _CP_OFF

; --------------------------------------------------------------------
; DECLARACIÓN DE VARIABLES (En la memoria RAM de usuario: 0x20 en adelante)
; --------------------------------------------------------------------
    CBLOCK 0x20
        Reg_1               ; Variable 1 para el bucle de retardo
        Reg_2               ; Variable 2 para el bucle de retardo
        Reg_3               ; Variable 3 para el bucle de retardo
    ENDC

; --------------------------------------------------------------------
; VECTOR DE REINICIO (RESET)
; --------------------------------------------------------------------
    ORG 0x00                ; El programa inicia en la dirección 00h
    GOTO Inicio

; --------------------------------------------------------------------
; CONFIGURACIÓN INICIAL DEL HARDWARE
; --------------------------------------------------------------------
Inicio
    ; 1. Desactivar comparadores analógicos (Paso crucial en el 16F628A)
    MOVLW   0x07            ; Cargar b'00000111' en W
    MOVWF   CMCON           ; Apagar comparadores para usar PORTA y PORTB como digitales

    ; 2. Configurar el puerto B
    BANKSEL TRISB           ; Cambiar al Banco 1 de memoria (donde está TRISB)
    BCF     TRISB, 0        ; Configurar RB0 como SALIDA (0 = Salida)
    BANKSEL PORTB           ; Regresar al Banco 0 (donde está PORTB)

; --------------------------------------------------------------------
; BUCLE PRINCIPAL (MAIN LOOP)
; --------------------------------------------------------------------
Bucle
    BSF     PORTB, 0        ; Poner en ALTO (1) el pin RB0 -> Enciende el LED
    CALL    Retardo         ; Esperar un momento
    BCF     PORTB, 0        ; Poner en BAJO (0) el pin RB0 -> Apaga el LED
    CALL    Retardo         ; Esperar un momento
    GOTO    Bucle           ; Repetir infinitamente

; --------------------------------------------------------------------
; SUBRUTINA DE RETARDO (Aproximadamente 500ms usando cristal de 4MHz)
; --------------------------------------------------------------------
Retardo
    MOVLW   D'5'            ; Ajuste del lazo externo
    MOVWF   Reg_1
Lazo3
    MOVLW   D'200'          ; Ajuste del lazo intermedio
    MOVWF   Reg_2
Lazo2
    MOVLW   D'250'          ; Ajuste del lazo interno
    MOVWF   Reg_3
Lazo1
    DECFSZ  Reg_3, F        ; Decrementar Reg_3 y saltar si es 0
    GOTO    Lazo1
    DECFSZ  Reg_2, F        ; Decrementar Reg_2 y saltar si es 0
    GOTO    Lazo2
    DECFSZ  Reg_1, F        ; Decrementar Reg_1 y saltar si es 0
    GOTO    Lazo3
    RETURN                  ; Regresar de la subrutina

    END                     ; Fin del código de ensamblador