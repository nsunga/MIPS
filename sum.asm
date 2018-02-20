.eqv N, 5
.data
Array:	.word 	98, 99, 75, 40, 86
Avg: 	.word 	0

.text
	add	$t1, $0, $0
	la 	$t2, Array
	add	$t4, $0, N
loop: 	lw	$t3, 0($t2)
	add	$t1, $t1, $t3
	
	addi	$t2, $t2, 4
	addi	$t4, $t4, -1
	bne	$t4, $0, loop
	addi	$t5, $0, N
	div	$t1, $t5
	
	mflo	$t6
	sw	$t6, 0($t2)
	
	li 	$v0, 1
	lw 	$a0, 0($t2)
	syscall
	
