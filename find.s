.globl _start
.section .data

numberofnum:
	.quad 7
num:
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	movq numberofnum, %rcx
	movq $num, %rdi
	movq $5, %rax
	repne scasq

finish:
	movq %rcx, %rdi
	movq $60, %rax
	syscall
