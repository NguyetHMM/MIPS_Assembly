.data
A:		.word 9, -1, 2, 3, 3
mess1:		.asciiz "Tich lon nhat duoc tim thay la cua "
mess2:		.asciiz " va "
mess3:		.asciiz " la: "
.text
#---------------------------------------------------
# Y tuong thuan toan
# max = A[0]*A[1];
# for_loop i = 0, i < n-1, i++ 
#	if (a[i]*a[i+1] > max) max = a[i]*a[i+1];
# end_loop
#---------------------------------------------------
# $s0 : Dia chi mang A
# $s1 : So phan tu cua mang n
# $s2 : Bien chay i
# $s3 : MAX PRODUCT
# $s4 : Gia tri index hien tai
#---------------------------------------------------

input:	
	la	$s0, A					# Dia chi cua mang A
	li	$s1, 5					# So phan tu cua mang n = 5
	li	$s2, 1					# Bien i chay tu 1
	sub	$t0, $s1, 1				# n-1
	j	findmaxproduct
	nop

findmaxproduct:
	addi	$t3,$s0,0				# Dia chi cua A[0] -> $t3
	lw	$t4,0($t3)				# Gia tri cua A[0] -> $t4
	add	$t6,$s0,4				# Dia chi cua A[1] -> $t6
	lw	$t7,0($t6) 				# Gia tri cua A[1] -> $t7
	mult 	$t4, $t7				# A[0] * A[1] 	
	mflo	$s3					# Khoi tao max ban dau A[0] * A[1] -> $s3
	move	$s4, $t4				
	move	$s5, $t7				
loop:
	slt	$t1, $s2, $t0				# i < n-1 ? t1 = 1 : t1 = 0
	beq	$t1, $zero, end_findmaxproduct
	add	$t2,$s2,$s2				# $t2 = 2i
	add	$t2,$t2,$t2				# $t2 = 4i
	add	$t3,$t2,$s0				# Dia chi cua A[i] -> $t3
	lw	$t4,0($t3)				# Gia tri cua A[i] -> $t4
	addi	$t5, $s2, 1				# i = i+1	
	add	$t5,$t5,$t5				# $t5 = 2(i+1)
	add	$t5,$t5,$t5				# $t5 = 4(i+1)
	add	$t6,$t5,$s0				# Dia chi cua A[i+1] -> $t6
	lw	$t7,0($t6) 				# Gia tri cua A[i+1] -> $t7
	mult 	$t4, $t7				# A[i] * A[i+1] 	
	mflo	$s1					# Lay tich duoc luu o thanh ghi lo , luu vao $s1
	slt	$s6, $s3, $s1				# max < $s1 ? $s6 = 1 : $s6 = 0
	beq	$s6, $zero, loop_continue		# Neu max > $s1 -> tang bien len 1 va tiep tuc lap 
	move	$s3, $s1				# Neu max < $s1 -> max = $s1
	move	$s4, $t4
	move	$s5, $t7
	
loop_continue:
	add	$s2, $s2, 1				# i = i+1
	j	loop
	
end_findmaxproduct:
	li	$v0, 4           			# In string
    	la	$a0, mess1  				
    	syscall
    	li	$v0, 1           			# In so nguyen
    	add	$a0, $s4, $zero  
    	syscall
    	li	$v0, 4           			# In string
    	la	$a0, mess2  				
    	syscall
    	li	$v0, 1           			# In so nguyen
    	add	$a0, $s5, $zero  
    	syscall
    	li	$v0, 4           			# In string
    	la	$a0, mess3  				
    	syscall
    	li	$v0, 1           			# In so nguyen
    	add	$a0, $s3, $zero  
    	syscall
	
	
	
	 
