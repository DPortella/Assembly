.globl _start
.section .data
string:
	.ascii "Hello there!\n"
	.ascii "Hello world!\n"

end:
	.equ lenght, end - string

.section .text
_start:
	movq $1, %rax
	movq $1, %rdi
	movq $string, %rsi
	movq $lenght, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall
