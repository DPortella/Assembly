.globl main
.section .data
prompt:
	.ascii "Indique um numero:\n\0 "

scan:
	.ascii "%d\0 "

.section .text
	.equ LOCAL_NUMBER, -8

main:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp

loop:

	movq stdout, %rdi
	movq $prompt, %rsi
	movq $0, %rax
	call fprintf

	movq stdin, %rdi
	movq $scan, %rsi
	leaq LOCAL_NUMBER(%rbp), %rdx
	movq $0, %rax
	call fscanf

	movq LOCAL_NUMBER(%rbp), %rdi
	call evenodd

finish:
	jmp loop
