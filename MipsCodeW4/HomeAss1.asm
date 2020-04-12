#Laboratory Exercise 4, Home Assignment 1

.text
	li	$s1, -8
	li	$s2, 9

start:
	li 	$t0, 0			# No Overflow is default status
	addu	$s3, $s1, $s2		# s3 = s1 + s2
	xor	$t1, $s1, $s2		# Test if $s1 anf $s2 have the same sign  $t1 < 0 khi s1, s2 khac dau
										# $t1 > 0 khi s1, s2 cung dau
	bltz	$t1, EXIT		# if not, exit neu t1 < 0 => s1 s2 khac dau => thoat
	slt	$t2, $s3, $s1		# t2 = 1 neu s3 < s1 ; t2 = 0 neu s3 > s1
	bltz	$s1, NEGATIVE		# Test if $s1 and $s2 is negative? neu s1 < 0 => NEGATIVE
	beq	$t2, $zero, EXIT	# a1 and a2 are positive
					# if $s3 > $s1 then the result is not overflow
	j	OVERFLOW
	
NEGATIVE:
	bne	$t2, $zero, EXIT	# a1 and s2 are negative
					# if $s3 < $s1 then the result is not overflow	
OVERFLOW:
	li	$t0, 1			# the result is overflow
	
	
EXIT:





