#Laboratory Exercise 4, Assignment 4

.text
	li	$s1, -8
	li	$s2, 9

start:
	li 	$t0, 0			# No Overflow is default status
	addu	$s3, $s1, $s2		# s3 = s1 + s2
	xor	$t1, $s1, $s2		# Test if $s1 anf $s2 have the same sign  $t1 < 0 khi s1, s2 khac dau
										# $t1 > 0 khi s1, s2 cung dau
	bltz	$t1, EXIT		# if not, exit neu t1 < 0 => s1 s2 khac dau => thoat
	xor	$t2, $s3, $s1		# Test if $s1 anf $s3 have the same sign  $t2 < 0 khi s1, s3 khac dau
										# $t2 > 0 khi s1, s3 cung dau
	bltz	$t2, OVERFLOW		# overflow neu $t2 < 0 khi s1, s3 khac dau
	j	EXIT
	
OVERFLOW:
	li	$t0, 1			# the result is overflow
	 
EXIT:
