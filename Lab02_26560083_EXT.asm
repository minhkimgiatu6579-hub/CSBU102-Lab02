# Lab02_26560083_EXT.asm - Nguyen Minh Kim Gia Tu 
# Purpose: mark X (1) in cell (1,2) and O (2) in cell (2,0) of a 3x3 board
# Register plan: $s0 = address of board, $s1 = r, $s2 = c, $t0 = cell address

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board

    # ---------- cell (1,2) <- 1 ----------
    addi $s1, $zero, 1        # r = 1
    addi $s2, $zero, 2        # c = 2
    sll  $t0, $s1, 1          # 2r
    add  $t0, $t0, $s1        # 3r
    add  $t0, $t0, $s2        # 3r + c
    sll  $t0, $t0, 2          # 4 * (3r + c)
    add  $t0, $t0, $s0        # address of the cell
    addi $t1, $zero, 1
    sw   $t1, 0($t0)

    # ---------- cell (2,0) <- 2 ----------
    addi $s1, $zero, 2        # r = 2
    addi $s2, $zero, 0        # c = 0
    sll  $t0, $s1, 1
    add  $t0, $t0, $s1
    add  $t0, $t0, $s2
    sll  $t0, $t0, 2
    add  $t0, $t0, $s0
    addi $t1, $zero, 2
    sw   $t1, 0($t0)

    li   $v0, 10
    syscall