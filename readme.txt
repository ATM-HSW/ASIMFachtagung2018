Code:    program code
RO-data: constants
RW-data: initialized data
ZI-data: zero initialized data
text:    program code and constants
data:	   initialized data
bss:	   zero initialized data
de:      sum of text, data and bss

Total RAM Size = RW Data + ZI Data
Total ROM Size = Code + RO Data + RW Data

all examples (except MbedTarget) are created with Keil µVision v5.23
target plattform is NUCLEO_F072RB
HAL low layer and high layer are created with STM32CubeF0 v1.9
Mbed OS v5.6.1 152 is used
MbedTarget r1 is used

MbedTarget
### Project size
   text	   data	    bss	    dec	    hex	filename 
  58932	   2536	   5524	  66992	  105b0	blinky.elf
  
mbed w RTOS
Program Size: Code=31964 RO-data=3112 RW-data=2640 ZI-data=5844  

mbed w/o RTOS
Program Size: Code=20076 RO-data=2428 RW-data=72 ZI-data=1360  

hal_hl
Program Size: Code=2604 RO-data=240 RW-data=8 ZI-data=1024  

hal_ll
Program Size: Code=1164 RO-data=224 RW-data=4 ZI-data=1028  

plain_c
Program Size: Code=508 RO-data=208 RW-data=0 ZI-data=1632  

assembler
Program Size: Code=80 RO-data=8 RW-data=0 ZI-data=0  