#Laboratory 3, Ass5
.data
	A:	.word 	-1, -3, 2, 0, 5
.text
	li	$s1, 0
	la	$s2, A
	li	$s3, 5
	li	$s4, 1
	li	$s5, 0
	
loop:	#slt	$t2, $s3, $s1	# $t2 = n < i ? 1 : 0
	#bne	$t2, $zero, endloop
	add	$t1,$s1,$s1	#$t1=2*$s1
	add	$t1,$t1,$t1	#$t1=4*$s1
	add	$t1,$t1,$s2	#$t1 store the address of A[i]
	lw	$t0,0($t1)	#load value of A[i] in$t0
	add	$s5,$s5,$t0	#sum=sum+A[i]
	add	$s1,$s1,$s4	#i=i+step
	beq	$t0, $zero, endloop
	#slt	$t2, $s5, $zero  # $t2 = sum < 0 ? 1 : 0
	#bne	$t2, $zero, endloop
	j loop	#goto loop
endloop: