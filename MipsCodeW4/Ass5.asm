#Laboratory 4, Ass5

.text
	li	$s1, 0			#index
	li	$s2, 1			#gia tri khoi dau
	li	$s3, 5			#so Lan Lap
	li	$s4, 1			#step
	
loop:	slt	$t2, $s1, $s3		# $t2 = i < n ? 1 : 0
	beq	$t2, $zero, endloop 
	sll 	$s5,$s2,1		# Dich trai 1 bit
	move 	$s2,$s5			# Dua gia tri cua s5 vao s2
	add	$s1,$s1,$s4		#i=i+step
	j loop				#goto loop
	
endloop:


