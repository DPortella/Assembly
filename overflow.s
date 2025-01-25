.globl _start
.section .text

_start:
	movb $125, %al
	movb $1, %ah
	addb %al, %ah
	jo over

notover:
	movq $0, %rdi
	movq $60, %rax
	syscall

over:
	movq $1, %rdi
	movq $60, %rax
	syscall
