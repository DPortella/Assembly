.globl _start
.section .data
num:
	.quad 8
par:
	.ascii "O numero e par!\n"
parfim:
	.equ tamanhopar, parfim - par

impar:
	.ascii "O numero e impar!\n"
imparfim:
	.equ tamanhoimpar, imparfim - impar

.section .text
_start:
	movq num, %rax
	movq $2, %rbx
	divq %rbx
	cmpq $0, %rdx
	je even

odd:
	movq $1, %rax
	movq $1, %rdi
	movq $impar, %rsi
	movq $tamanhoimpar, %rdx
	syscall
	jmp finish


even:
	movq $1, %rax
	movq $1, %rdi
	movq $par, %rsi
	movq $tamanhopar, %rdx
	syscall


finish:
	movq $60, %rax
	movq $0, %rdi
	syscall
