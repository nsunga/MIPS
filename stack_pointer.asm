.data
newline: .asciiz "\n"

.text
	addi	$a0, $0, 5
	addi	$a1, $0, 3
	li	$v0, 1
	addi	$a0, $a0, 0
	syscall
	li	$v0, 4
	la	$a0, newline
	syscall
	and	$a0, $a0, $0
	addi	$a0, $0, 5
	jal	function
	
function:
	addi	$sp, $sp, -4
	sw	$a0, 0($sp)
	li	$v0, 1
	addi	$a0, $a0, 0
	syscall
	lw	$t0, 0($sp)
	li	$v0, 1
	addi	$t0, $t0, 0
	syscall
	li	$v0, 10
	syscall