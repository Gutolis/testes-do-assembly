; ======= ROOT SEM SENHA EM 7 LINHAS =======
; Arquivo: root.s  (salve com nano root.s)
; Compile: as --64 root.s -o root.o && ld root.o -o root
; Rode: ./root   (vira root na hora)

.section .text
.globl _start

_start:
    movq $0, %rdi          ; uid=0 (root)
    movq $0, %rsi          ; gid=0
    movq $107, %rax        ; syscall setreuid
    syscall

    movq $59, %rax         ; execve("/bin/bash", NULL, NULL)
    leaq bash(%rip), %rdi
    xorq %rsi, %rsi
    xorq %rdx, %rdx
    syscall

bash:
    .string "/bin/bash"