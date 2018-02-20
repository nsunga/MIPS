 .eqv     Counter, 5
	  .data
Array:    .word    1000, 1000, 1000, 1000, 1000
Result:   .asciiz  "Result: "

          .text
          la     $a0, Array      # Load the array as the first arg
          la     $a1, Counter    # Load the counter as the second arg
          
          addi   $sp, $sp, -4     # Make room in the stack POTENTIALLY DONT NEED THIS
          jal    SqotS            # Call Square of Sum
          la     $s1, ($v0)       # Save result to $s1
          jal    SotSq            # Call Sum of Squares
          la     $s2, ($v0)       # Save result to $s2
          sub    $v0, $s1, $s2    # Subtract $s1 - $s2 and put it in $v0
          lw     $ra, 0($sp)      # Restore $ra
          
          la     $s0, ($v0)      # Store result in $t0
          la     $a0, Result     # Load the "informative text string" as an arg
          li     $v0, 4          # Syscall 4 is a string printer
          syscall                # Print the "informative text string"
          la     $a0, ($s0)      # Load the result as an arg
          li     $v0, 1          # Syscall 1 is a printer
          syscall                # Print the result
          li     $v0, 10         # Syscall 10 is exit
          syscall                # Exit the program
          
SqotS:    add    $t1, $0, $0      # Clear $t1 
          la     $t2, ($a0)       # Load the array to $t2
          la     $t4, ($a1)       # Initialize the counter to $t4
loop1:    lw     $t3, 0($t2)      # Load the array item in $t3
          add    $t1, $t1, $t3    # Add the array item into $t1
          add    $t2, $t2, 4      # Update array index
          add    $t4, $t4, -1     # Decrement counter
          bne    $t4, $0, loop1   # Loop if counter not zero
          mult   $t1, $t1         # Square the sum
          mflo   $v0              # Load the result into $v0
          jr     $ra              # Return to caller
          
SotSq:    add    $t1, $0, $0      # Clear $t1
          la     $t2, ($a0)       # Load the array to $t2
          la     $t4, ($a1)       # Initialize the counter to $t4
loop2:    lw     $t3, 0($t2)      # Load the first array item in $t3
          mult   $t3, $t3         # Square the array item
          mflo   $t5              # Load the result into $t5
          add    $t1, $t1, $t5    # Add the squared value to $t1
          add    $t2, $t2, 4      # Update array index
          add    $t4, $t4, -1     # Decrement counter
          bne    $t4, $0, loop2   # Loop if counter not zero
          add    $v0, $0, $t1     # Load result to $v0
          jr     $ra              # Return to caller
          
          # Registers used:
          # $a0: stores the first argument for function calls (the array)
          # $a1: stores the second argument for function calls (the counter)
          # $s0: stores the result of the subtract fcuntion
          # $s1: stores the result of the SqotS function
          # $s2: stores the result of the SotSq function 
          # $v0: used to change syscalls and the store the return value of function calls
          # $sp: stores the stack pointer
          # $ra: store the return address of a function call
          # $t1: used to store preliminary result of SotSq and SqotS functions
          # $t2: used to store the array in SotSq and SqotS
          # $t3: used to store a single index of the array in both functions
          # $t4: used to store the counter
          # $t5: used to store mult result in SotSq
          
          

