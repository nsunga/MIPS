.eqv Counter, 5

.data
array_input:	.word 100, 100, 100, 100, 100
result:		.asciiz "Result: "
newline:	.asciiz "\n"

.text
	la	$a0, array_input	# load array
	la	$a1, Counter		# load counter
	jal	Function1		# Subtracts Square of the Sums with Sum of the Squares
	la	$s2, ($v0)		# save the result in $s2
	li	$v0, 4			# string syscall
	la	$a0, result		# load string in $a0
	syscall				# output string
	li	$v0, 1			# int syscall
	la	$a0, ($s2)		# load in result into $a0
	syscall				# output da ting
	li	$v0, 10			# exit syscall
	syscall				# exit da ting

Function1:
	addi	$sp, $sp, -4		# make room for ra
	sw	$ra, 0($sp)		# save $ra to return to main later
	jal	Function2		# Calculate Square of the Sums BRO
	la	$s0, ($v0)		# save result in $s0
	jal	Function3		# Calculate Sum of the Squares BRO
	la	$s1, ($v0)		# save result in $s1
	sub	$v0, $s0, $s1		# load subtraction result into $v0
	lw	$ra, 0($sp)		# get the return address
	addi	$sp, $sp, 4		# restore stack pointer
	jr	$ra			# return to main
	
Function2:
	and	$t0, $0, $t0		# clear this
	and	$t1, $0, $t1		# clear this
	and	$t2, $0, $t2		# clear this
	and	$t3, $0, $t3		# clear this
	la	$t0, ($a0)		# load array into $t0
	la	$t1, ($a1)		# load counter into $t1
func2_loop:
	lw	$t2, 0($t0)		# load array element into $t2
	add	$t3, $t3, $t2		# add $t2 into $t3 => the sum
	addi	$t0, $t0, 4		# update array index
	addi	$t1, $t1, -1		# decrement counter
	bne	$t1, $0, func2_loop	# if counter not 0, keep adding before squaring
	mult	$t3, $t3		# square da ting man
	mflo	$v0			# load squared ting in $v0
	jr	$ra			# return back to Function1

Function3:
	and	$t0, $0, $t0		# clear this
	and	$t1, $0, $t1		# clear this
	and	$t2, $0, $t2		# clear this
	and	$t3, $0, $t3		# clear this
	la	$t0, ($a0)		# load array into $t0
	la	$t1, ($a1)		# load counter into $t1
func3_loop:
	lw	$t2, 0($t0)		# load array element into $t2
	mult	$t2, $t2		# square da ting man
	mflo	$t3			# load squared ting in $t3
	add	$t4, $t4, $t3		# add into result
	addi	$t0, $t0, 4		# update array index
	addi	$t1, $t1, -1		# decrement counter
	bne	$t1, $0, func3_loop	# if counter not 0, keep squaring da tings
	addi	$v0, $t4, 0		# load result into $v0
	jr	$ra			# return back to Function1
	
	