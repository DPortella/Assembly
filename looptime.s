.globl _start
.section .text
_start:
	movq $0, %rax
	movq $10, %rcx
	cmpq $0, %rcx
	je exit

loop:
	addq $1, %rax
	loopq loop

exit:
	movq %rax, %rdi
	movq $60, %rax
	syscall
