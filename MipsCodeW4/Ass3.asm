.text

	li 	$s1, -9
	li	$s4, 8
	li	$t1, 0
	
# abs	$s0, $s1	# s0 = |s1|
	add 	$s0,$s1,$zero
	slt 	$at,$s0,$zero
	beq 	$at,$zero,EXIT
	sub 	$s0,$zero,$s1
EXIT:

# move	$s2, $s1	# add value of s1 => s2
	add 	$s2, $s1, $zero
	
	
# not $s3, $s1	# s3 = not(s1)
	nor 	$s3, $s1, $zero 
	
	
# ble $s1,$s2,label	if s1<s4 =>  goto label 
	slt	$t0, $s1, $s4
	bne 	$t0, $zero, label 
	j	END
label:
	li	$t1, 1
	
	
END:	
	
	
	
