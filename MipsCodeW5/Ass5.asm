#Laboratory Exercise 5, Assignment 5
.data
string:		.space 50
x: 		.space 50			# destination string x, empty
Message1:	.asciiz "Nhap xau:"
Message2:	.asciiz "Xau dao nguoc la: "
.text
main:
get_string:	li $v0, 54
		la $a0, Message1
		la $a1, string 
		la $a2, 21
		syscall
		
get_length:	la   $a0, string		# a0 = Address(string[0])
 		xor  $v0, $zero, $zero		# v0 = length = 0
 		xor  $t0, $zero, $zero		# t0 = i = 0
check_char:	add  $t1, $a0, $t0		# t1 = a0 + t0
						# = Address(string[0]+i)
		lb   $t2, 0($t1)		
		beq  $t2,$zero,end_of_str	# Is null char?
		addi $v0, $v0, 1		# v0=v0+1->length=length+1
		addi $t0, $t0, 1		# t0=t0+1->i = i + 1
		j    check_char
end_of_str:
end_of_get_length:
		la   $a1, x
		la   $a0, string
		sub  $s0, $t0, 1		# $s0 = i(string) = lengh(string)
		add  $s1, $zero, $zero		# $s1 = i(x) = 0
		la   $a0, string		# a0 = Address(string[0])
reverse:
		add  $t0, $a0, $s0		# t0 = a0 + s0
						# = Address(string[0]+s0)
		lb   $t1, 0($t0)		# t1 = value at t0 = string[i]
		add  $t2, $s1, $a1		# t2 = s0 + a1 = i + x[0]
						# = address of x[i]
		sb   $t1, 0($t2)		# x[i] = t2 = string[i]
		beq  $t1, $zero, end_reverse	# if y[i] == 0, exit
		nop
		sub  $s0, $s0, 1 		#s0 = s0 + 1 <-> i(string)=i(string)-1 
		add  $s1, $s1, 1		#s1 = s1 + 1 <-> i(x)=i(x)+1 
		j    reverse			#next character
		nop
		
end_reverse:
		li $v0, 59
		la $a0, Message2 
		la $a1, x 
		syscall
		
		
