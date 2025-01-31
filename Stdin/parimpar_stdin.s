.globl main
.section .data
prompt:
	.ascii "Indique um numero:\n\0 "

scan:
	.ascii "%d\0 "

par:
	.ascii "O numero e par!\n\0 "

impar:
	.ascii "O numero e impar!\n\0 "

.section .text
	.equ LOCAL_NUMBER, -8

main:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp

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
	cmpq $0, %rax
	jne even

odd:
	movq stdout, %rdi
	movq $impar, %rsi
	movq %rax, %rdx
	movq $0, %rax
	call fprintf
	jmp finish


even:
	movq stdout, %rdi
	movq $par, %rsi
	movq %rax, %rdx
	movq $0, %rax
	call fprintf

finish:
	leave
	ret
