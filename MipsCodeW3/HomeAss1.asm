#Laboratory Exercise 3, Home Assignment 1
.text
	li $s1,  2      # i=2
	li $s2,  3	# j=3
	li $t1,  1	# x=1
	li $t2,  1	# y=1
	li $t3,  1 	# z=1
start:
	slt	$t0,$s2,$s1	# j<i                    
	bne	$t0,$zero,else	# branch to else if j<i
	addi	$t1,$t1,1	# then part: x=x+1
	addi	$t3,$zero,1	# z=1
	j	endif		# skip “else” part
else:
	addi	$t2,$t2,-1	# begin else part: y=y-1
	add	$t3,$t3,$t3	# z=2*z
endif:





