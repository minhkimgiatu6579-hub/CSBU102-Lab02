# Lab02_26560083_TN1.asm - Nguyen Minh Kim Gia Tu 
# Purpose: Listing 1 (varA = varB + varC in memory) and
#          Listing 2 (base + offset on an array of scores)
# Register plan: $t0 = base address (Listing 1), $s0 = address of scores[0] (Listing 2)

.data
varB:   .word 25
varC:   .word 17
varA:   .word 0
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    # ---------- Listing 1 ----------
    la   $t0, varB        # $t0 = address of varB
    lw   $t1, 0($t0)      # $t1 = varB
    lw   $t2, 4($t0)      # $t2 = varC
    add  $t3, $t1, $t2    # $t3 = varB + varC
    sw   $t3, 8($t0)      # varA = $t3

    # ---------- Listing 2 ----------
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # (1)
    lw   $t1, 4($s0)      # (2)
    lw   $t2, 16($s0)     # (3)
    addi $s1, $s0, 8      # (4) $s1 = $s0 + 8
    lw   $t3, 0($s1)      # (5)
    lw   $t4, -4($s1)     # (6)

    li   $v0, 10          # exit
    syscall