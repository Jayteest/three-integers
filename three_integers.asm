#####################################################################
# Programmer: Jacob St Lawrence
# Last Modified: 03.08.2023
#####################################################################
# Functional Description:
# This program prompts the user to input 3 integer values.
# It then calculates and displays the sum of the numbers,
# the product of the numbers, the average of the numbers,
# the smallest number, and the greatest number.
#####################################################################
# Pseudocode:
# 	print prompt string
#	cin >> s0 >> s1 >> s2
#	print nums string
#	cout << s0 << spaces << s1 << spaces << s2
# add:
#	s3 = s0 + s1
#	s3 = s3 + s2
#	print sum string
#	print sum
# multiply:
#	s4 = s0 * s1
#	s4 = s4 * s2
#	print prod string
#	print product
# average:
#	s5 = sum / 3
#	print avg string
#	print average
# smallest:
#	t0 = s0
#	if t0 < s1; branch to L1
#	else t0 = s1
# L1:
#	if t0 < s2: branch to Ldone
#	else t0 = s2
# Ldone:
#	print least string
#	print smallest number t0
# greatest:
#	t1 = s0
#	if t1 > s1: branch to G1
#	else t1 = s1
# G1:
#	if t1 > s2; branch to Gdone
#	else t1 = s2
# Gdone:
#	print great string
#	print greatest number t1
# exit:
#	print bye string
# 	terminate program
######################################################################
# Register Usage:
# $s0: First Input Integer
# $s1: Second Input Integer
# $s2: Third Input Integer
# $s3: Sum of Integers
# $s4: Product of Integers
# $s5: Average of Integers
# $t0: Smallest Number
# $t1: Greatest Number
######################################################################


	.data
prompt:	.asciiz	"Please enter 3 numbers (press ENTER after each): "
nums:	.asciiz	"You entered: "
spaces:	.asciiz	"  "
sum:	.asciiz "\nThe sum is: "
prod:	.asciiz "\nThe product is: "
avg:	.asciiz "\nThe average is: "
least:	.asciiz "\nThe smallest is: "
great:	.asciiz "\nThe greatest is: "
bye:	.asciiz "\n**** Goodbye! ****"

	.text
main:
	li	$v0, 4		# system call code to print string
	la	$a0, prompt	# load prompt string into argument
	syscall			# print prompt string

	li	$v0, 5		# system call code to read integer input
	syscall			# read integer input

	move	$s0, $v0	# assign first input number into s0

	li	$v0, 5		# system call code to read integer input
	syscall			# read integer input

	move	$s1, $v0	# assign second input number into s1

	li	$v0, 5		# system call code to read integer input
	syscall			# read integer input

	move	$s2, $v0	# assign third input number into s2

	li	$v0, 4		# system call code to print string
	la	$a0, nums	# load nums string into argument
	syscall			# print nums string

	li	$v0, 1		# system call code to print integer
	move	$a0, $s0	# load first input number into argument
	syscall			# print first input number

	li	$v0, 4		# system call code to print string
	la	$a0, spaces	# load tab into argument
	syscall			# print tab

	li	$v0, 1		# system call code to print integer
	move	$a0, $s1	# load second input number into argument
	syscall			# print second input number

	li	$v0, 4		# system call code to print string
	la	$a0, spaces	# load tab into argument
	syscall			# print tab

	li	$v0, 1		# system call code to print integer
	move	$a0, $s2	# load third input number into argument
	syscall			# print third input number

# block to calculate and display sum of integers
add:
	addu	$s3, $s0, $s1	# add first and second number and place in s3
	addu	$s3, $s3, $s2	# add third number to sum in s3

	li	$v0, 4		# system call code to print string
	la	$a0, sum	# load sum string into argument
	syscall			# print sum string

	li	$v0, 1		# system call code to print integer
	move	$a0, $s3	# load sum (s3) into argument
	syscall			# print sum

# block to calculate and display product of integers
multiply:
	mul	$s4, $s0, $s1	# multiply first and second number and place in s4
	mul	$s4, $s4, $s2	# multiply product by third number

	li	$v0, 4		# system call code to print string
	la	$a0, prod	# load prod string into argument
	syscall			# print prod string

	li	$v0, 1		# system call code to print integer
	move	$a0, $s4	# load product (s4) into argument
	syscall			# print product

# block to calculate and display average of integers
average:
	div  	$s5, $s3, 3	# divide sum by 3 to calculate average and place in s5

	li	$v0, 4		# system call code to print string
	la	$a0, avg	# load avg string into argument
	syscall			# print avg string

	li	$v0, 1		# system call code to print integer
	move	$a0, $s5	# load quotient (s5) into argument
	syscall			# print quotient

# block to begin determination of smallest integer. Performs comparison between first and second integer.
smallest:
	move	$t0, $s0	# initialize t0 with first input number
	blt	$t0, $s1, L1	# if first number is less than second number, branch to next check (L1)
	move	$t0, $s1	# move second number into t0 if it was smaller

# block for comparison between smaller integer from first comparison and the third integer
L1:
	blt	$t0, $s2, Ldone	# if first number is less than third number, branch to Ldone
	move	$t0, $s2	# move third number into t0 if it was smaller

# block to display smallest integer
Ldone:
	li	$v0, 4		# system call code to print string
	la	$a0, least	# load least string into argument
	syscall			# print least string

	li	$v0, 1		# system call code to print integer
	move	$a0, $t0	# load smallest integer into argument
	syscall			# print smallest integer

# block to begin determination of greatest integer. Performs comparison between first and second integer.
greatest:
	move	$t1, $s0	# initialize t1 with first input number
	bgt	$t1, $s1, G1	# if first number is greater than second number, branch to next check (G1)
	move	$t1, $s1	# move second number into t1 if it was greater

# block for comparison between greater integer from first comparison and the third integer
G1:
	bgt	$t1, $s2, Gdone	# if first number is greater than third number, branch to Gdone
	move	$t1, $s2	# move third number into t1 if it was greater

# block to display greatest integer
Gdone:
	li	$v0, 4		# system call code to print string
	la	$a0, great	# load great string into argument
	syscall 		# print great string

	li	$v0, 1		# system call code to print integer
	move	$a0, $t1	# load greatest integer into argument
	syscall			# print greatest integer

# block to display goodbye message and terminate program
exit:
	li	$v0, 4		# system call code to print string
	la	$a0, bye	# load bye string into argument
	syscall			# print bye string

	li	$v0, 10		# system call code to terminate program
	syscall			# terminate program

				# END OF PROGRAM
