.globl iter
.type iter, @function

.section .data
prompt:
	.ascii "Deseja fazer de novo?(Digite `S` para sim e `N` para nao)\n\0"
scan:
	.ascii " %c\0"
debug:
	.ascii "Lido: %c\n\0"

.section .text
	.equ ITER_P, -1

iter:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp


	movq stdout, %rdi
	movq $prompt, %rsi
	movq $0, %rax
	call fprintf

	movq stdin, %rdi
	movq $scan, %rsi
	leaq ITER_P(%rbp), %rdx
	movq $0, %rax
	call fscanf

#	cmpq $q, %rax
#	jne .error_read

	movq $debug, %rdi
	movsbl ITER_P(%rbp), %esi
	movq $0, %rax
	call printf

	movb ITER_P(%rbp), %al
	cmpb $'S', %al
	je call_main
	cmpb $'s', %al
	je call_main
	cmpb $'N', %al
	je finish
	cmpb $'n', %al
	je finish
	jmp iter

call_main:
	call main


finish:

	leave
	ret
