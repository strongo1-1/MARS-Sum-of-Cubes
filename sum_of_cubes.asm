.data # store string in data segment
	inp: .asciiz "Please input the integer: "
	str: .asciiz "The result is: "
	invalid: .asciiz "!!!Invalid, try again \n"
	outOfTries: .asciiz "Too many invalid attempts. Program terminated."
	
.text
.globl main

main:
	li   $v0,4        	# system call to print_string for input 
	la   $a0, inp
	syscall
			  	# system call code for read_int
	li $v0, 5	  	# read a integer from the console
	syscall
	
	blt $v0, 1, notValid	#if input is less than one, retry
	bgt $v0, 5, notValid	#if input is greater than 5, retry
	
	jal valid		#if valid input, jump to valid
	
	
notValid:
	addi $t0, $t0, 1	#create new temp variable $t0, or add 1 to $t0
	bgt $t0, 2, noTries
	
	li   $v0,4        	# system call to print_string for input 
	la   $a0, invalid
	syscall
	
	jal retry
	
	
retry:
	li   $v0,4        	# system call to print_string for input 
	la   $a0, inp
	syscall
			  	# system call code for read_int
	li $v0, 5	  	# read a integer from the console
	syscall
	
	blt $v0, 1, notValid	#if input is less than one, retry
	bgt $v0, 5, notValid	#if input is greater than 5, retry
	
	jal valid
	
	
valid:
	move $a1, $v0		#save contents of $v0 into $a1
	beq $a1, 5, five
	beq $a1, 4, four
	beq $a1, 3, three
	beq $a1, 2, two
	beq $a1, 1, one
	
	
noTries:
	li   $v0,4        	# system call to print_string for out of tries 
	la   $a0, outOfTries
	syscall
	
	j exit
	
			
exit:
	li $v0, 10		#exit
	syscall
	
	
five:
	addi $t3, $zero, 225
	li   $v0,4        	# system call to print_string for printing result 
	la   $a0, str
	syscall
	
	li   $v0, 1        	# system call to print_int
	move $a0, $t3
	syscall
	
	j exit
	
	
four:
	addi $t3, $zero, 100
	li   $v0,4        	# system call to print_string for printing result 
	la   $a0, str
	syscall
	
	li   $v0, 1        	# system call to print_int
	move $a0, $t3
	syscall
	
	j exit
	
	
three:
	addi $t3, $zero, 36
	li   $v0,4        	# system call to print_string for printing result 
	la   $a0, str
	syscall
	
	li   $v0, 1        	# system call to print_int
	move $a0, $t3
	syscall
	
	j exit
	
	
two:
	addi $t3, $zero, 9
	li   $v0,4        	# system call to print_string for printing result 
	la   $a0, str
	syscall
	
	li   $v0, 1        	# system call to print_int
	move $a0, $t3
	syscall
	
	j exit
	

one:
	addi $t3, $zero, 1
	li   $v0,4        	# system call to print_string for printing result 
	la   $a0, str
	syscall
	
	li   $v0, 1        	# system call to print_int
	move $a0, $t3
	syscall
	
	j exit