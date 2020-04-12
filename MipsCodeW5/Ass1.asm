#Laboratory Exercise 5, Assignment 1
.data
name:	.asciiz "Hoang Minh Nguyet "
mess1:	.asciiz "Nhap so nguyen"
mess2:	.asciiz "Nhap xau"
mess3:	.asciiz "Nhap ki tu"
string:	.space 50

.text
	li	$v0, 4		# call service print string
	la	$a0, name
	syscall 
	
	li	$s1, 8
	li	$v0, 1		# call service print decimal integer
	la	$a0, ($s1)
	syscall
   
	li	$v0, 11		# call service print character
	la	$a0, '/'
	syscall
	
	li	$s2, 9
	li	$v0, 1		# call service print decimal integer
	la	$a0, ($s2)
	syscall 
	
	li	$v0, 11		# call service print character
	la	$a0, '/'
	syscall 
	
	li	$s2, 1999
	li	$v0, 1		# call service print decimal integer
	la	$a0, ($s2)
	syscall  
	
	li	$v0, 51		# call service InputDialogInt
	la	$a0, mess1 
	syscall
	
	li	$v0, 54		# call service InputDialogString
	la	$a0, mess2
	la	$a1, string
	la	$a2, 50 
	syscall
	
	li	$v0, 12 	# call service read character
	syscall
 
	
	
	
	
	
