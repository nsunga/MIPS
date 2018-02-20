.data
    var: .word 25
.text   
    main:
        li $v0, 9
        lw $a0, var
        syscall                 # DYNAMICALLY ALLOCATING MEMORY OF SIZE 4 BYTES AT ADDRESS OF VAR
        sw $v0, var

        li $v0, 10
        syscall
