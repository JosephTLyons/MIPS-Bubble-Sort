# Title: Homework 4 part 7 - bonus		    #Filename: Part7.asm
# Author: Joseph Lyons				    #Date: March 1st, 2017
# Description: Bubble sort
# Input: None
# Output: None
################# Data segment #####################
.data

################# Code segment #####################
.text
.globl main

# for (i = 0; i < n ‐ 1 ; i ++)
# {
#     for (j = 0; j < n – i ‐1; j ++)
#     {
#         If (array[j] > array[j+1]
#         {
#            temp = array[j];
#            array[j] = array[j+1];
#            array[j+1] = temp;
#         }
#     }
# }

# Variable Key:
# $s0 = n
# $s1 = i
# $s2 = j
# $s3 = array base address
# $t0 = n - 1
# $t1 = 0 or 1 in true false statements (slt) - outer loop
# $t2 = $t0 - 1 (n - i - 1)
# $t3 = 0 or 1 in true false statements (slt) - inner loop
# $t4 = j * 4 = actual array location

main: 
        # Loading values to test bubble sort
        addi $s0, $zero, 5  # n numbers in array
        addi $t1, $zero, 78 # Random numbers are being stored in sequential memory
        addi $sp, $sp, -20
        
        addi $t1, $s0, -44
        sw   $t1, 16($sp)
        addi $t1, $s0, 233
        sw   $t1, 12($sp)
        addi $t1, $s0, -9
        sw   $t1, 8($sp)
        addi $t1, $s0, -23
        sw   $t1, 4($sp)
        addi $t1, $s0, 45
        sw   $t1, 0($sp)
        add  $s3, $sp, $zero   # Load base address into $s3

        # Bubble sort program starts here
        add  $s1, $zero, $zero # Initialize i to zero
        addi $t0, $s0,   -1    # $t0 = n - 1
Outer:  slt  $t1, $s1,   $t0   # i < n - 1
        beq  $t1, $zero, Exit  # Exit when i >= n - 1
        
        add  $s2, $zero, $zero # Initialize i to zero
        sub  $t2, $t0,   $s1   # $t2 = (n - i - 1)
Inner:  slt  $t3, $s2,   $t2   # j < (n - i - 1)
        beq  $t3, $zero, Leave # Exit when j >= (n - i - 1)
        
        sll  $t4, $s2, 2       # j * 4
        
        add  $t5, $s3, $t4     # Compare array[j] > array[j + 1]
        lw   $t6, 0($t5)
        lw   $t7, 4($t5)
        slt  $t8, $t7, $t6
        beq  $t8, $zero, Skip
        
        add  $t9, $t6, $zero   # Perform swap
        sw   $t7, 0($t5)
        sw   $t9, 4($t5)

Skip:   addi $s2, $s2, 1       # Increment j for inside loop
        j Inner               
        
Leave:  addi $s1, $s1, 1       # Increment i for outside loop
        j Outer
      
Exit: