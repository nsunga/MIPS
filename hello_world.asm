.data
	hello_world: .asciiz "\nHello FUCCS"
	
.text
	li $v0, 1
	addi $s0, $0, 1
	addi $s1, $0, 0
	addi $s2, $0, 128
	
	while: beq $s0, $s2, fuck_you
		sll $s0, $s0, 1
		addi $s1, $s1, 1
		j while
	fuck_you:
	
	add $a0, $0, $s1
	syscall
	
	and $a0, 0 #unsure if I need to reset this tbh

	li $v0, 4
	la $a0, hello_world
	syscall