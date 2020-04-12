#Laboratory Exercise 5, Assignment 2 
.data
m1:	.asciiz "The sum of "
m2:	.asciiz " and "
m3:	.asciiz " is "
.text
	li	$v0, 4		# call service print string
	la	$a0, m1		# set a0 by content in address m1
	syscall 
	
	li	$s1, 8		
	li	$v0, 1		# call service print decimal integer
	la	$a0, ($s1)
	syscall
   
	li	$v0, 4		# call service print string
	la	$a0, m2		# set a0 by content in address m1
	syscall
	
	li	$s2, 9
	li	$v0, 1		# call service print decimal integer
	la	$a0, ($s2)	
	syscall 
	
	li	$v0, 4		# call service print string
	la	$a0, m3		# set a0 by content in address m1
	syscall 
	
	add	$s3, $s1, $s2	#s3 = s1 + s2
	li	$v0, 1		# call service print decimal integer
	la	$a0, ($s3)
	syscall 
	
