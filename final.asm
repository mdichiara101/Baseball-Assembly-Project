.data
space: .asciiz " "
newline: .asciiz "\n"
tab_space: .asciiz "\t"
msg_01: .asciiz "STRIKE OUT\n"
msg_02: .asciiz "Would you like to play a game?(Enter p for yes or q for no(exit program))\n"
msg_03: .asciiz "Enter a number\n"
msg_04: .asciiz "strikes: "
msg_05: .asciiz "balls: "
msg_06: .asciiz "Goodbye \n"
msg_07: .asciiz "Trial: "
.text
main:   la $a0, msg_07
		li $v0, 4
		syscall
		
		addi $s0, $s0, 1
		li $v0,1     
		move $a0,$s0 
		syscall      
		
		la $a0, newline
		li $v0, 4
		syscall
		
		la $a0, msg_02
		li $v0, 4
		syscall

		li $v0, 12
		syscall

		
		li $t1, 'p'
		beq $v0, $t1, UserA
		
		li $v0, 10
		syscall


UserA:  la $a0, msg_03 #user input
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $s1, $v0
		
		
		la $a0, msg_03 #user input
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $s2, $v0
		
		
		la $a0, msg_03 #user input
		li $v0, 4
		syscall

		li $v0, 5
		syscall
		move $s3, $v0

		
		li $t6, 7    
		li $t7, 11
		
		mult $s1, $t6   #random number generator
		mflo $t1
		div $t1, $t7
		mfhi $t1
		move $s5, $t1
		
		
		mult $s2, $t6
		mflo $t2
		div $t2, $t7
		mfhi $t2
		move $s6, $t2
	
		mult $s3, $t6
		mflo $t3
		div $t3, $t7
		mfhi $t3
		move $s4, $t3  
		
		li $s7, 0
		
		
		jal Check
		

Check:  beq $s1, $s4, strike  #checks if theres strikes or balls
		beq $s2, $s5, strike
		beq $s3, $s6, strike
	
	
		la $a0, msg_04
		li $v0, 4
		syscall
	
		li $v0,1     
		move $a0,$s7 
		syscall      
	
		la $a0, newline
		li $v0, 4
		syscall
        
		li $t0, 3
		beq $s7, $t0, strikeOut
		
   	 	li $s7, 0
   	 	beq $s1, $s5, ball
   	 	beq $s1, $s6, ball
   	 	beq $s2, $s4, ball
   	 	beq $s2, $s6, ball
   	 	beq $s3, $s4, ball
   	 	beq $s3, $s5, ball

	
   	 	la $a0, msg_05
   	 	li $v0, 4
   	 	syscall
	
   	 	li $v0,1     #prepare system call
   	 	move $a0,$s7 #copy t0 to a0
   	 	syscall      #print integer
	
   	 	la $a0, newline
   	 	li $v0, 4
   	 	syscall
	
   	 	jal main	

strike: add $s7, $s7, 1  #strike counter
	

ball: add $s7, $s7, 1 #ball counter
		

				
strikeOut:  la $a0, msg_01 #prints STRIKE OUT
			li $v0, 4
			syscall

			jal main


