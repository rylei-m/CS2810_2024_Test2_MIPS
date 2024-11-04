.data
	array: .word -3, 2, -1, 0, 1, 2, 3
	arrayLen: .word 7
	
.text
.globl main

main:
	la $t0, array
	lw $t1, arrayLen
	
	li $t2, 0
	
loop: 
	bge $t2, $t1, end
	
	sll $t3, $t2, 2
	add $t4, $t0, $t3
	
	lw $t5, 0($t4)
	sll $t5, $t5, 1
	sw $t5, 0($t4)
	
	addi $t2, $t2, 1
	
	j loop
	
end:
	li $v0, 10
	syscall