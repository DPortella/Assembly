.globl _start
.section .data
string:
	.ascii "Hello there!\n"

end:
	.equ lenght, end - string

.section .text
_start:
	movq $10, %rbx

print:
	movq $1, %rax
	movq $1, %rdi
	movq $string, %rsi
	movq $lenght, %rdx
	syscall
	decq %rbx
	cmpq $0, %rbx
	jne print

	movq $60, %rax
	movq $0, %rdi
	syscall
