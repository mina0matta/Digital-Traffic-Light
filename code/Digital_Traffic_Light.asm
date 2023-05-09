
_main:

;Digital_Traffic_Light.c,6 :: 		void main() {
;Digital_Traffic_Light.c,8 :: 		unsigned char segment[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
	MOVLW      63
	MOVWF      main_segment_L0+0
	MOVLW      6
	MOVWF      main_segment_L0+1
	MOVLW      91
	MOVWF      main_segment_L0+2
	MOVLW      79
	MOVWF      main_segment_L0+3
	MOVLW      102
	MOVWF      main_segment_L0+4
	MOVLW      109
	MOVWF      main_segment_L0+5
	MOVLW      125
	MOVWF      main_segment_L0+6
	MOVLW      7
	MOVWF      main_segment_L0+7
	MOVLW      127
	MOVWF      main_segment_L0+8
	MOVLW      111
	MOVWF      main_segment_L0+9
;Digital_Traffic_Light.c,11 :: 		trisd=1;
	MOVLW      1
	MOVWF      TRISD+0
;Digital_Traffic_Light.c,12 :: 		trisb=0; portb=0;
	CLRF       TRISB+0
	CLRF       PORTB+0
;Digital_Traffic_Light.c,13 :: 		trisc=0; portc=0;     // C0 green1 // C1 red1 // C2 green2 // C3 red2
	CLRF       TRISC+0
	CLRF       PORTC+0
;Digital_Traffic_Light.c,15 :: 		while(portd.f0==0);
L_main0:
	BTFSC      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Digital_Traffic_Light.c,17 :: 		loop:
___main_loop:
;Digital_Traffic_Light.c,18 :: 		for(count=10;count>0;count--)
	MOVLW      10
	MOVWF      R1+0
L_main2:
	MOVF       R1+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Digital_Traffic_Light.c,20 :: 		portc=0b00001001; // green1 & red2 are on
	MOVLW      9
	MOVWF      PORTC+0
;Digital_Traffic_Light.c,21 :: 		portb=segment[count];
	MOVF       R1+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Digital_Traffic_Light.c,22 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;Digital_Traffic_Light.c,18 :: 		for(count=10;count>0;count--)
	DECF       R1+0, 1
;Digital_Traffic_Light.c,23 :: 		}
	GOTO       L_main2
L_main3:
;Digital_Traffic_Light.c,25 :: 		for(count=10;count>0;count--)
	MOVLW      10
	MOVWF      R1+0
L_main6:
	MOVF       R1+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Digital_Traffic_Light.c,27 :: 		portc=0b00000110; // green2 & red1 are on
	MOVLW      6
	MOVWF      PORTC+0
;Digital_Traffic_Light.c,28 :: 		portb=segment[count];
	MOVF       R1+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Digital_Traffic_Light.c,29 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;Digital_Traffic_Light.c,25 :: 		for(count=10;count>0;count--)
	DECF       R1+0, 1
;Digital_Traffic_Light.c,30 :: 		}
	GOTO       L_main6
L_main7:
;Digital_Traffic_Light.c,31 :: 		goto loop;
	GOTO       ___main_loop
;Digital_Traffic_Light.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
