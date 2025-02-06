.globl main
.section .data
input:
	.ascii "Indique um numero:\n\0"
scan:
	.ascii "%d\0"
output:
	.ascii "%d\n\0"

.section .text

	.equ NUM_P, -8

main:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq stdout, %rdi
	movq $input, %rsi
	movq $0, %rax
	call fprintf

	movq stdin, %rdi
	movq $scan, %rsi
	leaq NUM_P(%rbp), %rdx
	movq $0, %rax
	call fscanf

	movq NUM_P(%rbp), %rax
	call mainfunc
	movq %rax, NUM_P(%rbp)

	movq stdout, %rdi
	movq $output, %rsi
	movq NUM_P(%rbp), %rdx
	movq $0, %rax
	call fprintf

	call iter

	leave
	ret
