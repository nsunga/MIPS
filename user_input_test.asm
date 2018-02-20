.data
message:	.asciiz "Enter a number: "

.text
main:
	li 	$v0, 4
	la	$a0, message
	syscall
	
	li	$v0, 5
	syscall
	
	add	$t0, $0, $v0
	li	$v0, 1
	add	$a0, $0, $t0
	syscall