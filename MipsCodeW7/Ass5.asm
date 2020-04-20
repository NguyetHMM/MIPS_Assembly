#Laboratory Exercise 7, Assignment 5
.text

#------------------------------------------------------------
# Result
# Largest: $v0,$a0
# Smallest: $v1,$a1
#------------------------------------------------------------

main:
	li	$s0, 1			
	li	$s1, 9
	li	$s2, 2
	li	$s3, 8
	li	$s4, 5
	li	$s5, 7
	li	$s6, 3
	li	$s7, 4

	li	$t1,1
	li	$t2,1			# index count position where largest element is stored
	li	$t3,1			# index count position where small element is stored

	jal	init
	nop

	li	$t4,8			# number of elements
	sub	$a0,$t4,$t2
	sub	$a1,$t4,$t3
	j	end
	nop
endmain:
init:
	add	$v0,$s7,$zero		# set the largest element is $s7
	add	$v1,$s7,$zero		# set the smallest element is $s7

push:
	addi	$sp,$sp,-32		# push into stack
	sw	$s0,28($sp)
	sw	$s1,24($sp)
	sw	$s2,20($sp)
	sw	$s3,16($sp)
	sw	$s4,12($sp)
	sw	$s5,8($sp)
	sw	$s6,4($sp)
	sw	$s7,0($sp)

loop:
	addi	$sp,$sp,4		
	lw	$a1,0($sp)
	add	$t1,$t1,1
	sub	$t0,$a1,$v0		# if  $a1 < $v0 => okay1
	bltz	$t0,okay1
	nop
	add	$v0,$a1,$zero		# else $v0 = $a1 && $t2 = $t1
	add	$t2,$t1,$zero
okay1:
	sub	$t0,$a1,$v1		# if $a1 > $v1 => okay2
	bgtz	$t0,okay2
	nop
	add	$v1,$a1,$zero		# else $v1 = $a1 && $t3 = $t1
	add	$t3,$t1,$zero
okay2:
	bne	$a1,$s0,loop		# if a1 # s0 , loop
	nop
done:
	jr	$ra

end:



