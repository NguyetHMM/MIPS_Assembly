#Home Ass 1
.eqv	SEVENSEG_LEFT	0xFFFF0010		# Dia chi cua den led 7 doan trai.
						# Bit 0 = doan a;
						# Bit 1 = doan b;...
						# Bit 7 = dau.
.eqv SEVENSEG_RIGHT 0xFFFF0011			# Dia chi cua den led 7 doan phai

.text main:
	li	$a0, 111
	jal	SHOW_7SEG_LEFT
	li	$a0, 79
	jal	SHOW_7SEG_RIGHT
exit:	li	$v0, 10
	syscall

#--------------------------------------------------------------- 
# Function SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed 
#--------------------------------------------------------------- 
SHOW_7SEG_LEFT:
	li	$t0, SEVENSEG_LEFT		# assign port's address
        sb	$a0,  0($t0)			# assign new value
        jr	$ra
#---------------------------------------------------------------
# Function SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed 
#--------------------------------------------------------------- 
SHOW_7SEG_RIGHT: 
	li	$t0, SEVENSEG_RIGHT		# assign port's address
        sb   $a0,  0($t0)		# assign new value
	jr $ra
	
	
	