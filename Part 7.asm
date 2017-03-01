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
# $t1 = 0 or 1 in true false statements (slt)

main: 
      # Temp values to test program
        addi $s0, $zero, 3
        addi $t9, $zero, 15 # Random numbers are being stored in sequential memory
        addi $t0, $s0, 2
        sw   $t0, 0($sp)
        addi $t0, $s0, 2
        sw   $t0, -4($sp)
        addi $t0, $s0, -19
        sw   $t0, -8($sp)
        la   $t3, 0($sp)

        # Program actually starts here
        add  $s1, $zero, $zero # Initialize i to zero
        addi $t0, $s0,   -1    # $t0 = n - 1
 Outer: slt  $t1, $s1,   $t0   # i < n - 1
        beq  $t1, $zero, Exit  # Exit when i >= n - 1
        
        
        
        addi $s1, $s1, 1      # Increment i
        j Outer
      
Exit: