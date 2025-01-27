.globl _start
.section .data
string:
	.ascii "This is my string\0"

.section .text

_start:
	movq $-1, %rcx
	movq $string, %rdi
	movb $0, %al
	repne scasb
	subq $string, %rdi
	decq %rdi
	movq $60, %rax
	syscall
