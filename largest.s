.globl _start
.section .data

numberofnum:
	.quad 7
num:
	.quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
	movq numberofnum, %rcx
	leaq num, %rbx
	movq $2, %rdi
	cmp $0,%rcx
	je endloop

myloop:
	movq (%rbx), %rax
	cmp %rdi, %rax
	jge loopcontrol
	movq %rax, %rdi

loopcontrol:
	addq $8, %rbx
	loopq myloop

endloop:
	movq $60, %rax
	syscall
