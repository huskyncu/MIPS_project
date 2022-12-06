.text
    .globl  main

# INPUT
main:
        li 	$v0, 4
        la 	$a0, input
        syscall
        
        li 	$v0, 5
        syscall
        move 	$s0, $v0        # $s0 = input

# CHECK IF INPUT > 1 (TODO: fill this procedure as an exercise)
L1:
        addi $s2,$zero,1        # Let $s2=1
        ble $s0,$s2,Else        # If input<=1, jump to Else ,or continue.
        j L2                    # It means s0 is bigger than 1, jump to L2
Else:   j L3                    # Jump to L3 to print false.



# FOR LOOP INPUT > 1 (TODO: fill this procedure as an exercise)
L2:
        addi $s4,$zero,0        #Let s4=0.
        addi, $s2 , $s2,1       #Let add 1 to s2.
        div $t0,$s0,$s2         #Let t0/s0=s2.
        mul $t1,$t0,$s2         #Let t1=t0*t2.
        sub $t2, $s0, $t1	#Let t2=s0-t1.
        bne $t2, $s4,L2         #Let t2=s0-t1.
beq $s0, $s2, L4                #If s0=s2, means it is a prime number, we jump to L4 to print ture. 
	j L3                    #If s0<s2, means it is not a prime number, we jump to L3 to print false.
        
#PRINT OUTPUT (FALSE)
L3:
        li      $v0, 4
        la      $a0, false
        syscall

        j Exit

#PRINT OUTPUT (TRUE)
L4:
        li      $v0, 4
        la      $a0, true
        syscall

        j Exit

#EXIT
Exit:
        li      $v0, 10
        syscall	

        .data
input:	.asciiz "Input: "
true: 	.asciiz "True"
false:  .asciiz "False"