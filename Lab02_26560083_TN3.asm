# Lab02_26560083_TN3.asm - Name, Student ID
# Purpose: Listing 5 (bytes of a string), Listing 6 (byte order),
#          Listing 7 (lb and lbu), Listing 8 (capital letters in a string)
# Register plan: $s0 = address of the data being examined, $t0-$t4 = loaded values

.data
word1: .asciiz "Hi!"
w:     .word 0x41424344
b1:    .byte 0xF0
str1:  .asciiz "nguyen van an"
tag:   .asciiz " [end]"
nl:    .asciiz "\n"

.text
.globl main
main:
    # ---------- Listing 5: the bytes of a string ----------
    la   $s0, word1       # $s0 = address of the first byte
    lb   $t0, 0($s0)      # 'H' = 0x48
    lb   $t1, 1($s0)      # 'i' = 0x69
    lb   $t2, 2($s0)      # '!' = 0x21
    lb   $t3, 3($s0)      # 0x00 (end of string)
    li   $v0, 11          # service 11: print one character
    add  $a0, $t1, $zero  # the byte that was loaded into $t1
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # ---------- Listing 6: one word, four bytes ----------
    la   $s0, w
    lb   $t0, 0($s0)      # byte at offset 0 -> 0x44 (little-endian)
    lb   $t1, 1($s0)      # byte at offset 1 -> 0x43
    lb   $t2, 2($s0)      # byte at offset 2 -> 0x42
    lb   $t3, 3($s0)      # byte at offset 3 -> 0x41
    lw   $t4, 0($s0)      # the whole word -> 0x41424344

    # ---------- Listing 7: lb and lbu ----------
    la   $s0, b1
    lb   $t0, 0($s0)      # sign-extended   -> 0xFFFFFFF0 (-16)
    lbu  $t1, 0($s0)      # zero-extended   -> 0x000000F0 (240)

    # ---------- Listing 8: capital letters by hand ----------
    la   $s0, str1        # $s0 = address of str1

    lb   $t0, 0($s0)      # 'n'
    addi $t0, $t0, -32    # 'N'
    sb   $t0, 0($s0)

    lb   $t0, 7($s0)      # 'v'
    addi $t0, $t0, -32    # 'V'
    sb   $t0, 7($s0)

    lb   $t0, 11($s0)     # 'a'
    addi $t0, $t0, -32    # 'A'
    sb   $t0, 11($s0)

    li   $v0, 4           # service 4: print the string that starts at $a0
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10          # exit
    syscall