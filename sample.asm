
# Kaveh Khorram

.data
    firstNumberPrompt:  .asciiz "Enter the first number"
    secondNumberPrompt: .asciiz "\nEnter the second number"
    thirdOperationPrompt: .asciiz "\nEnter the operation type"
    result: .asciiz "\nThe result is: "
.text
main:
    # Prompt the user to enter first number
    li $v0, 4
    la $a0, firstNumberPrompt
    syscall

    # Get the first number.
    li $v0, 5
    syscall

    # store the result in $t0.
    move $t0, $v0

    # Prompt the user to enter the second number
    li $v0, 4
    la $a0, secondNumberPrompt
    syscall

    # Get the second number
    li $v0, 5
    syscall

    # store the result in $t1
    move $t1, $v0

    # Prompt the user for the operation type
    li $v0, 4
    la $a0, thirdOperationPrompt
    syscall

    # Get the operation type
    li $v0, 5
    syscall

    # Store the result in $t2
    move $t2, $v0

    # Where the meat of the code will go.
    addi $t8, $zero, 0 # add
    addi $t9, $zero, 1 # sub
    beq $t8, $t2, Add
    beq $t9, $t2, Sub
    j Mul

    Add:
    add $s0, $t0, $t1
    j PRINT_THEN_EXIT
    Sub:
    sub $s0, $t0, $t1
    j PRINT_THEN_EXIT
    Mul:
    mul $s0, $t0, $t1
    j PRINT_THEN_EXIT
    
    PRINT_THEN_EXIT:
    # Print string
    li $v0, 4
    la $a0, result
    syscall
    # Print number
    li $v0, 1
    move $a0, $s0
    syscall
    # EXIT
    li $v0, 10
    syscall
