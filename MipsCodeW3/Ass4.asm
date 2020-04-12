#Laboratory Exercise 3, Ass4

.text
	li $s1,  1      # i=1
	li $s2,  1	# j=1
	li $t1,  1	# x=1
	li $t2,  1	# y=1
	li $t3,  2	# z=2
	li $s3,  1	# m = 1
	li $s4,  2	# n = 2 
	
start:
	add	$s5,$s1,$s2	# $s5 = i+j
	add	$s6,$s3,$s4	# $s6 = m +n
 	slt	$t0,$s6,$s5	# m+n < i+j           
	beq	$t0,$zero,else	# branch to else if m+n > i+j
	addi	$t1,$t1,1	# then part: x=x+1
	addi	$t3,$zero,1	# z=1
	j	endif		# skip “else” part
else:
	addi	$t2,$t2,-1	# begin else part: y=y-1
	add	$t3,$t3,$t3	# z=2*z
endif:

