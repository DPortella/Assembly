.globl _start
.section .data

numberofnum:
	.quad 7
num:
	.quad 5, 20, 33, 80, 52, 10, 1
find:
	.quad 10

.section .text
_start:
	movq numberofnum, %rcx
	movq find, %rdx
	movq $0, %rdi
	cmp $0,%rcx
	je endloop

myloop:
	movq num - 8(, %rcx, 8), %rax
	cmp %rdx, %rax
	je endloop

loopcontrol:
	loopq myloop

endloop:
	movq %rcx, %rdi
	movq $60, %rax
	syscall
