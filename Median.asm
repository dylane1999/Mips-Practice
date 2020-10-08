# MedianNumbers.asm program
#

.data

	# TODO: Complete these declarations / initializations

	prompt: .asciiz "Please enter value: \n"
	buffer: .space 4

	.asciiz "Median: "


#Text Area (i.e. instructions)
.text

 main:
 
 #FIRST INPUT
 
    # Printing out the text
   	 li $v0, 4
   	 la $a0, prompt
   	 syscall

    # Getting user input
  	  li $v0, 5
  	  syscall

    # Moving the integer input to another register
  	  move $8, $v0	#store first input A in $8




#SECOND INPUT
	
 # Printing out the text
   	 li $v0, 4
   	 la $a0, prompt
   	 syscall

    # Getting user input
  	  li $v0, 5
  	  syscall

    # Moving the integer input to another register
  	  move $9, $v0	#store input B in $9

    	  
    	  
#THIRD INPUT
	
 # Printing out the text
   	 li $v0, 4
   	 la $a0, prompt
   	 syscall

    # Getting user input
  	  li $v0, 5
  	  syscall

    # Moving the integer input to another register
  	  move $10, $v0	#store input C in $10
  	  

  	  jal function1
  	  


    	  

function1: 
	  	
	  sgt $11, $8, $9 #store result of is 8(a) > 9(b) \ if true $11 is 1
	  bne  $8, $11, function2   # cond1: branch if ! ( i == j ) 
	  move $t0, $8 # move a into t0 \ (int t = a)
	  move $8, $9 # move b(9) into a(8) \  int a = b 
	  move $9, $t0 # move t(t0) into b(8) \  int b = t
	  j function2
	  
function2:							
	  sgt $11, $9, $10 #store result of is b(9) > c(10) if true $11 is 1
	  bne  $8, $11, function3   # cond1: branch i ! ( i == j ) 
	  move $t0, $9 # move b into t0 \ int t = b;
	  move $9, $10 # move c into b \  b = c;
	  move $10, $t0 # move t(t0) into c \ c = t
	  j function3
	  
function3:					#    if (a > b) { int t = a; a = b; b = t; }
	  sgt $11, $8, $9 #store result of is b(9) > c(10) if true $11 is 1
	  bne  $8, $11, print   # cond1: branch i ! ( i == j ) 
	  move $t0, $8 # move a into t0 \ int t = a 
	  move $8, $9 # move b into a \  a = b;
	  move $9, $t0 # move b into t0 \ b = t
	  j print


print: 
	  	      # Printing out the median
   	  li $v0, 1
       	  move $a0, $9		 #move b into a0
    	  syscall    	      	  
	  j exit
	

exit:
	# TODO: Write code to properly exit a MARS simulation

