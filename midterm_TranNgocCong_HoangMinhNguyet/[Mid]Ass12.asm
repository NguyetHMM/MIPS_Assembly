# Kiem tra giua ky Kien Truc May Tinh - De so 12

.data
Message1:	.asciiz "\nNhap so ve cua ban: "
Message2:	.asciiz "So ve khong hop le !\n"
Message3:	.asciiz "So ve phai la mot so tu nhien co so chu so chan ! \nVui long nhap lai !"
Message4:	.asciiz "Ket qua: "
Message5:	.asciiz "Chuc mung ban so huu ve so may man !"
Message6:	.asciiz "Chuc ban may man lan sau !"
Input :		.space 20
.text
main:
	
	li	$t0, 0						# so luong chu so = i = $t0
	li	$v0,4						
	la	$a0, Message1
	syscall

input:
	li	$v0, 12						# nhap lan luot chu so tu ban phim
	syscall
	subi	$s1, $v0, 10					# kiem tra ki tu nhap vao co phai enter khong
	beq	$s1, $zero, end_input				# neu la enter ket thuc viec nhap
check_number:							# kiem tra ki tu nhap vao co phai chu so khong
	subi	$s1, $v0, 48					# ma ascii cua chu so lon hon hoac bang 48
	slt	$s2, $s1, $zero
	bne	$s2, $zero, error				# neu sai bao loi

	subi	$s1, $v0, 57					# ma ascii cua chu so nho hon hoac bang 57
	slt	$s2, $zero, $s1
	bne	$s2, $zero, error				# neu sai bao loi
end_check_number:
	sb	$v0, Input($t0)					# luu ki tu tuong ung vao Input[i]
	addi	$t0, $t0, 1					# i++
	j	input
end_input:
check_number_of_char:
	li	$t1,2						
	div	$t0,$t1						# chia so chu so cho 2
	mflo	$t2						# thuong luu trong $t2
	mfhi	$s1						# so du luu trong $s1	
	bne	$s1, $zero, error				# kiem tra xem so chu so co phai so chan khong, neu sai bao loi
check_lucky_number:
	li	$t3, 0						# chi so j
	li	$t6, 0						# tong nua dau
	li	$t7, 0						# tong nua sau
first_half:
	slt	$t4, $t3, $t2					# chi so j chay tu 0 den n/2-1
	beq	$t4, $zero, end_first_half
	lb	$t5, Input($t3)					# luu Input[j] vao $t5
	add	$t6, $t6, $t5					
	addi	$t3,$t3,1					# ++
	j first_half
end_first_half:
second_half:
	slt	$t4, $t3, $t0					# chi so j chay tu n/2 den n-1
	beq	$t4, $zero, end_second_half
	lb	$t5, Input($t3)					# luu Input[j] vao $t5
	add	$t7, $t7, $t5
	addi	$t3,$t3,1					# j++
	j first_half
end_second_half:
	sub	$t4, $t6, $t7					# kiem tra $t6 co bang $t7 khong
	beq	$t4, $zero, lucky_number			# neu co thong bao so may man
unlucky_number:
	li	$v0, 59						# thong bao so khong may man
	la	$a0, Message4
	la	$a1, Message6
	syscall     
	j end_main
lucky_number:
	li	$v0, 59						# thong bao so may man
	la	$a0, Message4
	la	$a1, Message5
	syscall   
	j	end_main
error:
	li	$v0, 59						# thong bao loi
	la	$a0, Message2
	la	$a1, Message3
	syscall   
	j	main
end_main:							# ket thuc chuong trinh

	
	 
