.section .text
.globl _start
_start:
	movq $0b101, %rdi
	movq $60, %rax
	syscall
