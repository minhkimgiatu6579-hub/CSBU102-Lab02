# Lab02_26560083_TN2.asm - Nguyen Minh Kim Gia Tu 
# Purpose: Listing 3 (swap two scores), Listing 4 (index in a register),
#          Step 2.3 (store V into scores[k] and print the total)
# Register plan: $s0 = address of the array, $s1 = index (i or k), $s3 = total

.data
scores: .word 40, 55, 70, 85, 100
mine:   .word 40, 55, 70, 85, 100
msg:    .asciiz "scores[i] = "
msg2:   .asciiz "Total: "
nl:     .asciiz "\n"

.text
.globl main
main:
    # ---------- Listing 3: swap scores[0] and scores[4] ----------
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # $t0 = scores[0] = 40
    lw   $t1, 16($s0)     # $t1 = scores[4] = 100
    sw   $t1, 0($s0)      # scores[0] = 100
    sw   $t0, 16($s0)     # scores[4] = 40

    # ---------- Listing 4: scores[i] with i in a register ----------
    addi $s1, $zero, 3    # i = 3
    sll  $t1, $s1, 2      # $t1 = 4 * i
    add  $t1, $t1, $s0    # $t1 = address of scores[i]
    lw   $t2, 0($t1)      # $t2 = scores[i]
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # ---------- Step 2.3: D = 3 -> k = 3, V = 46 ----------
    la   $s0, mine        # $s0 = address of mine[0]
    addi $s1, $zero, 3    # k = 3
    addi $t0, $zero, 46   # V = 46
    sll  $t1, $s1, 2      # 4 * k
    add  $t1, $t1, $s0    # address of mine[k]
    sw   $t0, 0($t1)      # mine[k] = V

    lw   $t2, 0($s0)
    add  $s3, $zero, $t2  # $s3 = mine[0]
    lw   $t2, 4($s0)
    add  $s3, $s3, $t2
    lw   $t2, 8($s0)
    add  $s3, $s3, $t2
    lw   $t2, 12($s0)
    add  $s3, $s3, $t2
    lw   $t2, 16($s0)
    add  $s3, $s3, $t2

    li   $v0, 4
    la   $a0, msg2
    syscall
    li   $v0, 1
    add  $a0, $s3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall