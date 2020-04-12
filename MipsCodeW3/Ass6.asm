#Laboratory Exercise 3, Ass6
.data
	A:	.word 	1, 5, 3, 7, -9
	
.text
	li	$s1, 0
	la	$s2, A
	li	$s3, 5
	li	$s4, 1
	
loop:	

	slt	$t2, $s1, $s3	# $t2 = i < n ? 1 : 0
	beq	$t2, $zero, endloop
	add	$t1,$s1,$s1	#$t1=2*$s1
	add	$t1,$t1,$t1	#$t1=4*$s1
	add	$t1,$t1,$s2	#$t1 store the address of A[i]
	lw	$t0,0($t1)	#load value of A[i] in $t0
	abs	$t0, $t0
	slt	$t3, $s5, $t0 	# $t3 = $s5 < $t0 ? 1 : 0
	beq	$t3, $zero, endif
	add	$s5, $zero, $t0
	endif:
	add	$s1,$s1,$s4	#i=i+step
	j loop
endloop:
	
	
	
	
	