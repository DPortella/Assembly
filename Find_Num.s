.globl _start
.section .data

numberofnum:
	.quad 7
num:
	.quad 5, 20, 33, 80, 52, 10, 1
find:
	.quad 7

.section .text
_start:
	movq numberofnum, %rcx
	movq $0, %rbx
	movq $0, %rdi
	movq find, %rdx
	cmp $0,%rcx
	je notfound

myloop:
	movq num(, %rbx, 8), %rax
	cmp %rdx, %rax
	je found

loopcontrol:
	incq %rbx
	loopq myloop

notfound:
	movq $0, %rdi
	movq $60, %rax
	syscall

found:
	movq $1, %rdi
	movq $60, %rax
	syscall
