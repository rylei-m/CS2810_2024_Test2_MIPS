.text
.globl main

main:
	li $a0, 5
	li $a1, 10
	jal doubleSum
	move $t0, $v0

	li $a0, 2
	li $a1, 7
	jal doubleSum
	move $t1, $v0

        li $v0, 10
        syscall

addTwo:
	addi $v0, $a0, 2
	jr $ra

addThree:
	addi $v0, $a0, 3
	jr $ra

doubleSum:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	
	move $a0, $a0
	jal addTwo
	move $s0, $v0
	
	move $a0, $a1
	jal addThree
	move $s1, $v0

	add $v0, $s0, $s1
	
	lw $ra, 8($sp)
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $sp, $sp, 12

	jr $ra
