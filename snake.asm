#include "p18f8722.inc"
; CONFIG1H
  CONFIG  OSC = HSPLL, FCMEN = OFF, IESO = OFF
; CONFIG2L
  CONFIG  PWRT = OFF, BOREN = OFF, BORV = 3
; CONFIG2H
  CONFIG  WDT = OFF, WDTPS = 32768
; CONFIG3L
  CONFIG  MODE = MC, ADDRBW = ADDR20BIT, DATABW = DATA16BIT, WAIT = OFF
; CONFIG3H
  CONFIG  CCP2MX = PORTC, ECCPMX = PORTE, LPT1OSC = OFF, MCLRE = ON
; CONFIG4L
  CONFIG  STVREN = ON, LVP = OFF, BBSIZ = BB2K, XINST = OFF
; CONFIG5L
  CONFIG  CP0 = OFF, CP1 = OFF, CP2 = OFF, CP3 = OFF, CP4 = OFF, CP5 = OFF
  CONFIG  CP6 = OFF, CP7 = OFF
; CONFIG5H
  CONFIG  CPB = OFF, CPD = OFF
; CONFIG6L
  CONFIG  WRT0 = OFF, WRT1 = OFF, WRT2 = OFF, WRT3 = OFF, WRT4 = OFF
  CONFIG  WRT5 = OFF, WRT6 = OFF, WRT7 = OFF
; CONFIG6H
  CONFIG  WRTC = OFF, WRTB = OFF, WRTD = OFF
; CONFIG7L
  CONFIG  EBTR0 = OFF, EBTR1 = OFF, EBTR2 = OFF, EBTR3 = OFF, EBTR4 = OFF
  CONFIG  EBTR5 = OFF, EBTR6 = OFF, EBTR7 = OFF
; CONFIG7H
  CONFIG  EBTRB = OFF

;*******************************************************************************
;SORUNLAR  
;*******************************************************************************
;OKOKOK;;;RA4 ba?lang?ç emri
;OKOKOK;;;delay süreleri 
;ra4e bas?l? tutunca devam edecek

;*******************************************************************************

	UDATA_ACS
esasstate	equ 0x20
zerotest	equ 0x22
d_2000_1	equ 0x31	
d_2000_2	equ 0x32	
d_2000_3	equ 0x33	
d_400_1		equ 0x41	
d_400_2		equ 0x42	
d_400_3		equ 0x43	
d_750_1		res 1	
d_750_2		equ 0x52	
d_750_3		equ 0x53
basildi		equ 0x24

RES_VECT	CODE    0x0000            ; processor reset vector
    goto    START                   ; go to beginning of program


MAIN_PROG CODE	; let linker place main program

 
START
    call INIT	; initialize variables and ports
    
    
INIT
    
	clrf	PORTA   ;Initialize PORTA by; clearing output; data latches
	clrf	LATA    ; Alternate method; to clear output; data latches
	movlw	0Fh     ; Configure A/D 
	movwf	ADCON1  ; for digital inputs
    
    
	movlw	b'11110000'
	movwf	TRISA
	movwf	TRISB
	movwf	TRISC
	movwf	TRISD

	movlw	b'00001111'
	movwf	LATA
	movwf	LATB
	movwf	LATC
	movwf	LATD
	
	call	DELAY2000
    

MAIN_LOOP   
    
state_100:
	movlw	d'100'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA,0
	bsf	LATB,0
	clrf	LATC
	clrf	LATD
	call	DELAY750
	
state_101:
	movlw	d'101'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATB,0
	bsf	LATC,0
	call	DELAY750
	
state_102:
	movlw	d'102'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATC,0
	bsf	LATD,0
	call	DELAY750
	
	call	press_RB5

state_103:
	movlw	d'103'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD, 0
	bsf	LATD, 1
	call	DELAY750

state_104:
	movlw	d'104'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD, 1
	bsf	LATD, 2
	call	DELAY750
	
state_105:
	movlw	d'105'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD, 2
	bsf	LATD, 3
	call	DELAY750
	
	call	press_RB5
	
state_106:
	movlw	d'106'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD,3
	bsf	LATC,3
	call	DELAY750
	
state_107:
	movlw	d'107'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATC,3
	bsf	LATB,3
	call	DELAY750
	
state_108:
	movlw	d'108'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATB,3
	bsf	LATA,3
	call	DELAY750
	
	call	press_RB5
	
state_109:
	movlw	d'109'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA, 3
	bsf	LATA, 2
	call	DELAY750
	
state_110:
	movlw	d'110'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA, 2
	bsf	LATA, 1
	call	DELAY750
	
state_111:
	movlw	d'111'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA, 1
	bsf	LATA, 0
	
	call	DELAY750
	call	press_RB5
	
	
	goto state_100
	
	
	
state_200:
	movlw	d'200'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD,0
	bsf	LATC,0
	call	DELAY400
	
state_201:
	movlw	d'201'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATC,0
	bsf	LATB,0
	call	DELAY400
	
state_202:
	movlw	d'202'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATB,0
	bsf	LATA,0
	call	DELAY400
	
	call	press_RB5
	
state_203:
	movlw	d'203'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA,0
	bsf	LATA,1
	call	DELAY400
	
state_204:
	movlw	d'204'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA,1
	bsf	LATA,2
	call	DELAY400
	
state_205:
	movlw	d'205'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA,2
	bsf	LATA,3
	call	DELAY400
	
	call	press_RB5
	
state_206:
	movlw	d'206'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATA,3
	bsf	LATB,3
	call	DELAY400
	
state_207:
	movlw	d'207'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATB,3
	bsf	LATC,3
	call	DELAY400
	
state_208:
	movlw	d'208'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATC,3
	bsf	LATD,3
	call	DELAY400
	
	call	press_RB5
	
state_209:
	movlw	d'209'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD,3
	bsf	LATD,2
	call	DELAY400
	
state_210:
	movlw	d'210'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD,2
	bsf	LATD,1
	call	DELAY400
	
state_211:
	movlw	d'211'
	movwf	esasstate
	clrf	LATA
	clrf	LATB
	clrf	LATC
	clrf	LATD
	bsf	LATD,1
	bsf	LATD,0
	call	DELAY400
	
	call	press_RB5

	
	goto	state_200
    
    
DELAY400:	
	movlw	0x12	
	movwf	d_400_3	
delay_400_3:
	movlw	0x99  
	movwf	d_400_2    
delay_400_2:
	movlw	0xA1	
	movwf	d_400_1
delay_400_1:	
	btfsc	PORTA,4	
	bsf	basildi,0
	tstfsz	basildi
	btfsc	PORTA,4
	goto	dikkat_400
	goto	buraya
dikkat_400:
	decfsz	d_400_1,F 
	goto	delay_400_1
	decfsz	d_400_2,F 
	goto	delay_400_2 
	decfsz	d_400_3,F 
	goto	delay_400_3 
	return
	
	
DELAY750:	
	movlw	0x24	
	movwf	d_750_3	
delay_750_3:
	movlw	0x93  
	movwf	d_750_2    
delay_750_2:
	movlw	0x9D	
	movwf	d_750_1
delay_750_1:
	btfsc	PORTA,4	
	bsf	basildi,0
	tstfsz	basildi
	btfsc	PORTA,4
	goto	dikkat_750
	goto	buraya
dikkat_750:
	decfsz	d_750_1,F 
	goto	delay_750_1 
	decfsz	d_750_2,F 
	goto	delay_750_2 
	decfsz	d_750_3,F 
	goto	delay_750_3 
	return
		
DELAY2000:	
	movlw	59	
	movwf	d_2000_3	
delay_2000_3:
	movlw	0xA0  
	movwf	d_2000_2    
delay_2000_2:
	movlw	0x9C	
	movwf	d_2000_1
delay_2000_1:
	btfsc	PORTA,4	
	bsf	basildi,0
	tstfsz	basildi
	btfsc	PORTA,4
	goto	dikkat_2000
	goto	buraya
dikkat_2000:
	decfsz	d_2000_1,F 
	goto	delay_2000_1 
	decfsz	d_2000_2,F 
	goto	delay_2000_2 
	decfsz	d_2000_3,F 
	goto	delay_2000_3 
	return

	
	
    
push_RA4: 
	btfss	PORTA,4
	goto	push_RA4
release_RA4:
	btfsc	PORTA,4
	goto	release_RA4
buraya:
	bcf	basildi,0
	movlw	d'100'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_202
	movlw	d'101'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_201
	movlw	d'102'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_200
	movlw	d'103'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_211
	movlw	d'104'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_210
	movlw	d'105'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_209
	movlw	d'106'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_208
	movlw	d'107'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_207
	movlw	d'108'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_206
	movlw	d'109'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_205
	movlw	d'110'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_204
	movlw	d'111'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_203
	movlw	d'202'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_100
	movlw	d'203'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_111
	movlw	d'204'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_110
	movlw	d'205'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_109
	movlw	d'206'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_108
	movlw	d'207'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_107
	movlw	d'208'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_106
	movlw	d'209'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_105
	movlw	d'210'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_104
	movlw	d'211'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_103
	movlw	d'200'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_102
	movlw	d'201'
	cpfseq	esasstate
	tstfsz	zerotest
	goto	state_101
	return 
	    
	
    
press_RB5:
	btfss	PORTB,5
	goto	check_RA4
	goto	release_RB5
check_RA4:
	btfss	PORTA,4
	goto	press_RB5 
	goto	release_RA4
release_RB5:
	btfsc	PORTB,5
	goto	release_RB5
	return
	END
