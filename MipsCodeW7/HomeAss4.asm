#Laboratory Exercise 7, Home Assignment 4
.data
Message:	.asciiz		"Ket qua tinh giai thua la: "

.text
main:	jar	WARP

print:	add	$s1, $v0, $zero		# $a0 = result from N!
	li	$v0, 56
	la	$a0, Message
	syscall 
endmain:

#----------------------------------------------------------------------
#Procedure WARP: assign value and call FACT
#----------------------------------------------------------------------

WARP:	sw	$fp, -4($sp)		#save frame pointer (1)
	addi	$fp, $sp, 0		#new frame pointer point to the top (2)
	addi	$sp, $sp, -8		#adjust stack pointer (3)
	sw	$ra, 0($sp)		#save return address (4)
	li	$a0, 6			#load test input N
	jal	FACT			#call fact procedure
	nop
	lw	$ra, 0($sp)		#restore return address (5) 
	addi	$sp, $fp, 0		#return stack pointer (6) 
	lw	$fp, -4($sp)		#return frame pointer (7) 
	jr	$ra
wrap_end:

#---------------------------------------------------------------------- 
#Procedure FACT: compute N!
#param[in] $a0 integer N
#return $v0 the largest value 
#----------------------------------------------------------------------
FACT:	sw	$fp, -4($sp)		#save frame pointer
	addi	$fp, $sp, 0		#new frame pointer point to stack’s top
	addi	$sp, $sp, -12		#allocate space for $fp,$ra,$a0 in stack
	sw	$ra, 4($sp)		#save return address
	sw	$a0, 0($sp)		#save $a0 register
	slti	$t0, $a0, 2		#if input argument N < 2
	beq	$t0, $zero, recursive	#if it is false ((a0 = N) >=2) 
	nop
	li	$v0, 1
	j	done
	nop
recursive:	
	addi	$a0, $a0, -1		#adjust input argument
	jal	FACT			#recursive call
	nop
	lw	$v1, 0($sp)		#load a0
	mult	$v1, $v0		#compute the result
	mflo	$v0			
done:	lw	$v1, 0($sp)		
	lw	$a0, 0($sp)		
	addi	$sp, $fp, 0
	lw	$fp, -4($sp)		
	jr	$ra			
fact_end: