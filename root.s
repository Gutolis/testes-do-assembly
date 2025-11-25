
.section .text
.globl _start
_start:
    xor     %rdi, %rdi
    xor     %rsi, %rsi
    mov     $-10, %rdx      # -10 = máxima prioridade sem root
    mov     $140, %rax      # 140 = setpriority (correto!)
    syscall

    mov     $59, %rax       # execve
    lea     path(%rip), %rdi
    xor     %rsi, %rsi
    xor     %rdx, %rdx
    syscall

path:
    .string "/bin/bash"
