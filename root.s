.section .text
.globl _start
_start:
    /* setpriority(PRIO_PROCESS, 0, -10) → syscall 140 */
    xor     %rdi, %rdi      /* which = 0 */
    xor     %rsi, %rsi      /* who   = 0 (current process) */
    mov     $-10, %rdx      /* prio  = -10 */
    mov     $140, %rax      /* syscall setpriority */
    syscall

    /* execve("/bin/bash", NULL, NULL) */
    mov     $59, %rax
    lea     path(%rip), %rdi
    xor     %rsi, %rsi
    xor     %rdx, %rdx
    syscall

path:
    .string "/bin/bash"
