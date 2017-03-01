################# Data segment #####################
.data

################# Code segment #####################
.text
.globl main

#for (i = 0; i < n ‐ 1 ; i ++)
#{
#    for (j = 0; j < n – i ‐1; j ++)
#    {
#        If (array[j] > array[j+1]
#        {
#           temp = array[j];
#           array[j] = array[j+1];
#           array[j+1] = temp;
#        }
#    }
#}

# Variable Key:
# $s0 = n
# $s1 = i
# #s2 = j
# #s3 = array base address

main: 
      