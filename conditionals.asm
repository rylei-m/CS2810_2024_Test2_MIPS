.data
	prompt: .asciiz "Enter in a number: "
	msg1: .asciiz "Greater than 5"
	msg2: .asciiz "Less than -5"
	
.text

main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 5
	slt $t2, $t1, $t0
	bne $t2, $zero gtf
	
	li $t1, -5
	slt $t2, $t0, $t1
	bne $t2, $zero ltf
	
	move $a0, $t0
	li  $v0, 1
	syscall
	j end
	
gtf:
	li $v0, 4
	la $a0, msg1
	syscall
	j end

ltf:
	li $v0, 4
	la $a0, msg2
	syscall
	j end	
	
end:
	li $v0, 10
	syscall