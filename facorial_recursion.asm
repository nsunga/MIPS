.data
head:	.asciiz "n! = "

.text
main:	
	la	$a0, head
	li	$v0, 4
	syscall
	addi	$a0, $0, 6
	jal	factorial
	addi	$a0, $v0, 0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
	
factorial:
	addi	$sp, $sp, -8
	sw	$a0, 4($sp)
	sw	$ra, 0($sp)
	addi	$t0, $0, 2
	slt	$t0, $a0, $t0	#a < 2?
	beq	$t0, $0, else
	addi	$v0, $0, 1
	addi 	$v0, $0, 1
	addi	$sp, $sp, 8
	jr	$ra

else:
	addi	$a0, $a0, -1
	jal	factorial
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	addi	$sp, $sp, 8
	mulu	$v0, $a0, $v0
	jr	$ra