.data
x:		.word		0x01020304
message:	.asciiz		"Bo mon Ky thuat May tinh"
.text
	la	$a0, message	# Nap dia chi cua message vao thanh ghi $a0
	li	$v0, 4		# Nap gia tri 4 vao thanh ghi $v0
	syscall
	
	addi	$t1, $zero, 2
	addi	$t2, $zero, 3
	add	$t0, $t1, $t2	
	
