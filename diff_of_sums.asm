.text
	main:
		addi 	$a0, $0, 4
		addi	$a1, $0, 10
		addi	$a2, $0, 6
		addi	$a3, $0, 6
		jal	diff_of_sums
	
		li	$v0, 1
		add	$s1, $0, $t0
		add	$a0, $0, $s1
		syscall
		li	$v0, 10
		syscall
	
	diff_of_sums:
		add	$t1, $a0, $a1
		add	$t2, $a2, $a3
		sub	$t0, $t1, $t2
		jr	$ra