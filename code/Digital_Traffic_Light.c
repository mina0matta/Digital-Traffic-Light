/**************************
Project: Digital Traffic Lights
Type : PIC16F877A
Crystal : 8 MHz
**************************/
void main() {
 
 unsigned char segment[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
 unsigned char count;
 
 trisd=1;
 trisb=0; portb=0;
 trisc=0; portc=0;     // C0 green1 // C1 red1 // C2 green2 // C3 red2
 
 while(portd.f0==0);
 
 loop:
     for(count=10;count>0;count--)
     {
        portc=0b00001001; // green1 & red2 are on
        portb=segment[count];
        delay_ms(2000);
     }

     for(count=10;count>0;count--)
     {
        portc=0b00000110; // green2 & red1 are on
        portb=segment[count];
        delay_ms(2000);
     }
 goto loop;
}