#Daniel Sjarif
#HW6 EE 385
#3/1/2017
	
			.eqv	N, 5
.data 
Array: .word 	200, 1, 100, 1, 2 	
prompt: .asciiz "Hello! SQOTS - SOTSQ = "


.text

#Calls the first function 
main: 

	li	$v0, 4 			
	la 	$a0, prompt	
	syscall			#prints out the prompt to follow with the result
	la	$a0, Array
	jal     fun1
	
#prints out the prompt to follow with the result
print:
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
		
fun1:
	jal	sqots		#calls and jumps to fun2, sqots 
	jal 	sotsq		#after computing sqots and storing it in $s0, it calls and jumps to fun3, sotsq
	sub 	$a0, $s0, $s1 	#subtracts the values of sqots and sotsq (stored in registers $s0 and $s1 respectively)
	jal	print		#jumps to print to print out the value only
	
#function 1
sqots:  add	$t1, $0, $0	#Opens up a temporary register, initializes it to 0 to later store the value that is calculated from the loop below
	add	$t2, $a0, $0	#Opens up a temporary register, initializes it to 0. Sets up a counter that counts through the elements in the array
	addi	$t4, $t4, N	#Sets up a counter that will decrement N

#loops through the array, sums the values in the array and then squares the result
loop1:	lw      $t3, 0($t2)	#loads elements of the array into t3
	add     $t1, $t1, $t3	#adds the elements of the array
	addi	$t2, $t2, 4	#increment address
	addi	$t4, $t4, -1	#decrements the N counter
	bne	$t4, $0, loop1	#if the N counter != 0, go back to loop1 (loop again), else go to next line
	mul	$s0, $t1, $t1	#multiplies the values of t1 to itself, squaring that value
	jr	$ra 		#stores value in return address

#function 2 	
sotsq: add      $t1, $0, $0	#Opens up a temporary register, initializes it to 0 to later store the value that is calculated from the loop below
       add	$t2, $a0, $0	#Opens up a temporary register, initializes it to 0. Sets up a counter that counts through the elements in the array
       addi	$t4, $t4, N	#Sets up a counter that will decrement N
       
#loops through the array, squares the values in the array and then sums the squares	
loop2:  lw      $t3, 0($t2)	#loads elements of the array into t3
        mul     $t3, $t3, $t3	#squares the elements of the array
	add     $t1, $t1, $t3	#adds the squared values together
	addi	$t2, $t2, 4	#increment address
	addi	$t4, $t4, -1	#decrements the N counter
	bne	$t4, $0, loop2	#if the N counter != 0, go back to loop2 (loop again), else go to next line
	move	$s1, $t1	#moves the final value stored in t1 into s1
	jr	$ra 		#stores value in return address