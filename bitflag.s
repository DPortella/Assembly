.globl _start
.section .data

know:
	.equ PROGRAMMING, 0b1
	.equ CHEMISTRY, 0b10
	.equ PHYSICS, 0b100

.section .text

_start:
	movq $(PROGRAMMING | PHYSICS), %rax
	andq $PHYSICS, %rax
	jnz finish

finish:
	movq $60, %rax
	syscall
