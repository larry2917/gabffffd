include HT66F3185.inc

;TestChannelLow equ 10 ;difference of normal product
;TestChannelMiddle equ 30
;TestChannelHi equ 50

TestChannelLow equ 5 ;difference of normal product
TestChannelMiddle equ 35 
TestChannelHi equ 65

;only Rx read the pay load ==> Tx IRQ will low



;mov	a,0eah ;correct AccessCode
AccessCode equ 0eah


Length	equ 8
							
;;*--------------------------- BC5602 strobe command ------------------------*;
WRITE_REGS_CMD		equ			0040h;  	;* Register write command *;
READ_REGS_CMD		equ			00C0h;  	;* Register read command *;
REGS_BANK_CMD_020h      	equ		0020h;  	;* Set Register Bank command *;
WRITE_RXADDR_CMD  	equ		0010h;  	;* Write Tx & Rx Addr0 command 3~5Bytes *;
WRITE_TXADDR_CMD   	equ		0090h;  	;* Read Tx & Rx Addr0 command 3~5Bytes *;
READ_PLD_CMD       	equ		00BFh;  	;* Read RX payload command 1~32Bytes *;
WRITE_ACKPLD_CMD     equ 		0011h  	;/* Write TX Ack payload command 1~32Bytes */

WRITE_RXADDR1_CMD   equ   		0012h;  	;* Write TX Ack payload command 1~32Bytes *;
WRITE_NACKPLD_CMD   equ   		0013h;  	;* Write TX NAck payload command 1~32Bytes *;
WRITE_P0ACKPLD_CMD  equ    	0018h;  	;* Write Rx Pipe0 Ack payload command 1~32Bytes *;
WRITE_P1ACKPLD_CMD  equ    	0019h;  	;* Write Rx Pipe1 Ack payload command 1~32Bytes *;
WRITE_P2ACKPLD_CMD  equ    	001Ah;  	;* Write Rx Pipe2 Ack payload command 1~32Bytes *;
WRITE_P3ACKPLD_CMD   equ   	001Bh;  	;* Write Rx Pipe3 Ack payload command 1~32Bytes *;
WRITE_P4ACKPLD_CMD  equ    	001Ch;  	;* Write Rx Pipe4 Ack payload command 1~32Bytes *;
WRITE_P5ACKPLD_CMD  equ    	001Dh;  	;* Write Rx Pipe5 Ack payload command 1~32Bytes *;
SOFT_RESET_CMD      equ			0008h;  	;* Software reset command *;
TX_FIFO_FLUSH_CMD   equ  		0009h;  	;* TX FIFO flush command *;
RX_FIFO_FLUSH_CMD   equ  		0089h;  	;* RX FIFO flush command *;
DEEP_SLEEP_CMD      equ			000Ah;  	;* Enter Deep Sleep mode *;
LIGHT_SLEEP_CMD     equ			000Ch;  	;* Enter Light Sleep mode *;
STANDBY_MODE_CMD    equ			000Dh; 	;* Enter Standby mode *;
TX_MODE_CMD         equ			000Eh;  	;* Enter TX mode *;
MIDDLE_SLEEP_CMD	equ			000Fh;     ;* Enter Middle Sleep mode *;
RX_MODE_CMD         equ			008Eh;  	;* Enter RX mode *;
REGSADDR_MASK       equ			003Fh;

;*------------- BC5602 Common & Bank0 register memory map ------------------*;
CONFIG_REGS_0 		equ			0000h;		;* Configuration Control Register *;
CLK_CTL1_REGS_1 	equ				0001h;		;* Reset;Clock Control Register *;
CLK_CTL2_REGS_2 	equ				0002h;		;* Reset;Clock Control Register *;
IRQ_EN_REGS_3		equ				0003h;		;* Interrupt enable register *;
IRQ_STS_REGS_4		equ			0004h;		;* interrupt status register *;
FIFO_STS_REGS_5		equ			0005h;		;* FIFO Status Control Register *;
GPIO12_CTL_REGS_6 	equ			0006h;		;* GPIO 1;2 control register *;
GPIO34_CTL_REGS_7	equ			0007h;		;* GPIO 3;4 control register *;
GPIO_PULL_UP_REGS_8	equ			0008h;		;* SPI;GPIO pull high control register *;
CRC_CTL_REGS_9		equ			0009h;
WHITENING_REGS_00ah		equ			000Ah;
WHT_PCF_REGS_00bh		equ			000Bh;
RX_PLWID_REGS_00ch		equ			000Ch;
	DLY_CTL_REGS_00dh	equ				000Dh;
MOD_CTL1_REGS_00eh		equ			000Eh;
MOD_CTL2_REGS_00fh		equ			000Fh;
RF_CH_REGS_010h			equ			0010h;
DMOD_CTL1_REGS_011h		equ			0011h;
DMOD_CTL2_REGS_012h		equ			0012h;
SETUP_RETR_REGS_013h	equ			0013h;
OBSERVE_TX_REGS_014h	equ			0014h;
CE_CTL_REGS_015h		equ				0015h;
CP21_REGS_016h			equ			0016h;
CP22_REGS_017h			equ			0017h;
CP31_REGS_018h			equ			0018h;
OPM_CTL_REGS_020h		equ			0020h;
CFO_CTL_REGS_021h		equ			0021h;
FNS_DN_REGS_022h		equ				0022h;
FNS_DKL_REGS_023h		equ			0023h;
FNS_DKM_REGS_024h		equ			0024h;
FNS_DKH_REGS_025h		equ			0025h;
OPM_STS_REGS_026h		equ			0026h;
RSSI_CTL_REGS_027h		equ			0027h;
RSSI_VALUE_REGS_028h	equ			0028h;
RSSI_VALUE_ID_REGS_029h	equ		0029h;
DYNPL_CTL_REGS_02ah		equ			002Ah;
FEATURE_CTL_REGS_02bh	equ			002Bh;
RX_DPWP0_REGS_02ch		equ			002Ch;
RX_DPWP1_REGS_02dh		equ			002Dh;
RX_DPWP2_REGS_02eh		equ			002Eh;
RX_DPWP3_REGS_02fh		equ			002Fh;
RX_DPWP4_REGS_030h		equ			0030h;
RX_DPWP5_REGS_031h		equ			0031h;
EN_AA_REGS_032h			equ			0032h;
RX_ADDRP2_REGS_033h		equ			0033h;
RX_ADDRP3_REGS_034h		equ			0034h;
RX_ADDRP4_REGS_035h		equ			0035h;
RX_ADDRP5_REGS_036h		equ			0036h;
RX_ADDR_EN_REGS_037h	equ			0037h;
XO_CAP_CTL_REGS_038h	equ			0038h;
XO_SEL_CTL_REGS_039h	equ			0039h;
TX_PWR_CTL_REGS_03ah	equ			003Ah;
DMOD_CTL3_REGS_03bh		equ			003Bh;

;*------------------ BC5602 Bank1 register memory map ----------------------*;
AGC_CTL1_REGS_B1_020h	equ				0020h;
AGC_CTL2_REGS_B1_021h	equ				0021h;
AGC_CTL3_REGS_B1_022h	equ				0022h;
AGC_CTL4_REGS_B1_023h	equ				0023h;
FCF_CTL1_REGS_B1_024h 	equ				0024h;
FCF_CTL2_REGS_B1_025h 	equ				0025h;
FCF_CTL3_REGS_B1_026h 	equ				0026h;
FCF_CTL4_REGS_B1_027h 	equ				0027h;
;*------------------ BC5602 Bank2 register memory map ------------------------*;
GAIN_CTL_REGS_B2_021h 	equ				0021h;
RX2_CTL_REGS_02fh 		equ			002Fh;
TX_PWR_CTL0_REGS_034h	equ			0034h;
TX_PWR_CTL1_REGS_035h	equ			0035h;




KeyDet1	equ pa.5 ;
KeyDet2	equ pa.6 ;


SpiCsPin	equ pb.5 ;	
SpiMoSiPin	equ pa.1 ;
SpiMiSoPin	equ pa.3 ;	
SpiClkPin	equ pb.6 ;

RfPower	equ pc.4 ;
TestPin	equ pb.3 ;


	
PowerLedOffT3 equ pb.0
KeyLedScan1	equ pb.1 ;
KeyLedScan2	equ pb.2 ;
KeyLedScan3	equ pa.4 ;	
KeyLedScan4	equ pd.2 ;	

LedCtrlBit0	equ pc.0 ;	
LedCtrlBit1	equ pc.1 ;
LedCtrlBit2	equ pc.2 ;

Pc5_RfIrq equ pc.5




org2 equ 0420h
org3 equ org2 + 0360h
org4 equ org3 + 0300h
org5 equ org4 + 0300h


FrontLevelWeak_c_5	equ 5
FrontLevelMiddle_c_4	equ 4
FrontLevelStrong_c_3	equ 3

BackLevelWeak_c_7	equ 7
BackLevelMiddle_c_8	equ 8
BackLevelStrong_c_9	equ 9




ds	.section	'data'
IntAcc	db	?
IntStatus	db	?

Temp0	db	?
Temp1	db	?
Temp2	db	?
Temp3	db	?

LedPhaseForMassProduction	db	?


Flag8p2ms	db	?
SettedFrontPositionS	db	?
BatteryLowTimes	db	?

MassProductionKeySeq	db	?



DelayTemp0	db	?
DelayTemp1	db	?
BackUpOfRollingCodeIn	db	?
BackUpOfRollingCodeOut	db	?

SettedBackPositionS	db	?
TempC0	db	?
TempC1 db	?
TempC2 db	?
TempC3	db	?

Sn0	db	?
Sn1	db	?
Sn2	db	?

BatValue0	db	?
BatValue1	db	?

TxCycles	db	?

SettedBackPosition	db	?


GotoTest dbit

MassProductionPin_Bit_ dbit

HaveInitRfBefore dbit
FirstKeyCodeBeGotBefore dbit
Tempflag dbit

SettedFrontPositionDirS dbit
SettedBackPositionDirS dbit

SettedBackPositionDir dbit

AlreadyAssignSerialNo dbit
ShowWaterLevelT3 dbit

StartCheckTriger dbit

SmallAreaVar0	db	?
SmallAreaVar1	db	?
SmallAreaVar2	db	?

SmallAreaCounter	db	?
SmallAreaCounter1	db	?

RollingCode	db	?
RandCounter	db	?

Timer20ms	db	?
Timer1S	db	?

TestChannel	db	?
ConTinuePressTimeT989	db	?

SettedFrontPositionDir		dbit

Flag4ms		dbit
Flag100ms	dbit
Flag20ms	dbit
Flag2Sec	dbit

FromWakeUpHalt	dbit

In_Back_Wash	dbit
In_Front_Wash	dbit

DebugCounter db ?
KeyMutiPlex db ?
WaterTemperatueIndex db ?
SeatTemperatueIndex db ?
BatLowAtLeastTimeForLed db ?

IntTemp0 db ?
IntTemp1 db ?
IntTemp2 db ?
The_Ctrl_OfLedScan1 db ?
The_Ctrl_OfLedScan2 db ?
The_Ctrl_OfLedScan3 db ?
The_Ctrl_OfLedScan4 db ?
SwitchCode db ?

FirstTenKeyCountsForMassProd db ?

LedKeepAlive db ?

TimeOutX2ms db ?
TimeOutFlag	dbit
WakeUpNow	dbit
BatteryLow	dbit



PowerLed equ The_Ctrl_OfLedScan1.0
SeatTemp3 equ The_Ctrl_OfLedScan1.2

SeatTemp2 equ The_Ctrl_OfLedScan2.0

SeatTemp1 equ The_Ctrl_OfLedScan2.2

WaterTemp3 equ The_Ctrl_OfLedScan3.0
WaterTemp2 equ The_Ctrl_OfLedScan3.1
WaterTemp1 equ The_Ctrl_OfLedScan3.2

WaterLevel_3 equ The_Ctrl_OfLedScan4.0
WaterLevel_2 equ The_Ctrl_OfLedScan4.1
WaterLevel_1 equ The_Ctrl_OfLedScan4.2


SettedFrontPosition db ?

BkMp1 db ?
BkMp0 db ?
BkBp db ?

TaskNumb db ?
Timer50ms db ?
Timer500ms db ?
Timer2s db ?
BlockPowerLedLit db ?


FirstPowerOn  db ?

FlashOn	dbit

WaitKeyRelease	dbit
KeyCode db ?
KeyTimer db ?
LongKeyTimer db ?
GotLongKey	dbit
KeyGot	dbit
Flag2msT55	dbit
SentThreeFreq	dbit
NoMoreTestAdc dbit

InAutoTest	dbit
ReleaseKeyOfScan1	dbit
ReleaseKeyOfScan2	dbit
ReleaseKeyOfScan3	dbit
ReleaseKeyOfScan4	dbit

BatSpecAtPowerOn dbit



PreMassProductionPin	dbit

BufferOfCcFlag	dbit

Mp0DataInBuffer	db		15 		dup(?)

;;BANK 1

Mp1DataOutBuffer__ equ 090h
Mp1DataOutBuffer_ff equ 09fh

Mp1BufferPa	equ 0a0h
Mp1BufferPac	equ 0a1h
Mp1BufferPapu	equ 0a2h

Mp1BufferPb	equ 0a3h
Mp1BufferPbc	equ 0a4h
Mp1BufferPbpu	equ 0a5h

Mp1BufferPc	equ 0a6h
Mp1BufferPcc	equ 0a7h
Mp1BufferPcpu	equ 0a8h

Mp1BufferPd	equ 0a9h
Mp1BufferPdc	equ 0aah
Mp1BufferPdpu	equ 0abh

pffs1_c equ 11
pfs5_c equ 15

Front_3_pfs4_13 equ 13
Back_3_ps4_3 equ 3

FirstPowerOnS_9 equ 0	;to far out side to for sure all range *** no use now
FirstPowerOnS_9_Count equ 9


OutsideBackHOME_S_8_c equ 8
OutSideFrontPS_8 equ 3004

Debug3080_S_17_C equ 17
MoreThanToHome_S_17_C  equ 17
Debug3080_S_17 equ 3080

;cal04

FrontMostPositionS_7 equ 3000
HOME_MostPositionS_7_Count equ 7




OutSideBackPS_0 equ 1860
OutSideBackPS_0_Count equ 0 ;for far out the all range

BackMostPositionS_10 equ 1940
DifferenceT55 equ 40
ReferencePositionS equ 2044






cs	.section	at  000h	'code'


	org 0

 	jmp	StartT0




	org	04h	;AC110 zero cross point	
	jmp	_Int0Int


	org	08h	
	reti

	org	0ch	
	jmp Timer0Int

	;200us ir
	;4ms 
	org	010h
	jmp Muti1_Timer1_Timer2_Int

	org	014h	
	reti

	
	org	018h	
	reti	
	
;8ms	
	org	01ch	;no use
	jmp	Tb0Int
;2ms
	org	020h	;no use
	jmp	Tb1Int
	

	org	024h	;no use
	jmp	_Int1Int



	org	028h	;
	jmp	SpiInt


	org	02ch	;	
	jmp	Uart1IntT9_1		
		


Tb0Int:
;8.25ms
	mov IntAcc,a 
	mov	a,status
	mov	IntStatus,a	
	
	set Flag8p2ms
	
	
	

	
	sz	KeyTimer
	dec	KeyTimer
	sz	LongKeyTimer
	dec	LongKeyTimer	
	mov	a,IntStatus
	mov	status,a
	mov	a,IntAcc	
	
	reti

Tb1Int:
	mov IntAcc,a 
	mov	a,status
	mov	IntStatus,a	
	mov	a,mp1l
	mov	BkMp1,A
	mov	a,MP0
	mov	BkMp0,a



	set Flag2msT55
	call LedScanTaskT4InInt
	
	sz TimeOutX2ms
	jmp	NotZeroT554
	jmp	NotTimeOut
NotZeroT554:
	sdz TimeOutX2ms
	jmp NotTimeOut
	set TimeOutFlag

NotTimeOut:	
	
	mov	a,BkMp0
	mov	mp0,A
	mov	a,BkMp1
	mov	mp1l,A

	mov	a,IntStatus
	mov	status,a
	mov	a,IntAcc	
	reti


LedScanTaskT4InInt:





	sz BlockPowerLedLit
	jmp InBlock
 	jmp NotInBlock
InBlock:
	dec BlockPowerLedLit	
	jmp EndT8887322	


NotInBlock:

	snz MassProductionPin_Bit_
	jmp MassT7777

	snz BatteryLow ;for power led task
	jmp	PowerLedOntt
	jmp EndT8887322		
PowerLedOntt:
	clr PowerLedOffT3		;normal on

MassT7777:	
EndT8887322:	


	call CheckMassProDuctionTriger

	sdz KeyMutiPlex
	jmp EndT889944
	mov	a,4
	mov	KeyMutiPlex,a
EndT889944:

	mov	a,KeyMutiPlex
	mov	IntTemp0,a
	sdz IntTemp0
	jmp Not1T9990
	call DecideKeyControlT5InInt
	call OffPortEeT99InInt
	set KeyLedScan2
	clr KeyLedScan1	;KeyMutiPlex == 1
	call SetPortEeT99InInt
	jmp SetScanStartEnd	
Not1T9990:	
	sdz IntTemp0
	jmp Not2T9990
	call DecideKeyControlT5InInt
	call OffPortEeT99InInt
	set KeyLedScan3
	clr KeyLedScan2
	call SetPortEeT99InInt
	jmp SetScanStartEnd	
Not2T9990:	
	sdz IntTemp0
	jmp Not3T9990
	call DecideKeyControlT5InInt
	call OffPortEeT99InInt
	set KeyLedScan4
	clr KeyLedScan3
	call SetPortEeT99InInt
	jmp SetScanStartEnd	
Not3T9990:	
	sdz IntTemp0
	jmp Not4T9990
	call DecideKeyControlT5InInt
	call OffPortEeT99InInt
	set KeyLedScan1
	clr KeyLedScan4
	call SetPortEeT99InInt
	jmp SetScanStartEnd	
Not4T9990:		
SetScanStartEnd:	

EndT889903:
	ret	



	
	
DecideKeyControlT5InInt:
	clr C
	rlca KeyMutiPlex	
  	addm a,PCL
  	mov a,0
  	jmp	EndT9998
  	mov	a,The_Ctrl_OfLedScan1
  	jmp	EndT9998
  	mov	a,The_Ctrl_OfLedScan2
  	jmp	EndT9998  	
  	mov	a,The_Ctrl_OfLedScan3
  	jmp	EndT9998  	
  	mov	a,The_Ctrl_OfLedScan4
  	jmp	EndT9998  	
EndT9998:
	mov	IntTemp0,a
	ret  	

OffPortEeT99InInt:
	clr LedCtrlBit0 	
	clr LedCtrlBit1  	
	clr LedCtrlBit2
	ret  	
	
  	
SetPortEeT99InInt:
	sz IntTemp0.0
	set LedCtrlBit0
	snz  IntTemp0.0
	clr LedCtrlBit0  	
	sz IntTemp0.1
	set LedCtrlBit1
	snz  IntTemp0.1
	clr LedCtrlBit1   	
	sz IntTemp0.2
	set LedCtrlBit2
	snz  IntTemp0.2
	clr LedCtrlBit2  
	ret	
  	



_Int0Int:

	reti

_Int1Int:

	reti

SpiInt:

	reti

Uart1IntT9_1:

	reti

	
Timer0Int:

	reti		
	
	
	
Muti1_Timer1_Timer2_Int:

	reti	

	
ClearAllLed:
	set PowerLedOffT3 ;clear_all_led
ClearAllButPowerLed:
	clr WaterLevel_3
	clr WaterLevel_2	
	clr WaterLevel_1	
		
	clr WaterTemp3	
	clr WaterTemp2		
	clr WaterTemp1	
	
	clr SeatTemp2	
	clr SeatTemp1	
	clr SeatTemp3

	ret

SystemClockConfigure_:
	mov	a,052h
	mov	WDTC,A ;wdt enable

	ret
	
InitIo:
	mov a,11111101b
	mov	pa,A
	mov	a,11101101b
	mov	pac,A
	mov	a,10000101b
	mov	papu,A
	mov a,11111101b
	mov	pa,A	
	
	mov a,00101110b
	mov	pb,A
	mov	a,00001000b
	mov	pbc,A
	mov	a,00001000b
	mov	pbpu,A
	mov a,00101110b
	mov	pb,A	
	
	mov a,00110000b
	mov	pc,A
	mov	a,00100000b
	mov	pcc,A
	mov	a,00100000b
	mov	pcpu,A
	mov a,00110000b
	mov	pc,A

	mov a,00000110b
	mov	pd,A
	mov	a,00000000b
	mov	pdc,A
	mov	a,00000000b
	mov	pdpu,A
	mov a,00000110b
	mov	pd,A
	ret	
	
InitRam:

	mov	a,080h
	mov	mp0,a
	mov	a,128	
Clr_Ram:
	clr	IAR0
	inc	mp0
	mov	Temp0,a
	sdz	Temp0
	jmp	NotZeroT0
	jmp	EndT0
NotZeroT0:
	mov	a,Temp0
	jmp	Clr_Ram
EndT0:	
;;can not use MP0 <--- it can not point to bank 1

	mov	a,080h
	mov	mp1l,a
	mov	a,128	
Clr_RamT1:
	clr	IAR1
	inc	mp1l
	mov	Temp0,a
	sdz	Temp0
	jmp	NotZeroT01
	jmp	EndT01
NotZeroT01:
	mov	a,Temp0
	jmp	Clr_RamT1
EndT01:	
	ret
;;;;;;;;;;;;;-------------------------------------------------

DelayXms:
	mov	DelayTemp0,a
;1ms = 1000us = 2000 nop	
DelayLpT8:
	mov	a,200
	mov	DelayTemp1,A
DelayLpT998:
	clr wdt
	nop
	nop
	nop

		
	nop
	nop
	nop	
	sdz DelayTemp1
	jmp	DelayLpT998	
	
		
	sdz DelayTemp0
	jmp DelayLpT8	

	ret
	
ReturnSpiPinToIoPin:
	clr PAS0
	clr PAS1
	clr PBS0
	clr PBS1

	ret	
	
	
BC5602InterfaceConfigure:
	clr SIMEN ;		
	
	clr SIM2
	clr SIM1	
	set SIM0	
	
	set mls
	set ckeg
	set CKPOLB						;	/* CKPOLB=1,CKEG=1,MLS=MSB first */
	
	
	
	;/* setup MCU I/O for BC5602 interface */

	set SCSBPS

	
	
	
	set PAS03 ;pa1 is sdo
	clr PAS02
	
	clr PAS07 ;pa3 is sdi
	set PAS06	
	
	clr Pbs15 ;pb6 is sck
	set Pbs14
		
	clr Pbs13 ;pb5 is scs
	set Pbs12		
		
	set SDI_SDAPS ;select pa3
	set SCK_SCLPS ;select pb6	
	set SCSBPS ;select pb5
	;sdo no need to select 
	

	call SPI_CSN_HIGH;		;llo						/* CSN=HIGH */

	;/* IRQ falling edge */	
	clr int1s0
	set int1s1	
		
	;	/* SPI master mode & SPI clock is Fsys/4 */




	set SIMEN ;						;	/* SPI enable */
				mov	a,3
				call SPI_delay
				
				
				
	ret
	
	
	
		
InitTb:	

	mov	a,1
	mov	PSC0R,a
	mov	PSC1R,a
	mov	a,6	
	mov	tb0c,A	;tb0:2^13
	mov	a,4
	mov	tb1c,A	;		
	
	clr TB0F
	set TB0E
	clr TB1F
	set TB1E	
	set tb0on
	set tb1on
	ret
	
Delay10us:
	
	mov	a,6
WaitT9334:	
	sdz acc
	jmp	WaitT9334
	
	ret	


CheckMassProDuctionTriger:


;del mark for real
	snz StartCheckTriger
	jmp NotT99987798
	

	
	mov	a,KeyMutiPlex
	xor a,3	
	snz Z
	jmp Not2T9998899
	
	sz	KeyDet1
	jmp NotT99987798
	snz	KeyDet2
	jmp NotT99987798
		
	jmp EndT33334532
Not2T9998899:	
	mov	a,KeyMutiPlex
	xor a,2
	snz Z
	jmp EndT33334532
	
	sz	KeyDet1
	jmp NotT99987798
	snz	KeyDet2
	jmp NotT99987798	
	
	jmp EndT33334532

NotT99987798:
	clr	StartCheckTriger 

EndT33334532:	
	ret
	



;C=1 ;There is result --> set KeepAlive
;KeyCode : confirmed Key Code ---> decided after key be got


KeyScan:

	clr tb1e

	mov	a,KeyMutiPlex	
	mov	SmallAreaVar0,a	

	mov	a,KeyTimer
	sz	KeyTimer
	jmp	InKeyScanEnd
	sz	WaitKeyRelease
	jmp	CheckKeyRelease
ScanKey:
	snz	KeyDet1
	jmp	KeyDet1Pressed
	snz	KeyDet2
	jmp	KeyDet2Pressed

	jmp	ErrorEnd


;;replace (2) by (1) <--- if need long key

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(1)This is for long power Key	
KeyDet1Pressed:



	clr c
	rlca SmallAreaVar0
	dec acc
	mov Temp0,a

	xor a,5
	snz Z
	jmp	NotCleanHeadT00

	mov	a,120
	;mov	a,12	
	mov	LongKeyTimer,a
	call	SetDebounce
	call	SetWaitKeyRelease
	call	DelGotLongKey
	jmp	InKeyScanEnd
	
NotCleanHeadT00:
EndT77483:	
	jmp GotShortKeyT0



KeyDet2Pressed:
	clr c
	rlca SmallAreaVar0
	dec acc
	mov Temp0,a

	inc Temp0

	jmp GotShortKeyT0


GotShortKeyT0:
	mov	a,Temp0
	mov	KeyCode,a
	jmp	GotShortKey

GotShortKey:
		call SetDebounce
		call SetWaitKeyRelease	
		call SetGotLongKey		;finish
		jmp GotKeyEnd


CheckKeyRelease:
	snz	KeyDet1
	jmp	KeyNotRelease
	snz	KeyDet2
	jmp	KeyNotRelease

	rlca SmallAreaVar0
	addm a,PCL
	nop
	nop
	set ReleaseKeyOfScan1
	jmp EndT33092
	set ReleaseKeyOfScan2
	jmp EndT33092	
	set ReleaseKeyOfScan3
	jmp EndT33092	
	set ReleaseKeyOfScan4
	jmp EndT33092
	
EndT33092:
	snz 	ReleaseKeyOfScan1
	jmp KeyNotRelease
	snz 	ReleaseKeyOfScan2
	jmp KeyNotRelease	
	snz 	ReleaseKeyOfScan3
	jmp KeyNotRelease	
	snz 	ReleaseKeyOfScan4
	jmp KeyNotRelease	

KeyReleaseT2:
		call	SetDebounce
		call	DelWaitKeyRelease
		call	DelGotLongKey	
		sz	LongKeyTimer
		jmp	ItIsLongKeyShort
		jmp	InKeyScanEnd
ItIsLongKeyShort:
	mov	a,5
	mov	KeyCode,a
	clr	LongKeyTimer
	jmp	GotShortKey

KeyNotRelease:

	
	sz	GotLongKey
	jmp	InKeyScanEnd
	sz	LongKeyTimer
	jmp	InKeyScanEnd
	call	SetGotLongKey
	mov	a,9
	mov	KeyCode,a
	jmp	GotKeyEnd
	


GotKeyEnd:
	set	c
	jmp EndT995004

InKeyScanEnd:
ErrorEnd:
	clr	c
EndT995004:	
	set tb1e	
	ret
	
SetDebounce:
	mov	a,25
	;mov	a,3	
	mov	KeyTimer,a
	ret

SetWaitKeyRelease:
	clr ReleaseKeyOfScan1
	clr ReleaseKeyOfScan2	
	clr ReleaseKeyOfScan3	
	clr ReleaseKeyOfScan4	
	set	WaitKeyRelease
	ret
	
DelWaitKeyRelease:
	clr	WaitKeyRelease
	ret


SetGotLongKey:
	set	GotLongKey
	ret
	
DelGotLongKey:
	clr	GotLongKey
	ret
	

SPI_CSN_LOW:
	set csen
	ret
	

SPI_CSN_HIGH:
	clr csen
	ret
		
BC5602SerialIO:
	clr trf
	mov	simd,a
WaitT99483:	
	snz trf
	jmp	WaitT99483
	clr trf
	nop
	nop	
	mov	a,simd
	ret	

SPI_delay:
	sdz ACC
	jmp	SPI_delay
	ret

BC5602SendAaByte:
				mov SmallAreaVar0,a
				call SPI_CSN_LOW
				mov	a,SmallAreaVar0
				call BC5602SerialIO
				mov	a,3
				call SPI_delay
				call SPI_CSN_HIGH

				ret



;;;acc  REGISTER
;;;acc is the DATA out
BC5602ReadRegister:
			;	and a,REGSADDR_MASK
			;	or  a,READ_REGS_CMD

				call SPI_CSN_LOW

				call BC5602SerialIO	
				mov a,0ffh
				call BC5602SerialIO			;;ll		
				
				call SPI_CSN_HIGH
				

				ret				


;;;acc  REGISTER
;;;Temp2 is the DATA to 5602
BC5602WriteRegister:	;two byte

			;	and a,REGSADDR_MASK
			;	or  a,WRITE_REGS_CMD

				call SPI_CSN_LOW

				call BC5602SerialIO
				
				mov a,Temp2
				call BC5602SerialIO					
				
				call SPI_CSN_HIGH

				ret
				
StopAllAdc:

	clr sadc0
 	clr sadc1
	clr sadc2
	clr vbgren
	ret
	

Parameter_Initialization0:
		clr SmallAreaCounter
	
LpT99933040:	
		mov	a,SmallAreaCounter
		
		call	GetTableData0 ;low byte is in Temp2 now.
		mov	Temp0,A				;Temp0 is register, Temp2 is data
		xor a,0ffh
		snz	z
		jmp NotEndT99444890
		mov A,Temp2				;Temp0 is register, Temp2 is data
		xor a,0ffh
		sz	z
		jmp EndT99444890		
		
NotEndT99444890:		
		mov	a,Temp0
		call BC5602WriteRegister
		inc	SmallAreaCounter

	mov	a,1	
	;call DelayXms

		jmp		LpT99933040
EndT99444890:
		ret




FillBytes:

		clr SmallAreaCounter
		mov	a,Mp1DataOutBuffer__
		mov	mp1l,a
		
LpT99933040f:	
		mov	a,SmallAreaCounter		
		call	GetMultiBytesData0
		mov	Temp0,A
		xor a,0ffh
		snz	z
		jmp NotEndT99444890f
		mov A,Temp2				;Temp0 is register, Temp2 is data
		xor a,0ffh
		sz	z
		jmp EndT99444890f			
NotEndT99444890f:
		mov a,Temp0				
		mov	iar1,a
		inc mp1l
		inc	SmallAreaCounter

		jmp		LpT99933040f
EndT99444890f:

		ret

ReadPayLoad:

		mov	a, offset Mp0DataInBuffer
		mov	mp0,a	
				mov	a,10
				mov SmallAreaCounter,a
				call SPI_CSN_LOW
				mov	a,0bfh
				call BC5602SerialIO				

LpTxBuffer23:
				mov	a,0ffh
				call BC5602SerialIO
				mov	iar0,a
				inc mp0



				sdz SmallAreaCounter
				jmp LpTxBuffer23
					
				call SPI_CSN_HIGH

		ret


SpiMultiByteT6:

		mov	a,Mp1DataOutBuffer__
		mov	mp1l,a
		mov	a,offset  Mp0DataInBuffer
		mov	mp0,a		

				
				call SPI_CSN_LOW

LpTxBuffer2:
				mov	a,iar1
				inc mp1l
				call BC5602SerialIO
				mov	iar0,a
				inc mp0	
				sdz SmallAreaCounter
				jmp LpTxBuffer2
				
				
				call SPI_CSN_HIGH

		ret



Bc5602Init_T9:
	call BC5602InterfaceConfigure	
	
	mov	a,3
	call DelayXms										
	mov	a,00ch ;light sleep mode
	;mov	a,00dh ;standby mode
	call BC5602SendAaByte
	
	mov	a,3
	call DelayXms	
	mov	a,008h
	call BC5602SendAaByte
	
	mov	a,3
	call DelayXms	
	mov	a,020h
	call BC5602SendAaByte

	mov	a,3
	call DelayXms

		mov	a,069h
		mov	Temp2,a		
		mov	a,046h							
		call	BC5602WriteRegister ;CE low
		
		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0		
		

	mov	a,1
	mov	SmallAreaCounter1,a
	call Parameter_Initialization0 ;1
	
	mov	a,20
	call DelayXms	
		mov	a,0c1h
		call	BC5602ReadRegister	;; may be wait something

	;jmp tttr
	mov	a,20
	call DelayXms		
		mov	a,0b1h		
		mov	Temp2,a		
		mov	a,041h							
		call	BC5602WriteRegister ;
	mov	a,20
	call DelayXms							
		mov	a,030h		
		mov	Temp2,a		
		mov	a,041h							
		call	BC5602WriteRegister ;
tttr:	
	jmp tttr2		
		mov	a,091h				
		mov	Temp2,a		
		mov	a,041h							
		call	BC5602WriteRegister ;SET GPIO2 to IRQ out
		
		mov	a,010h				
		mov	Temp2,a		
		mov	a,041h							
		call	BC5602WriteRegister ;SET GPIO2 to IRQ out
tttr2:				
	
			
	mov	a,34
	mov	SmallAreaCounter1,a
	call Parameter_Initialization0		;34	
			
	
	mov	a,00ch
	call BC5602SendAaByte
	mov	a,2
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0	;2
	


		mov	a,0c9h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
	
		and a,00110000b
		or a,00100000b ;crc						
		mov	Temp2,a		
		mov	a,049h							
		call	BC5602WriteRegister ;SET GPIO2 to IRQ out
				


							
			
	mov	a,35
	mov	SmallAreaCounter1,a
	call Parameter_Initialization0		;35	
				
	
	mov	a,022h
	call BC5602SendAaByte
	mov	a,4
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0	;4
	
	
	mov	a,020h
	call BC5602SendAaByte	
	
		mov	a,0c3h
		call	BC5602ReadRegister	;;CONFIG_REGS_0

		and a,10001110b
		or a,00000001b ;mask int
		;or a,1	;250k					
		mov	Temp2,a		
		mov	a,043h							
		call	BC5602WriteRegister ;SET GPIO2 to IRQ out




	mov	a,20
	call DelayXms	
;; may be wait something
		mov	a,0f7h
		call	BC5602ReadRegister	;;CONFIG_REGS_0	
		mov	a,0f2h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
		
	mov	a,6
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0		;6
	
			
	mov	a,7
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0		;7		
			
		
	mov	a,20
	call DelayXms	
;; may be wait something			
		mov	a,0f7h
		call	BC5602ReadRegister	;;CONFIG_REGS_0	
		mov	a,0f2h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
					
	mov	a,8
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0			;8
			
		mov	a,009h
	call BC5602SendAaByte		
			
		mov	a,089h
	call BC5602SendAaByte		
				
			
		mov	a,0c4h
		call	BC5602ReadRegister	;;irq1		
		and a,10000000b
		or a,00000000b ;irq1					
		mov	Temp2,a		
		mov	a,044h							
		call	BC5602WriteRegister ;irq1
		
	mov	a,9
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0					;9
			
	mov	a,20
	call DelayXms
			mov	a,0c1h
		call BC5602ReadRegister	
		
		mov	a,00ch
	call BC5602SendAaByte			
			
			
	mov	a,10
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0			;10
			
	mov	a,20
	call DelayXms
		mov	a,0c3h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
					
	mov	a,11
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0			;11
			
			
		mov	a,089h
	call BC5602SendAaByte	
	
	mov	a,12
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0			;12
					
		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
			
		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
						

	
		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0

		mov	a,00ch
	call BC5602SendAaByte

		mov	a,007h				
		mov	Temp2,a		
		mov	a,04eh							
		call	BC5602WriteRegister ;SET GPIO2 to IRQ out
		

	;;;;------------------
	mov	a,11
	mov	SmallAreaCounter1,a		
	call Parameter_Initialization0	;set to RX mode		
			

		mov	a,00ch				
		mov	Temp2,a		
		mov	a,RX_DPWP0_REGS_02ch							
		call	BC5602WriteRegister ;SET payload length

		mov	a,00ch				
		mov	Temp2,a		
		mov	a,RX_DPWP1_REGS_02dh							
		call	BC5602WriteRegister ;SET payload length				

		mov	a,00ch				
		mov	Temp2,a		
		mov	a,RX_DPWP2_REGS_02eh							
		call	BC5602WriteRegister ;SET payload length		
					
						
		mov	a,08eh
	call BC5602SendAaByte			
			
	call	SetCh_SetBps_	
	
		ret


SetCh_SetBps:
		mov	a,TestChannel
		mov	Temp2,a		
		mov	a,050h							
		call	BC5602WriteRegister		;;	auto calibration VCO ;;OPM_CTL_REGS_020h
		
		mov	a,0e0h
		call	BC5602ReadRegister	;;CONFIG_REGS_03		
 
 		or a,00001000b
		mov	Temp2,a		
		mov	a,060h							
		call	BC5602WriteRegister ;calibration		
		
WaitCaliEndT990:
		mov	a,3
		;call DelayXms		
		mov	a,0e0h
		call	BC5602ReadRegister	;;CONFIG_REGS_03		
 
 		sz acc.3
 		jmp	WaitCaliEndT990	
		
		ret


SetCh_SetBps_:
		mov	a,0Ch
	call BC5602SendAaByte
	
		mov	a,TestChannel
		mov	Temp2,a		
		mov	a,050h							
		call	BC5602WriteRegister		;;	auto calibration VCO ;;OPM_CTL_REGS_020h
		
		mov	a,0d1h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
		
		and a,0f8h
		;or a,0 ;500K BPS
		;or a,2 ;125k	
		;or a,1	;250k					
		mov	Temp2,a		
		mov	a,051h							
		call	BC5602WriteRegister ;SET bps

	call SetAccess11287902ff		
		
		ret
		
	
LitAllButPowerLed:
	set WaterLevel_1 ;lll	
	set WaterTemp1	
	set SeatTemp1
	set WaterLevel_2	
	set WaterTemp2	
	set SeatTemp2
	set WaterLevel_3	
	set WaterTemp3	
	set SeatTemp3
	ret
	

SetAccess11287902ff:							
		mov	a,Mp1DataOutBuffer__
		mov	mp1l,a
		mov	a,010h
		mov iar1,A
		inc mp1l
		mov	a,022h

		mov iar1,A		
		inc mp1l
		mov	a,028h
		mov iar1,A		
		inc mp1l
		mov	a,079h
		mov iar1,A		
		inc mp1l
		mov	a,002h
		mov iar1,A		
		inc mp1l
		mov	a,0ffh
		mov iar1,A			
	
		mov a,6
 		mov SmallAreaCounter,a		
	call	SpiMultiByteT6	
		ret
	


SendOneTx:	
	inc RollingCode	
		mov	a,00ch
	call BC5602SendAaByte				
		
	call SetCh_SetBps		
		
	

			
		mov	a,0c3h
		call	BC5602ReadRegister	;;CONFIG_REGS_03		
 and a,10001110b
 or a,0

		mov	Temp2,a		
		mov	a,043h							
		call	BC5602WriteRegister ;switch to tx mode
			

		mov	a,Mp1DataOutBuffer__
		mov	mp1l,a
		mov	a,011h ;the header of write payload
		mov	iar1,A

		

	mov a,11
 		mov SmallAreaCounter,a		
	call	SpiMultiByteT6
		mov	a,0d5h
		call	BC5602ReadRegister	;;CONFIG_REGS_0x15	

 and a,11111110b
 mov SmallAreaCounter1,a
		or	a,001h				
		mov	Temp2,a		
		mov	a,055h							
		call	BC5602WriteRegister ;SET CE to Hi		
		
		mov	a,SmallAreaCounter1				
		mov	Temp2,a		
		mov	a,055h							
		call	BC5602WriteRegister ;SET CE to Low		
				

				

		mov	a,0e6h
		call	BC5602ReadRegister	;;REGS_0x26
		mov	a,0e6h
		call	BC5602ReadRegister	;;REGS_0x26
		
		mov	a,0e6h
		call	BC5602ReadRegister	;;REGS_0x26
		mov	a,0e6h
		call	BC5602ReadRegister	;;REGS_0x26
		
	
		mov	a,0c4h
		call	BC5602ReadRegister	;;REGS_0x04

 and a,10000000b
		
		or	a,070h
		mov	Temp2,a		
		mov	a,044h							
		call	BC5602WriteRegister		;;	
							
		mov	a,0cch
		;call	BC5602ReadRegister	;;CONFIG_REGS_0


				

	ret


;;;MMMMMMMMMMMMMMMMMM


;;;lllllllllllllllllllllllllll

	clr wdt
	mov	a,00ch ;light sleep mode
	call BC5602SendAaByte
	
		
		mov	a,TestChannelLow
		mov	Temp2,a		
		mov	a,050h							
		call	BC5602WriteRegister ;	

	
		mov	a,0c3h
		call	BC5602ReadRegister	;;CONFIG_REGS_0			

		mov	a,011h
		mov	Temp2,a		
		mov	a,043h							
		call	BC5602WriteRegister ;switch to tx mode
			
		mov	a,070h
		mov	Temp2,a		
		mov	a,044h							
		call	BC5602WriteRegister		;;		
	

		mov	a,08eh
	call BC5602SendAaByte
	
		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
			
		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
			

		mov	a,0e6h
		call	BC5602ReadRegister	;;CONFIG_REGS_0
				
	

	
TimeOutT99948:	
	
	ret

SetSwitchCodeT55:

	mov	a,TableSwCode
	add a,KeyCode 
	mov	tblp,A
	tabrd SwitchCode
	mov	a,SwitchCode
	and a,00111111b
	mov	SwitchCode,a
	
	ret	

	
SetTemperature:

	ret	
	



	
SetThe_S_Position:

	snz In_Back_Wash
	jmp	ItIsFrontT88S
	
	sz SettedBackPositionDirS
	jmp	BackPositionDirS_T4
	mov	a,SettedBackPositionS
	sub	a,4
	snz	c
	jmp	AddOneBackT99893S
	set	SettedBackPositionDirS		
AddOneBackT99893S:	
	inc SettedBackPositionS
	jmp BackEndT99903S	
	
BackPositionDirS_T4:
	mov	a,SettedBackPositionS
	sub	a,3
	sz	c
	jmp	MinusOneBackT99387S
	clr	SettedBackPositionDirS
MinusOneBackT99387S:	
	dec SettedBackPositionS

BackEndT99903S:	
	call	WriteSettedBackPositionS	
		
	jmp	EndSetT99032S
		

ItIsFrontT88S:	
	snz In_Front_Wash
	ret	
		
	sz SettedFrontPositionDirS
	jmp	FrontPositionDirS_T4
	mov	a,SettedFrontPositionS
	sub	a,14
	snz	c
	jmp	AddOneFrontT99893S
	set	SettedFrontPositionDirS		
AddOneFrontT99893S:	
	inc SettedFrontPositionS
	jmp EndFrontT99903S	
	
FrontPositionDirS_T4:
	mov	a,SettedFrontPositionS
	sub	a,13
	sz	c
	jmp	MinusOneFrontT99387S
	clr	SettedFrontPositionDirS
MinusOneFrontT99387S:	
	dec SettedFrontPositionS

EndFrontT99903S:	
	call	WriteSettedFrontPositionS	
		
	jmp	EndSetT99032S
			
EndSetT99032S:
	ret	
	


	

CheckHaltCondition:
;	ret
       ; sz BatLowAtLeastTimeForLed
;	jmp NotGotoHaltT6656

	snz MassProductionPin_Bit_
	jmp NotGotoHaltT6656
	sz LedKeepAlive
	jmp NotGotoHaltT6656
	sz KeyTimer
	jmp NotGotoHaltT6656	
	sz LongKeyTimer
	jmp NotGotoHaltT6656
	sz WaitKeyRelease
	jmp NotGotoHaltT6656
	sz TxCycles
	jmp NotGotoHaltT6656
	
	;;;;;-----
	
	

	call ClearAllLed



		mov	a,000h
		mov	Temp2,a		
		mov	a,044h								
		call	BC5602WriteRegister ;switch to tx mode
	
		mov	a,001h
		mov	Temp2,a		
		mov	a,055h								
	;call BC5602SendAaByte	;tis will induce a Tx
		

		
		
		mov	a,000h
		mov	Temp2,a		
		mov	a,055h								
	;call BC5602SendAaByte	;tis will induce a Tx
			
		mov	a,000h
		mov	Temp2,a		
		mov	a,0e6h								
		call	BC5602WriteRegister ;switch to tx mode
						
		mov	a,000h
		mov	Temp2,a		
		mov	a,0e6h								
		call	BC5602WriteRegister ;switch to tx mode
						
		mov	a,000h
		mov	Temp2,a		
		mov	a,0e6h								
		call	BC5602WriteRegister ;switch to tx mode
			
		mov	a,000h
		mov	Temp2,a		
		mov	a,0e6h								
		call	BC5602WriteRegister ;switch to tx mode
						
			
							
		mov	a,009h
	;call BC5602SendAaByte	;tis will induce a Tx	
					



	
	mov	a,10
	call DelayXms
		mov	a,00ah
	call BC5602SendAaByte		
	mov	a,10
	call DelayXms					

		

	mov	a,50
	call DelayXms ;for LED status process OkPass
	clr EMI
	
	
	clr FirstKeyCodeBeGotBefore

	call StopAllAdc
	
	clr SIMEN
	
	mov	a,Mp1BufferPa
	mov	mp1l,A
	
	mov	a,pa
	mov	iar1,A
	inc	mp1l

	mov	a,pac
	mov	iar1,A	
	inc	mp1l

	mov	a,papu
	mov	iar1,A	
	inc	mp1l
	

	mov	a,pb
	mov	iar1,A
	inc	mp1l
		
	mov	a,pbc
	mov	iar1,A
	inc	mp1l	
		
	mov	a,pbpu
	mov	iar1,A		
	inc	mp1l	


	mov	a,pc
	mov	iar1,A
	inc	mp1l
		
	mov	a,pcc
	mov	iar1,A	
	inc	mp1l

	mov	a,pcpu
	mov	iar1,A		
	inc	mp1l	


	mov	a,pd
	mov	iar1,A
	inc	mp1l

	mov	a,pdc
	mov	iar1,A	
	inc	mp1l

	mov	a,pdpu
	mov	iar1,A		
	inc	mp1l		

	
	call ReturnSpiPinToIoPin
	
		
	
	mov	a,11101101b
	mov	pac,A
	mov	a,11100111b	
	mov	papu,A
	mov	a,11101111b
	mov	pa,A	

	mov	a,01100000b
	mov	pawu,A
	
	
	
	
	mov	a,10001001b
	mov	pbc,A
	mov	a,11101001b	
	mov	pbpu,A
	mov	a,11101001b	
	mov	pb,A
	
	mov	a,11111111b
	mov	a,11111000b	
	mov	pcc,A
	mov	a,11011000b	
	mov	pcpu,A
	mov	a,11111000b
	mov pc,a
	
	mov	a,11111011b	
	mov	pdc,A
	mov	a,11111011b	
	mov	pdpu,A
	mov	a,11111011b
	mov pd,a	
	

	
	mov	a,0aah
	mov	wdtc,A
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop



	halt
	
	nop
	nop
	nop
	nop
	mov	a,100
	mov	BlockPowerLedLit,a	
 	set PowerLedOffT3 ;wake up from HALT ==> off LED first
	mov	a,60
	mov	LedKeepAlive,a
	
	call InitIo
	call InitAdc
 	set PowerLedOffT3 ;wake up from HALT ==> off LED first
	
	mov	a,Mp1BufferPa
	mov	mp1l,A
	mov	a,iar1	
	mov	pa,a

	inc	mp1l
	mov	a,iar1
	mov	pac,a
	
	inc	mp1l
	mov	a,iar1
	mov	papu,a
	
	inc	mp1l	
	mov	a,iar1
	mov	pb,a

	inc	mp1l
	mov	a,iar1		
	mov	pbc,a

	inc	mp1l	
	mov	a,iar1	
	mov	pbpu,a
		
	inc	mp1l	
	mov	a,iar1
	mov	pc,a

	inc	mp1l
	mov	a,iar1		
	mov	pcc,a
	
	inc	mp1l
	mov	a,iar1
	mov	pcpu,a
		
	inc	mp1l	

	mov	a,iar1
	mov	pd,a

	inc	mp1l
	mov	a,iar1
	mov	pdc,a
	
	inc	mp1l
	mov	a,iar1	
	mov	pdpu,a
	
	clr ShowWaterLevelT3
 clr In_Front_Wash
 clr In_Back_Wash
 set PowerLedOffT3 ;wake up from HALT ==> off LED first
NotGotoHaltT6656:
	set emi	
	set SIMEN
	mov	a,052h
	mov	WDTC,A ;wdt enable

	ret



	
	;org org2
;;;ooopppppllllll2222
SetTheSeatTemperatueLevel:
	mov	a,SeatTemperatueIndex
	addm a,PCL
	jmp	SeatIndexSelect4
	jmp	SeatIndexSelect1
	jmp	SeatIndexSelect2
	jmp	SeatIndexSelect3	
	jmp	SeatIndexSelect4	
	
	
SeatIndexSelect1:
SeatIndexSelect2:
SeatIndexSelect3:
	inc SeatTemperatueIndex	
	jmp EndT884733
	
SeatIndexSelect4:
	mov	a,1
	mov	SeatTemperatueIndex,a	;from index 2	
		
EndT884733:	
	call	WriteSeatTankTempIndex
	ret
	
	
SetTheWaterTemperatueLevel:
	mov	a,WaterTemperatueIndex
	addm a,PCL
	jmp	WaterIndexSelect4
	jmp	WaterIndexSelect1
	jmp	WaterIndexSelect2
	jmp	WaterIndexSelect3	
	jmp	WaterIndexSelect4	
	
	
WaterIndexSelect1:
WaterIndexSelect2:
WaterIndexSelect3:
	inc WaterTemperatueIndex	
	jmp EndT884734
EndT8847134:	
WaterIndexSelect4:
	mov	a,1
	mov	WaterTemperatueIndex,a	;from index 1	
		
EndT884734:	
	call	WriteWaterTankTempIndex
	ret
		
	
	


WriteWaterTankTempIndex:
	mov	a,46
	mov	Temp1,a ;write 46pp
	mov	a,WaterTemperatueIndex
	mov	Temp0,a
	call	WriteEeProm
	ret


WriteSeatTankTempIndex:
	mov	a,45
	mov	Temp1,a ;write 45pp
	mov	a,SeatTemperatueIndex
	mov	Temp0,a
	call	WriteEeProm
	ret


ReadSeatTankTempIndex:	
	mov	a,45
	mov	Temp1,a ;read 45pp
	call	ReadEeProm
	mov	a,Temp0
	mov	SeatTemperatueIndex,a
	ret
	
	

ReadWaterTankTempIndex:	
	mov	a,46
	mov	Temp1,a ;read 46pp
	call	ReadEeProm
	mov	a,Temp0
	mov	WaterTemperatueIndex,a
	ret

Read_In_Back_Wash:	
	mov	a,57
	mov	Temp1,a ;read 57pp
	call	ReadEeProm
	snz Temp0.0
	jmp HiT994887
	set In_Back_Wash
	clr In_Front_Wash
	jmp EndT453435
HiT994887:
	clr In_Back_Wash
	set In_Front_Wash
	jmp EndT453435

EndT453435:
	ret	
		
Write_In_BackOrFront_Wash:	
	mov	a,57
	mov	Temp1,a ;write 57pp
	set Temp0.0
	snz In_Back_Wash
	clr Temp0.0
	call	WriteEeProm	

	ret	
			
	
	


	
ReadSettedBackPosition:	
	mov	a,1
	mov	Temp1,a ;read 1pp
	call	ReadEeProm
	mov	a,Temp0
	mov	SettedBackPosition,a
	
	mov	a,39
	mov	Temp1,a ;read 39pp
	call	ReadEeProm
	mov	a,Temp0
	
	sz Temp0.0
	set	SettedBackPositionDir
	snz Temp0.0
	clr	SettedBackPositionDir		

	ret	
	

	
ReadSettedFrontPosition:	
	mov	a,0
	mov	Temp1,a ;read 0pp
	call	ReadEeProm
	mov	a,Temp0
	mov	SettedFrontPosition,a
	
	mov	a,38
	mov	Temp1,a ;read 38pp
	call	ReadEeProm
	mov	a,Temp0
	
	sz Temp0.0
	set	SettedFrontPositionDir
	snz Temp0.0
	clr	SettedFrontPositionDir		
	
	
	ret	

	
ReadSettedBackPositionS:	
	mov	a,32
	mov	Temp1,a ;read 32pp
	call	ReadEeProm
	mov	a,Temp0
	mov	SettedBackPositionS,a
	
	mov	a,37
	mov	Temp1,a ;read 37pp
	call	ReadEeProm
	mov	a,Temp0
	
	sz Temp0.0
	set	SettedBackPositionDirS
	snz Temp0.0
	clr	SettedBackPositionDirS		
	
	
	ret			


	
ReadSettedFrontPositionS:	
	mov	a,31
	mov	Temp1,a ;read 31pp
	call	ReadEeProm
	mov	a,Temp0
	mov	SettedFrontPositionS,a
	
	mov	a,33
	mov	Temp1,a ;read 33pp
	call	ReadEeProm
	mov	a,Temp0
	
	sz Temp0.0
	set	SettedFrontPositionDirS
	snz Temp0.0
	clr	SettedFrontPositionDirS		
	
	
	ret			



ReadLastSettingFromEeprom:
	

	mov	a,15
	lmov	Temp1,a ;read 15
	call	ReadEeProm
	mov	a,Temp0	
	xor	a,034h				;034h means not new eeprom
	snz	z
	jmp	FirstManufacture
	mov	a,16
	mov	Temp1,a ;read 16
	call	ReadEeProm
	mov	a,Temp0	
	xor	a,043h				;043h means not new eeprom
	sz	z
	jmp	HasInitialedBefore
FirstManufacture:
	mov	a,15
	lmov	Temp1,a ;read 15
	mov	a,034h				;034h means not new eeprom	
	mov	Temp0,a		
	call	WriteEeProm

	mov	a,16
	mov	Temp1,a ;read 16
	mov	a,043h				;034h means not new eeprom	
	mov	Temp0,a		
	call	WriteEeProm
	
	call	ResetToDefaultSetting
	ret
	
HasInitialedBefore:

	call	ReadSettedFrontPosition
	call	ReadSettedBackPosition

	call	ReadWaterTankTempIndex
	call	ReadSeatTankTempIndex	
	
	call	ReadSettedFrontPositionS
	call	ReadSettedBackPositionS
	call  Read_In_Back_Wash

	ret

	
	


ResetToDefaultSetting:

	mov	a,3
	mov	WaterTemperatueIndex,a	
	mov	a,3
	mov	SeatTemperatueIndex,a		
	

	
	clr	SettedFrontPositionDir
	mov	a,FrontLevelMiddle_c_4
	mov SettedFrontPosition,a	;wwwwww
	
	clr	SettedBackPositionDir
	mov	a,BackLevelMiddle_c_8
	mov SettedBackPosition,a


	mov	a,Front_3_pfs4_13
	mov	SettedFrontPositionS,a ;11
	mov	a,Back_3_ps4_3
	mov	SettedBackPositionS,a	
	
	



;;;;;

	call	WriteSettedFrontPosition	
	call	WriteSettedBackPosition
	call	WriteSettedFrontPositionS	
	call	WriteSettedBackPositionS	

	
	call	WriteWaterTankTempIndex
	call	WriteSeatTankTempIndex
	call	Write_In_BackOrFront_Wash		



	mov	a,15
	mov	Temp1,a ;write 15pp
	mov	a,034h
	mov	Temp0,a
	call	WriteEeProm	



	mov	a,16
	mov	Temp1,a ;write 16pp

	mov	a,043h
	mov	Temp0,a
	call	WriteEeProm	


	
	ret


	
	
	
	
	
	
	
	
	
SetBackWaterLevelT999893:

	mov	a,TableWaterLevelPosition
	add a,SettedBackPosition 
	mov	tblp,A	

	tabrd SettedBackPosition
	mov	a,SettedBackPosition
	and a,00111111b
	mov	SettedBackPosition,a	

	call	WriteSettedBackPosition		
	
	ret

SetFrontWaterLevelT999893:

	mov	a,TableWaterLevelPosition
	add a,SettedFrontPosition 
	mov	tblp,A	

	tabrd SettedFrontPosition
	mov	a,SettedFrontPosition
	and a,00111111b
	mov	SettedFrontPosition,a	


	call	WriteSettedFrontPosition	

	ret


;;;ooopppppllllll

WriteSettedBackPositionS:
	mov	a,32
	mov	Temp1,a ;write 32pp
	mov	a,SettedBackPositionS
	mov	Temp0,a
	call	WriteEeProm
	
	mov	a,37
	mov	Temp1,a ;write 37pp
	sz SettedBackPositionDirS
	set	Temp0.0
	snz SettedBackPositionDirS
	clr	Temp0.0	
	call	WriteEeProm		
		
	
	ret

WriteSettedFrontPositionS:
	mov	a,31
	mov	Temp1,a  ;write 31pp
	mov	a,SettedFrontPositionS
	mov	Temp0,a
	call	WriteEeProm
	mov	a,33
	mov	Temp1,a  ;write 33pp
	sz SettedFrontPositionDirS
	set	Temp0.0
	snz SettedFrontPositionDirS
	clr	Temp0.0	
	call	WriteEeProm		
	
	
	ret


WriteSetSnAlready:
	mov	a,67
	mov	Temp1,a  ;write 67pp
	mov	a,034h
	mov	Temp0,a
	call	WriteEeProm
	mov	a,68
	mov	Temp1,a  ;write 68pp
	mov	a,056h
	mov	Temp0,a	
	call	WriteEeProm		
		
	ret




WriteEeProm:


	clr	wdt


	MOV A, 040H ; setup memory pointer mp1l
	MOV mp1l, A ; mp1l points to EEC register

	clr iar1.4
	mov	a,Temp1
	mov	eea,A
	mov	a,Temp0
	mov	eed,a
	clr EMI	

	SET IAR1.3 ; set WREN bit, enable write operations
	SET IAR1.2 ; Start Write Cycle - set WR bit - executed immediately
	; after set WREN bit
	set EMI	
BACK33:
	SZ IAR1.2 ; check for write cycle end
	JMP BACK33
	CLR IAR1 ; disable EEPROM read/write

	ret


ReadEeProm:



	clr	wdt

	;clr	emi


	MOV A, 040H ; setup memory pointer mp1l
	MOV mp1l, A ; mp1l points to EEC register

	clr iar1.4
	mov	a,Temp1
	mov	eea,A
			
	SET IAR1.1 ; set RDEN bit, enable read operations
	SET IAR1.0 ; start Read Cycle - set RD bit
BACK66:
	SZ IAR1.0 ; check for read cycle end
	JMP BACK66
	CLR IAR1 ; disable EEPROM read/write

	
	MOV A, eed ; move read data to register
	mov	Temp0,a

	;set	emi
	
	ret




WriteSettedBackPosition:
	mov	a,1
	mov	Temp1,a ;write 1pp
	mov	a,SettedBackPosition
	mov	Temp0,a
	call	WriteEeProm
	mov	a,39
	mov	Temp1,a  ;write 39pp
	sz SettedBackPositionDir
	set	Temp0.0
	snz SettedBackPositionDir
	clr	Temp0.0	
	call	WriteEeProm		

	ret


;;;oooppppp




WriteSettedFrontPosition:
	mov	a,0
	mov	Temp1,a ;write 0pp
	mov	a,SettedFrontPosition
	mov	Temp0,a
	call	WriteEeProm
	mov	a,38
	mov	Temp1,a  ;write 38pp
	sz SettedFrontPositionDir
	set	Temp0.0
	snz SettedFrontPositionDir
	clr	Temp0.0	
	call	WriteEeProm		
	


	ret

Delay300ms:
	mov	a,250
	call DelayXms
	mov	a,250
	call DelayXms
	ret

PowerOnLedTest:
	CALL ClearAllLed
	call Delay300ms
	
	snz MassProductionPin_Bit_
	 ret
	
	
	clr PowerLedOffT3 ;PowerOnLedTest
	call Delay300ms
	CALL ClearAllLed	
	set WaterLevel_1
	set SeatTemp3	
	call Delay300ms
		CALL ClearAllLed
	set WaterLevel_2
	set SeatTemp2	
	set PowerLedOffT3 ;PowerOnLedTest		
	call Delay300ms
		CALL ClearAllLed
	set WaterLevel_3
	set SeatTemp1			
	call Delay300ms
		CALL ClearAllLed
	set WaterTemp1
	set WaterTemp3	
	call Delay300ms
		CALL ClearAllLed
	set WaterTemp2	
	call Delay300ms
		CALL ClearAllLed
	set WaterLevel_1	
	set WaterLevel_2	
	set WaterLevel_3	
	set WaterTemp1
	set WaterTemp3
	set WaterTemp2
	set SeatTemp1
	set SeatTemp2	
	set SeatTemp3		
	clr PowerLedOffT3 ;PowerOnLedTest		
	call Delay300ms
	call Delay300ms	
	CALL ClearAllLed

	ret


;;;kkkkkkk

Startt0:

	

	clr WDT
	clr EMI
	
	mov	a,30
	mov	SmallAreaCounter,a	
	clr pbc.0

LoopT55343:
	
	sz SmallAreaCounter.0
	set pb0
	snz SmallAreaCounter.0	
	clr pb0
		
;;66 ms
	mov	a,250
	mov	Temp0,a 
DelayT01:	
	mov	a,200
	mov	Temp1,a
DelayT00:
	nop
	sdz	Temp1
	jmp	DelayT00
	clr	wdt	
	sdz	Temp0
	jmp	DelayT01	
	

	;sdz SmallAreaCounter
	;jmp LoopT55343

	call InitIo
	clr PB0


	
	call SystemClockConfigure_
	
	mov	a,057h
	mov	wdtc,A
	nop
	nop
	nop
	nop
	nop
	nop	
	

	call InitIo
	
	call InitAdc


	mov	a,1
	mov	mp1h,A
	mov	a,2
	mov	mp2h,A	
	
	
	call InitRam
	

	set PreMassProductionPin
	set MassProductionPin_Bit_	

		
	mov	a,1
	mov	Timer50ms,A	
	mov	Timer500ms,A	
	
	mov	a,1
	mov	mp1h,A
	mov	a,2
	mov	mp2h,A	
	
	mov	a,0fh
	mov	tbhp,a	


	set KeyLedScan1
	set KeyLedScan2
	set KeyLedScan3	
	set KeyLedScan4	
	mov	a,2
	mov	KeyMutiPlex,A
	
	
	
	call ClearAllLed
	set PC4
	mov	a,1
	mov	KeyTimer,A
	mov	LongKeyTimer,A	
	mov	KeyCode,A
	

	mov	a,60
	mov	LedKeepAlive,A		
	mov a,40
	mov	Timer2s,A ;must init at 40


	mov	a,100
	call DelayXms
	call InitTb
	;set SpiCsPin
	;set SpiMoSiPin
	;set SpiClkPin
	
	set emi
	
	
	clr WDT
	mov	a,75
	call DelayXms	

	call	Bc5602Init_T9



	mov	a,3
	call DelayXms
	
	mov	a,0
	mov	LedPhaseForMassProduction,a
	

	;for goto halt
	clr KeyTimer	
	clr LongKeyTimer
	clr WaitKeyRelease
	clr TxCycles

	
	
Sn2Position	equ 1
Sn1Position	equ 2
Sn0Position	equ 3
WaterSeatTempPosition equ 4
FrontBackWaterLevelPosition equ 5
FrontBackMovePosition equ 6
KeySwitchCodePosition	equ 8

CheckSumPosition	equ 10


	clr wdt


		
	call	ReadLastSettingFromEeprom
	
	mov	a,0
	mov	TBLP,A
	tabrd Sn2 

	mov	a,1
	mov	TBLP,A
	tabrd Sn1 

	mov	a,2
	mov	TBLP,A
	tabrd Sn0 	

	mov	a,100
	call DelayXms
	
	clr BatteryLow
	set BatSpecAtPowerOn
	call TestBatteryLow
	clr BatSpecAtPowerOn
	

	snz BatteryLow		
	jmp NotPowerOnBatLowT66
	

	
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex

	jmp NotPowerOnLedTest
	
	
	
NotPowerOnBatLowT66:	
	call PowerOnLedTest
NotPowerOnLedTest:


;;;;;;;;;;;;;;;;;;;;;		
		
MainLp:

			
	call CheckHaltCondition



	clr wdt
	call	KeyScan
 	snz C
 	jmp NoKeyIn


	mov	a,FirstTenKeyCountsForMassProd
	sub a,14
	snz c
	inc FirstTenKeyCountsForMassProd
	

	call BC5602InterfaceConfigure
	set SpiMoSiPin
	mov	a,25
	call DelayXms
	clr SpiMoSiPin
	mov	a,25
	call DelayXms
	set SpiMoSiPin
	mov	a,25
	call DelayXms
	clr SpiMoSiPin
	mov	a,2
	call DelayXms


	



	call Bc5602Init_T9
		
	
	
	mov	a,60	
	
	mov	LedKeepAlive,A
	


	;call SetSwitchCodeT55
	
	

	sz FirstKeyCodeBeGotBefore
	jmp CanWorkNow
	set FirstKeyCodeBeGotBefore
	mov	a,KeyCode
	xor	a,7
	sz	Z
	jmp WorkImmediatly
	mov	a,KeyCode
	xor	a,5
	sz	Z
	jmp WorkImmediatly	
	mov	a,KeyCode
	xor	a,3
	sz	Z
	jmp WorkImmediatly
	mov	a,KeyCode
	xor	a,1
	sz	Z
	jmp WorkImmediatly	
	mov	a,KeyCode
	xor	a,8
	sz	Z
	jmp WorkImmediatly	
		
	jmp OnlyWakeUp


WorkImmediatly:
CanWorkNow:
	mov	a,KeyCode
	xor	a,1
	snz	Z
	jmp	CheckKey2
	
Key1_: ;sw4	water level
	;this key change to massage key

	jmp	KeyTaskEnd
	
CheckKey2:
	mov	a,KeyCode
	xor	a,2
	snz	Z
	jmp	CheckKey3
Key2_:	;no this key
	
	jmp	KeyTaskEnd
	
CheckKey3:
	mov	a,KeyCode
	xor	a,3
	snz	Z
	jmp	CheckKey4
Key3_:	;sw3 front wash
	set ShowWaterLevelT3
	sz In_Front_Wash
	jmp NoChangeT9983

	set In_Front_Wash
	clr In_Back_Wash
	call Write_In_BackOrFront_Wash	
	jmp	KeyTaskEnd	
NoChangeT9983:		
		
	call SetFrontWaterLevelT999893			
	jmp	KeyTaskEnd
	
CheckKey4:
	mov	a,KeyCode
	xor	a,4
	snz	Z
	jmp	CheckKey5
Key4_:	;sw7 seat temp

	call SetTheSeatTemperatueLevel

	jmp	KeyTaskEnd
	
CheckKey5:
	mov	a,KeyCode
	xor	a,5
	snz	Z
	jmp	CheckKey6
Key5_:	;sw2 BACK wash
	set ShowWaterLevelT3
	sz In_Back_Wash
	jmp NoChangeT9983bb

	set In_Back_Wash
	clr In_Front_Wash
	call Write_In_BackOrFront_Wash	
	jmp	KeyTaskEnd	

NoChangeT9983bb:		
			
	call SetBackWaterLevelT999893			

	jmp	KeyTaskEnd
	
CheckKey6:
	mov	a,KeyCode
	xor	a,6
	snz	Z
	jmp	CheckKey7
Key6_:	;sw6 water temp

	call SetTheWaterTemperatueLevel
	jmp	KeyTaskEnd
	
CheckKey7:
	mov	a,KeyCode
	xor	a,7
	snz	Z
	jmp	CheckKey8
Key7_:	;sw1 STOP Key


	clr ShowWaterLevelT3
 clr In_Front_Wash
 clr In_Back_Wash
	jmp	KeyTaskEnd
	
CheckKey8:
	mov	a,KeyCode
	xor	a,8
	snz	Z
	jmp	CheckKey9
Key8_: ;sw5 MOVE key

	;call SetThe_S_Position	

	jmp	KeyTaskEnd
	
CheckKey9:
	mov	a,KeyCode
	xor	a,9
	snz	Z
	jmp	KeyTaskEnd
Key9_:	; long key of back wash ( auto clean head )

	
	jmp	KeyTaskEnd

;	org org3
KeyTaskEnd:
	
OnlyWakeUp:		

	call SetSwitchCodeT55
		
	sz MassProductionPin_Bit_
	jmp NotT99088	
	
	jmp EndT554	
NotT99088:	
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
EndT554:	
	call SentThreeFreqTAsk
		
NoKeyIn:		


MainLp8p2ms:
	snz Flag8p2ms	
	jmp	MainLp
	
	clr Flag8p2ms
;;;;;;;;; Task 8ms
;;;;;;;;; Task 8ms
;;;;;;;;; Task 8ms
;;;;;;;;; Task 8ms

	sdz Timer50ms
	jmp	Not50ms
	mov a,6
	mov	Timer50ms,A
	
;;;;;;;;;;;;;;;;;;;;;;;;;;; task 50 ms	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;; task 50 ms
	snz MassProductionPin_Bit_
	jmp NotT9908844223

	sz LedKeepAlive
	dec LedKeepAlive
	
NotT9908844223:	
;;;;;;;;;;;;;;;;;;;;;;;;;;; task 50 ms
	sz BatLowAtLeastTimeForLed
	dec BatLowAtLeastTimeForLed

;;;;;;;;;;;;;;;;;;;;;;;;;;; task 50 ms
	mov	a,FirstTenKeyCountsForMassProd
	sub a,12
	snz c
	jmp CanAcceptT009
	clr	ConTinuePressTimeT989 ;if oveer 10 ==> not accept
	
CanAcceptT009:




;;;;;;;;;;;;;;;;;;;;;;;;;;; task 50 ms
	sz StartCheckTriger
	jmp AddOneT554
	clr ConTinuePressTimeT989
	set StartCheckTriger
	jmp EndT99999332
AddOneT554:
	inc ConTinuePressTimeT989
	mov	a,ConTinuePressTimeT989
	xor a,40
	snz Z
	jmp NotT000900
	call	ResetToDefaultSetting	
	clr MassProductionPin_Bit_
	clr ConTinuePressTimeT989
	mov	a,0
	mov	FirstTenKeyCountsForMassProd,a	
NotT000900:	
EndT99999332:

;;;;;;;;;;;;;;;;;;;;;;; task 500 ms    


	sdz Timer500ms
	jmp	Not500ms
	mov a,10
	mov	Timer500ms,A
	

	sz BlockPowerLedLit
	jmp PowerLedOffT889

NotBlockT99:
	snz BatteryLow ;for power led task
	jmp	PowerLedOnT889

	sz PowerLedOffT3 ;flash for battery low
	jmp PowerLedOnT889

PowerLedOffT889:	
	set PowerLedOffT3		;normal off		
	jmp EndT888732255	
	
PowerLedOnT889:
	clr PowerLedOffT3		;normal on	
EndT888732255:	



	
;;;;;;;;;;;;;;;;;;;;;;; task 500 ms

	snz PreMassProductionPin
	jmp ItIsLowT999888
	sz MassProductionPin_Bit_
	jmp EndT99988887

	call InitAdc	
	mov	a,1
	mov	LedPhaseForMassProduction,a
	clr PreMassProductionPin
	jmp EndT99988887
ItIsLowT999888:
	snz MassProductionPin_Bit_
	jmp EndT99988887
	set PreMassProductionPin	
EndT99988887:


;;;;;;;;;;;;;;;;;;;;;;; task 500 ms

	sz MassProductionPin_Bit_
	jmp NotT9908844
	
	call TestBatteryLow	
	
	call ClearAllButPowerLed
	mov a,LedPhaseForMassProduction
	clr c
	rlca	LedPhaseForMassProduction
	mov	Temp0,A
	rlca	Temp0	
	
	addm a,PCL
	
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT9998778	
	
	set WaterLevel_3	
	set WaterTemp3	
	set SeatTemp3
	jmp EndT009999		
	
	set WaterLevel_3	
	set WaterTemp3	
	set SeatTemp3
	jmp EndT009999	
	
	set WaterLevel_2	
	set WaterTemp2	
	set SeatTemp2
	jmp EndT009999
	
	set WaterLevel_1 ;lll	
	set WaterTemp1	
	set SeatTemp1
	jmp EndT009999	
	
	nop	
	nop	
	nop
	jmp EndT009999	
	
	call LitAllButPowerLed	
	call LitAllButPowerLed	
	call LitAllButPowerLed	
	jmp EndT009999
	
	call LitAllButPowerLed	
	call LitAllButPowerLed	
	call LitAllButPowerLed	
	jmp EndT009999	
	nop	
	nop	
	nop
	jmp EndT009999	
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT009999		
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT009999		
		
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT009999	
		
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT009999	
	
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT009999	
		
	call LedShowWashLevel
	call LedShowWaterTempIndex
	call LedShowSeatTempIndex
	jmp EndT009999	
	
	
	
	
	
	
	jmp EndT0099995555
	jmp EndT0099995555
	jmp EndT0099995555	
	jmp EndT0099995555		
		
EndT0099995555:

	clr LedPhaseForMassProduction
	set MassProductionPin_Bit_	
	jmp EndT9998778
EndT009999:	
	inc LedPhaseForMassProduction
	
NotT9908844:
EndT9998778:


;;;;;;;;;;;;;;;;;;;;;;; task 500 ms
Not500ms:

;;;;;;;;;;;;;;;;;;;;;;;;;;; task 50 ms	

	sdz Timer2s
	jmp	Not2s
	mov a,40
	mov	Timer2s,A
	
	
;;;;;;;;;;;;;;;;;;;;;; task 2 secs






;;;;;;;;;;;;;;;;;;;;;; task 2 secs
;;;;;;;;;;;;;;;;;;;;;; task 2 secs
Not2s:


Not50ms:

;;;;;;;;; Task 8ms
	
	
	
	
	
	jmp	MainLp	
	
	
;	org org4
LedShowWashLevel:


	snz ShowWaterLevelT3
	jmp	NoT5433255

ShowT666555:
	mov	a,SettedBackPosition ;led
	snz In_Back_Wash
	mov	a,SettedFrontPosition	
	
	
	add a,TableWaterLevelLEd
	mov tblp,a
	tabrd Temp1
	mov	a,Temp1
	and a,00111111b
	mov	Temp1,a

	
	mov	a,Temp1
	addm a,PCL
	jmp LitOneT33244
	jmp LitTwoT33244	
	jmp LitThreeT33244
	
LitThreeT33244:


	set WaterLevel_1	
	set WaterLevel_2	
	set WaterLevel_3
	jmp EndT000904
LitTwoT33244:
		
	set WaterLevel_1	
	set WaterLevel_2	
	clr WaterLevel_3
	jmp EndT000904	
LitOneT33244:

		
	set WaterLevel_1	
	clr WaterLevel_2	
	clr WaterLevel_3
	jmp EndT000904	
		
EndT000904:	
		
	ret	
NoT5433255:
	clr WaterLevel_1	
	clr WaterLevel_2	
	clr WaterLevel_3
	ret
	

	
LedShowWaterTempIndex:
	mov	a,WaterTemperatueIndex
	addm a,PCL
	jmp ClrT332445	
	jmp ClrT332445	
	jmp LitOneT332445
	jmp LitTwoT332445	
	jmp LitThreeT332445
	
ClrT332445:	
	clr WaterTemp1	
	clr WaterTemp2	
	clr WaterTemp3
	jmp EndT0009045	
	
LitThreeT332445:
	set WaterTemp1	
	set WaterTemp2	
	set WaterTemp3
	jmp EndT0009045
LitTwoT332445:		
	set WaterTemp1	
	set WaterTemp2	
	clr WaterTemp3
	jmp EndT0009045	
LitOneT332445:		
	set WaterTemp1	
	clr WaterTemp2	
	clr WaterTemp3
	jmp EndT0009045		
	
EndT0009045:
	
	ret		
LedShowSeatTempIndex:
	mov	a,SeatTemperatueIndex
	addm a,PCL
	jmp ClrT3324456	
	jmp ClrT3324456	
	jmp LitOneT3324456
	jmp LitTwoT3324456	
	jmp LitThreeT3324456
	
ClrT3324456:	
	clr SeatTemp1	
	clr SeatTemp2	
	clr SeatTemp3
	jmp EndT00090456	
	
LitThreeT3324456:
	set SeatTemp1	
	set SeatTemp2	
	set SeatTemp3
	jmp EndT00090456
LitTwoT3324456:		
	set SeatTemp1	
	set SeatTemp2	
	clr SeatTemp3
	jmp EndT00090456	
LitOneT3324456:		
	set SeatTemp1	
	clr SeatTemp2	
	clr SeatTemp3
	jmp EndT00090456		
	
EndT00090456:	
	
	ret		




IncBatteryLowTimes:
	snz MassProductionPin_Bit_
	jmp MassProductionT88

	inc	BatteryLowTimes
	mov	a,BatteryLowTimes
	xor	a,3
	snz	z
	jmp	NotTimeOutT889

	dec	BatteryLowTimes
	
	
	set	BatteryLow

NotTimeOutT889:
	ret
	
MassProductionT88:	
	set	BatteryLow
	mov a,20 ;at least hold 1 secs 	
	mov	BatLowAtLeastTimeForLed,a   ;;the LED will flash at least 
	ret	

ResetBatteryLow:
	clr	BatteryLowTimes	
	clr	BatteryLow	
	ret


TestBatteryLow:

 
	call	AdSub

	mov	a,sadoL
	;mov	WaterTankTempLowByte,a	;affect Heater ON/Off, 
	mov	SmallAreaVar0,a	;affect Heater ON/Off,
	mov	BatValue0,a	
	mov	a,sadoh
	and	a,00001111b
	mov	SmallAreaVar1,a	
	mov	BatValue1,a
	
	snz BatSpecAtPowerOn
	jmp NormalTimeT4434
	mov	a,SmallAreaVar0
	sub a,low 0920h
	mov	a,SmallAreaVar1
	sbc a,high 0920h
	sz C
	jmp NotBatLowT999343	

	mov	a,5
	mov BatteryLowTimes,a
	set BatteryLow
	jmp LowOnceT887	
NormalTimeT4434:	
	mov	a,SmallAreaVar0
	sub a,low 0848h
	mov	a,SmallAreaVar1
	sbc a,high 0848h	
	
	sz C
	jmp NotBatLowT999343

LowOnceT887:

	call IncBatteryLowTimes
	jmp EndT44222
			
			
			
NotBatLowT999343:
	snz MassProductionPin_Bit_
	jmp MassProductionT882
	call ResetBatteryLow
	jmp EndT44222
MassProductionT882:	
	clr BatteryLow
	jmp EndT44222
	
EndT44222:				
	ret
	


AdSub:

;StartConvert(void)	
  clr emi
	clr	start

	set 	start

	nop
	nop
			
	clr	start

WaitConvert2:
	sz	adbz
	jmp WaitConvert2


;;AdrhPlusAdrl(void)
	
	;TempShort0 = _adrh * 256 + _adrl;
 set emi
	ret

InitAdc:

	set adrfs		;format is b11-b8, b7-b0
				;not b11-b4, b3-b0
	set	SACKS2 ;fsys = 8MHz, 8uS 
	set	SACKS1
	clr	SACKS0	
	
	clr SAINS3	;read avdd/4
	clr SAINS2	
	set SAINS1	
	set SAINS0
	
	set VBGREN		
	set ADPGAEN	
	set PGAIS
	set SAVRS1	;use internal PGA output as VREF
	
	clr pgags1
	clr pgags0	
	
	set	ADCEN
	
	
 clr NoMoreTestAdc
 
	ret

	
	
SentThreeFreqTAsk:
	clr NoMoreTestAdc
		mov	a,009h
	call BC5602SendAaByte ;flush Tx 		


		mov	a,Mp1DataOutBuffer__
		mov	mp1l,a
		mov	a,011h ;the header of write payload
		mov	iar1,A
			
		mov	a,Mp1DataOutBuffer__
		add a,Sn2Position
		mov	mp1l,a
		mov	a,Sn2
		mov	iar1,A	
		mov	a,Mp1DataOutBuffer__
		add a,Sn1Position
		mov	mp1l,a
		mov	a,Sn1
		mov	iar1,A
		mov	a,Mp1DataOutBuffer__
		add a,Sn0Position ;;set sn0 sn1 sn2 when send RF
		mov	mp1l,a
		mov	a,Sn0  ;;set sn0 sn1 sn2 when send RF
		mov	iar1,A
	
		swapa WaterTemperatueIndex
		mov	Temp0,A
		mov	a,SeatTemperatueIndex
		orm	a,Temp0				
		mov	a,Mp1DataOutBuffer__
		add a,WaterSeatTempPosition
		mov	mp1l,a
		mov	a,Temp0
		mov	iar1,A				
				
									
		swapa SettedFrontPosition
		mov	Temp0,A
		mov	a,SettedBackPosition
		orm	a,Temp0				
		mov	a,Mp1DataOutBuffer__
		add a,FrontBackWaterLevelPosition
		mov	mp1l,a
		mov	a,Temp0
		mov	iar1,A	



		swapa SettedFrontPositionS
		mov	Temp0,A
		mov	a,SettedBackPositionS
		orm	a,Temp0				
		mov	a,Mp1DataOutBuffer__
		add a,FrontBackMovePosition
		mov	mp1l,a
		mov	a,Temp0
		mov	iar1,A	
			
		mov	a,Mp1DataOutBuffer__
		add a,KeySwitchCodePosition
		mov	mp1l,a
		mov	a,SwitchCode
		mov	iar1,A	
	

		;set the check sum
		mov	a,8
		mov	Temp1,a
		mov	a,Mp1DataOutBuffer__
		add a,1
		mov	mp1l,a
		mov	a,IAR1
LoopT55435:		
		inc mp1l
		add	a,IAR1
		sdz Temp1
		jmp LoopT55435

		inc MP1L
		mov	iar1,a
		
	
	
	
		
NormalAccessAddr:	
		
	mov	a,12

	mov	TxCycles,A


LoopT88934:	

	
	clr wdt
		mov	a,TestChannelHi
		mov	TestChannel,a	
		
		call SendOneTx
		



WaitT554:	;this is IRQ of TX -- if no IRQ --means TEST FIXTRE failue
	snz Pc5_RfIrq
	
	jmp	GotIrqT4416	
	jmp WaitT554
GotIrqT4416:	

	call SetTheIrqToHigh

		
		
NextT332:	
	
	
		mov	a,TestChannelMiddle
		mov	TestChannel,a	

		
		call SendOneTx

WaitT55422:	;this is IRQ of TX -- if no IRQ --means TEST FIXTRE failue
	snz Pc5_RfIrq
	
	jmp	GotIrqT441622	
	jmp WaitT55422
GotIrqT441622:	

	
	
	call SetTheIrqToHigh

NextT332233:	
	
	
		mov	a,TestChannelLow
		mov	TestChannel,a	


		
		call SendOneTx
		
	
	sz NoMoreTestAdc
	jmp NoMoreT444
	set NoMoreTestAdc
	sz BatLowAtLeastTimeForLed
 jmp WaitOneCycleEndT009
	call TestBatteryLow
WaitOneCycleEndT009:	

	call Delay10us
	call Delay10us	
	call Delay10us	
	call Delay10us	
	call Delay10us	
	call Delay10us	
	
	
 		mov a,BatValue1
		mov	Temp2,a		
		mov	a,0e0h							
		call	BC5602WriteRegister ;calibration
 		mov a,BatValue0
		mov	Temp2,a		
		mov	a,0e0h							
		call	BC5602WriteRegister ;calibration
	
NoMoreT444:	
	

		
		

WaitT554223:	;this is IRQ of TX -- if no IRQ --means TEST FIXTRE failue
	snz Pc5_RfIrq
	
	jmp	GotIrqT4416223	
	jmp WaitT554223
GotIrqT4416223:	


	call SetTheIrqToHigh


	
NextT332333:	
	
	sdz TxCycles	
	jmp	LoopT88934
	

		mov	a,10
		call DelayXms

OkPass:	


	ret

SetTheIrqToHigh:

		mov	a,0c4h
		call	BC5602ReadRegister	;;CONFIG_REGS_0

 and a,10000000b
		
		or	a,070h
		mov	Temp2,a		
		mov	a,044h							
		call	BC5602WriteRegister		;;	
		ret			

		
TriggerRecT9:

	ret									
	
	
PutTheRollingCode:
	
		ret

	
	
CompareRollingCode:

		ret		
	
	
		
	

	;org org5
	
GetMultiBytesData0:
	mov	Temp0,a
	clr c
	rlca SmallAreaCounter1
	addm a,pcl
	nop 
	nop
	mov	a,MultiBytesT6_1
	jmp	EndT544563f
	mov	a,MultiBytesT6_2
	jmp	EndT544563f	
	mov	a,MultiBytesT6_3
	jmp	EndT544563f	
	mov	a,MultiBytesT6_4
	jmp	EndT544563f		
	mov	a,MultiBytesT6_5
	jmp	EndT544563f		
	mov	a,MultiBytesT6_6
	jmp	EndT544563f		

EndT544563f:	
	add	a,Temp0
	mov	tblp,a
	
	mov	a,00eh
	mov	tbhp,a
	
	tabrd	Temp0

	mov	a,TBLH

	mov	TEmp2,a
	mov	a,00fh
	mov	tbhp,a
	
	mov	a,Temp0

	ret


GetTableData0:
	mov	Temp0,a
	clr c
	rlca SmallAreaCounter1
	addm a,pcl
	nop 
	nop
	mov	a,BC5602RegsSetup
	jmp	EndT544563
	mov	a,BC5602RegsSetup2
	jmp	EndT544563	
	mov	a,BC5602RegsSetup3
	jmp	EndT544563	
	mov	a,BC5602RegsSetup4
	jmp	EndT544563	
	mov	a,BC5602RegsSetup5
	jmp	EndT544563	
	mov	a,BC5602RegsSetup6
	jmp	EndT544563	
	mov	a,BC5602RegsSetup7
	jmp	EndT544563	
	mov	a,BC5602RegsSetup8
	jmp	EndT544563	
	mov	a,BC5602RegsSetup9
	jmp	EndT544563	
	mov	a,BC5602RegsSetup10
	jmp	EndT544563	
	mov	a,BC5602RegsSetup11
	jmp	EndT544563	
	mov	a,BC5602RegsSetup12
	jmp	EndT544563	
	mov	a,BC5602RegsSetup13
	jmp	EndT544563	
	mov	a,BC5602RegsSetup14
	jmp	EndT544563	
	mov	a,BC5602RegsSetup15
	jmp	EndT544563	
	mov	a,BC5602RegsSetup16
	jmp	EndT544563	
	mov	a,BC5602RegsSetup17
	jmp	EndT544563	
	mov	a,BC5602RegsSetup18
	jmp	EndT544563	
	mov	a,BC5602RegsSetup19
	jmp	EndT544563	
	mov	a,BC5602RegsSetup20
	jmp	EndT544563	
	mov	a,BC5602RegsSetup21
	jmp	EndT544563
	mov	a,BC5602RegsSetup22
	jmp	EndT544563	
	mov	a,BC5602RegsSetup23
	jmp	EndT544563	
	mov	a,BC5602RegsSetup24
	jmp	EndT544563	
	mov	a,BC5602RegsSetup25
	jmp	EndT544563		
	mov	a,BC5602RegsSetup26
	jmp	EndT544563		
	mov	a,BC5602RegsSetup27
	jmp	EndT544563		
	mov	a,BC5602RegsSetup28
	jmp	EndT544563		
	mov	a,BC5602RegsSetup29
	jmp	EndT544563		
	mov	a,BC5602RegsSetup30
	jmp	EndT544563	
	mov	a,BC5602RegsSetup31
	jmp	EndT544563	
	mov	a,BC5602RegsSetup32
	jmp	EndT544563	
	mov	a,BC5602RegsSetup33
	jmp	EndT544563	
	mov	a,BC5602RegsSetup34
	jmp	EndT544563	
	mov	a,BC5602RegsSetup35
	jmp	EndT544563	
	mov	a,BC5602RegsSetup36
	jmp	EndT544563	
	mov	a,BC5602RegsSetup37
	jmp	EndT544563	
	mov	a,BC5602RegsSetup38
	jmp	EndT544563	
	mov	a,BC5602RegsSetup39
	jmp	EndT544563	
	mov	a,BC5602RegsSetup40
	jmp	EndT544563	
	mov	a,BC5602RegsSetup41
	jmp	EndT544563		

EndT544563:	
	add	a,Temp0
	mov	tblp,a
	
	mov	a,0eh
	mov	tbhp,a

	
	tabrd	Temp2

	mov	a,0fh
	mov	tbhp,a
	
	mov	a,tblh


	ret



	org 0e00h	

aa0: 
	dw 00ch ;;light sleep mode
aa1: 
	dw 008h	;;soft rset
aa2: 
	dw 020h	;set register bank0	

BC5602RegsSetup:
		dw  04700h, 048b9h, 0ffffh
		
		dw  0c1ffh ;read "090h
		
BC5602RegsSetup34:		

		dw 04000h, 04200h, 04d20h, 04f14h
		dw 05845h, 07815h, 07910h, 07b9ah, 04001h
		dw 065cch, 0664ch, 06780h, 04002h, 06d18h
		dw 06eech, 0780ah, 07912h, 07b94h, 07c43h
		dw 04040h, 0ffffh   
bb_5_:
		dw 00ch ;light sleep mode
BC5602RegsSetup2:
		dw 04e03h, 0ffffh
		
		dw 0d1ffh ;"reead "0c0h"
		
BC5602RegsSetup3:		
		dw  0ffffh
		
		dw 0c9ffh ;read "020h
BC5602RegsSetup35:		
				
		dw 0ffffh
cc:
		dw 022h ;set register bank 2
BC5602RegsSetup4:
		dw 074dfh, 0752fh, 0ffffh		
dd_4_:
		dw 020h		;set register bank0

		dw 0c3ffh  ;read a "00"
		
BC5602RegsSetup5:		
		dw 04300h, 0ffffh 	
		;dw 04301h, 0ffffh 		
MultiBytesT6_1:
		dw 010h, 0ffh, 0dch, 000h, 0b0h, 000h, 0ffffh ;set prx address;MultiBytesT6_1

		dw 0f7ffh ;read a "03" -- pipe1 pipe0 active
		
		dw 0f2ffh ;read a "3f" -- pipe5~0 all auto ack

BC5602RegsSetup6:		
		dw 07700h, 07201h, 0ffffh
		
		dw	0d1ffh ;read a "c1"
BC5602RegsSetup7:		
		dw 06b04h, 06a01h, 05310h, 0ffffh
		
		dw 0f7ffh ; read a "00" --- all pipe not active
		dw 0f2ffh ;read a "00" --- all pipe not auto ack
		
BC5602RegsSetup8:		
		dw 07701h, 07201h, 0ffffh	
					
ee_4_:
		dw 009h		;tx flush	
ff_4_:
		dw 089h			;rx flush
	

		dw 0c4ffh ;read a "0e" ---read irq ==
		;;!X RX_DR TX_DS MAX_RT RX_P_NO[2:0] TX_FULL
		;; bit6:RX_DR have rx data
		;; bit5: Tx data is send
		;; bit4: all preset Tx is finished 	
		;; bit3~1 pipe number of RX in
		;; bit0: Tx buffer is full
		
BC5602RegsSetup9:		
		dw 07815h, 0ffffh
		
		dw 0c1ffh ;read a "30"  == 
		;; Xtal status
		;; bit7: cold power on bit == let user decide ==need auto calibration when power on
		;; bit6: system clock is ready
		;; bit5: clock is ready
		;; bit4: clock enable
		;; bit3~2: clock divider
		;; bit1: system clock enable
		;; bit0: low voltage reset
		
BC5602RegsSetup10:		
		dw 05500h, 0ffffh
		
		dw 0c3ffh ;read a "00"
		;int mask setting
		;bit6: mask rx int
		;bit5: mask tx int
		;bit4; mask MAX tx int
		;bit0: Rx/Tx ********
		;	
BC5602RegsSetup11:		
		;dw 04301h, 0ffffh ;set to RX mode
		dw 04301h, 0ffffh ;set to RX mode	
gg_4_:
		dw 089h	;flush RX
BC5602RegsSetup12:	
		dw 05501h ;set "CE" pin to hi
		dw 0ffffh
		
Read1:	dw 0e6ffh ;  read a "06"
	;;;;;;;; break
;;initial end ======
;;=========================	

;***************************************	
Read11:	dw 0e6ffh ;  repeat and wait 015h	


	
BC5602RegsSetup13:
		dw 05500h, 0ffffh ;set CE pin low
hh_3_:
		dw 089h		;rx flush	

		dw 0c1ffh ;read a "30"
BC5602RegsSetup14:		
		dw 04131h, 04130h ;enable Tx clock and reset 1.2v power then release

		dw 05501h, 0ffffh ;set CE pin hi
		
Read1_3_:	dw 0e6ffh ;  wait one 015h				
;;;;;;;; break
;;set receive end ***************************
;;========================
	
	
Read112:	dw 0e6ffh ;  wait 015h		
BC5602RegsSetup15:
		dw 05500h, 0ffffh ;set CE pin low
hh2:
		dw 089h		;rx flush	


		dw 0c1ffh
		
BC5602RegsSetup16:		
		dw 04131h, 04130h, 05501h, 0ffffh
		
Read12:	dw 0e6ffh ;  wait one 015h				
			
	;;;;;;;; break
	
	
Read1123:	dw 0e6ffh ;  wait 015h		
BC5602RegsSetup17:
		dw 05500h, 0ffffh ;set CE pin low
hh2_3_:
		dw 089h			

		dw 0c1ffh
BC5602RegsSetup18:		
		dw 04131h, 04130h, 05501h, 0ffffh
		
Read12_2_:	dw 0e6ffh ;  wait one 015h				
						
			
;;2e ;;4b ;;05 ;;2e ;;4b ;;05 ;;2e	;4b ;; 05 ;;2e 			
		
Read11234:	dw 0e6ffh ;  wait 015h	"receive mode"	
BC5602RegsSetup19:
		dw 05500h, 0ffffh
hh24:
		dw 089h			

		dw 0c1ffh
BC5602RegsSetup20:		
		dw 04131h, 04130h ;now an IRQ
		dw 05501h, 0ffffh
		
Read124:	dw 0e6ffh ;  wait one 015h				


;break						
;; no this ;;;Read112345:	dw 0e6ffh ;  wait 015h		
BC5602RegsSetup21:
		dw 05500h, 0ffffh ;"CE" pin
hh245:
	;;no this ;;;	dw 089h			

		dw 0c3ffh
BC5602RegsSetup22:		
		dw 04300h, 0ffffh ;set to tx mode
MultiBytesT6_2: ;read prx addr
		dw 011h, 02dh, 043h, 01eh, 059h, 000h, 003h, 0ffffh  ;read RX pipe0 address(same as MultiBytesT6_3)
BC5602RegsSetup23:
		dw 05501h, 05500h, 0ffffh
		
		dw 0e6ffh ;wait 014h =="x4" means Tx mode

;;got IRQ ---

		dw 0c4ffh ;read a "40" ;;means a Rx in int 
BC5602RegsSetup24:		
		dw 04410h, 0ffffh ;;set MAX rt finish (maybe terminate the Tx ???)
kk1:
		dw 009h	;Tx flush
BC5602RegsSetup25:
		dw 0ffffh
MultiBytesT6_3:
		dw 011h, 02dh, 043h, 01eh, 059h, 000h, 003h, 0ffffh  ;read RX pipe0 address(same as MultiBytesT6_3)

BC5602RegsSetup26:
		dw 05501h, 05500h, 0ffffh 
		
		dw 0e6ffh ;wait 014h

;;;;;; receiver ;;;;;;;;;
Read11234r:	dw 0e6ffh ;  wait 015h		
BC5602RegsSetup27:
		dw 05500h, 0ffffh
hh24r:
		dw 089h			

		dw 0c1ffh
BC5602RegsSetup28:		
		dw 04131h, 04130h ;now an IRQ
		dw 05501h, 0ffffh
		
Read124r:	dw 0e6ffh ;  wait one 015h				

;;;got IRQ
BC5602Regs2Setup914rr23:
		dw 0c4ffh
BC5602RegsSetup29:		
		dw 04440h, 0ffffh


		dw 0ccffh
MultiBytesT6_4:
		dw 0bfh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7,8,9,10,11,12,13,14,15,16,0ffffh  ; read payload
BC5602RegsSetup30:
		dw 05501h, 05500h, 0ffffh
		
		dw 0e6ffh ;wait 014h

;;;got irq ===
	dw 0c4ffh ;read a "40h"
BC5602RegsSetup31:	
	dw 04440h, 0ffffh
	
	dw 0ccffh ; read a "06"
	
	dw 0bfh ; read 6 byte PTX address "0ffh 0ffh ...."
	
	dw 0e6ffh ; read a "015h"
	
BC5602RegsSetup32:	
	dw 05500h, 0ffffh
	
	dw 089h ;flush RX 
	
	dw 0c1ffh ;read a "30h"
BC5602RegsSetup33:	
	dw 04131h, 04130h, 05501h, 0ffffh
	
	;break 100us
	dw 0e6ffh ;read a "015h"


;;*******************	
	 ;tx
BC5602RegsSetup36:
	dw 05501h, 0ffffh	 
	 
	 dw 0c3ffh ;read a "01" ---> now is RX
BC5602RegsSetup37:
	dw 04300h, 0ffffh		 ;4300 --> set to TX
	 
	dw 009h	
	

MultiBytesT6_5:
		dw 011h, 02dh, 043h, 01eh, 059h, 000h, 003h, 0ffffh  ;read RX pipe0 address(same as MultiBytesT6_3)

MultiBytesT6_6:	
		dw 090h, 0ffh, 0dch, 000h, 0b0h, 000h, 0ffffh 	;;read address
	
BC5602RegsSetup38:
	dw 05501h, 05500h, 0ffffh		
;;;;;;;;; TX end

;;irq in

	dw 0c4ffh ;this is after a irq pin intterup in(read IRQ)read a "1e" 
	;"01eh " MAX TX is finished, TX fifo is not full
	;then can send next TX
	
BC5602RegsSetup39:
	dw 04410h, 0ffffh


BC5602RegsSetup40:
	dw 0ffffh
	
BC5602RegsSetup41:
	dw 04410h, 0ffffh	
		
	
	;38
	;e6		
;;;;;;;;; TX end


	dw 0e6ffh	;wait 0x14
		
;;eeprom address 6,7,8

	org 0f00h
	;0f00~0f02 must empity
TableSn2:
	;can not write anything here
TableSn1:
	;can not write anything here
TableSn0:
	;can not write anything here
	org 0f03h	
	dw 012h,034h,056h
	

TableSwCode:
	;dw 0,4,1,3,7,2,6,1,5,9 ;the sw number of pressed key
	dw 0,22,16,12,21,14,20,16,10,9 ;the KeyCode number of pressed key


TableWaterLevelPosition:
	dw FrontLevelStrong_c_3,FrontLevelStrong_c_3,FrontLevelStrong_c_3 ;; 0,1,2 is dumb
	
	dw FrontLevelWeak_c_5,FrontLevelStrong_c_3,FrontLevelMiddle_c_4
	
	dw FrontLevelStrong_c_3 ;6 is dumb
	
	dw BackLevelMiddle_c_8,BackLevelStrong_c_9,BackLevelWeak_c_7	

TableWaterLevelLEd:
	dw 0,0,0
	dw 2,1,0
	dw 0
	dw 0,1,2