.data
Input:	.space	20
Output:	.space	20
Message1: .asciiz "Ban co muon nhap tiep khong?"
Message2: .asciiz "String dao nguoc:"
.text
	li $t0,0  #strlen =0
	la $s2,Input #load $s2 la dia chi cua xau nhap vao
get_string:
	subi $s0,$t0,20				# kiem tr so phan tu khong qua 20
	beq $s0,$zero, end_get_string
	li $v0, 12				#nhap ki tu
 	syscall 
 	subi $s1,$v0,10				#kiem tra xem ki tru nhap vao co phai enter khong
 	beq $s1,$zero,end_get_string
 	sb $v0,Input($t0)			#gan gia tri nhap vao Input[i] tuong ung
 	addi $t0,$t0,1				
	j get_string
end_get_string:
	
	
reverse:
	subi	$t1, $t0, 1		#$s1 la chi so j cua Output
	la	$t2, Input		# Load $t2 la dia chi cua Input
	li	$t0, 0			# $t0 la chi so i cua input
	
	reverse_loop:
		add	$t3, $t2, $t0		# $t3=dia chi cua Input[i]
		lb	$t4, 0($t3)		# $s4=Input[i]
		beqz	$t4, exit		# neu $s4==0 exit
		sb	$t4, Output($t1)	# Output[j]=Input[i]
		subi	$t1, $t1, 1		# j--
		addi	$t0, $t0, 1		# i++
		j	reverse_loop		# Quay lai vong lap
	
exit:
	li	$v0, 59			# Print
	la  	$a0, Message2
	la	$a1, Output		# the string!
	syscall

	
		
	
	





	
		
