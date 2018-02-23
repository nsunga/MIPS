.data
palindrome: 	.asciiz "moM"
fail:		.asciiz "fail"
pass:		.asciiz "pass"

.text
la 	$t0 palindrome

get_length:
	lb	$t1 0($t0)
   	beq	$t1 $zero get_length_done

	addi	$t0, $t0, 1
    	addi	$t2, $t2, 1
    	j	get_length
get_length_done:


beq	$t2, $0, check_if_palindrome_pass
add	$t3, $0, $t2 	# $t3 has length of string
add	$t4, $0, $0 	# $t4 has index of first character
subi    $t5, $t3, 1

la	$t0, palindrome

check_if_palindrome:
	lb	$t1, 0($t0)
	sub	$t3, $t3, 1
	add	$t0, $t0, $t3
	lb      $t2, 0($t0)
	beq	$t5, $t4, check_if_palindrome_pass
	bne	$t1, $t2, check_if_palindrome_fail

	addi	$t4, $t4, 1
	subi    $t3, $t3, 1
	sub	$t0, $t0, $t3
	sub     $t5, $t5, 1
	j	check_if_palindrome
	
	
check_if_palindrome_fail:
	li	$v0, 4
	la	$a0, fail
	syscall
	li	$v0, 10
	syscall
check_if_palindrome_pass:
	li	$v0, 4
	la	$a0, pass
	syscall
	li	$v0, 10
	syscall


