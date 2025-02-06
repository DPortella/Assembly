.globl main
.section .data
fileinput:
	.ascii "input.txt\0"
openmodeinput:
	.ascii "r\0"
scan:
	.ascii "%d\0"
fileoutput:
	.ascii "output.txt\0"
openmodeoutput:
	.ascii "w\0"
writeoutput:
	.ascii "%d\n\0"

.section .text

	.equ FILE_P, -8
	.equ NUM_P, -16

main:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq $fileinput, %rdi
	movq $openmodeinput, %rsi
	call fopen
	movq %rax, FILE_P(%rbp)

	cmpq $0, %rax
	je .error_open

	movq %rax, %rdi
	movq $scan, %rsi
	leaq NUM_P(%rbp), %rdx
	movq $0, %rax
	call fscanf

	cmpq $1, %rax
	jne .error_read

	movq FILE_P(%rbp), %rdi
	call fclose
	movq NUM_P(%rbp), %rax
	call mainfunc
	movq %rax, NUM_P(%rbp)

	movq $fileoutput, %rdi
	movq $openmodeoutput, %rsi
	call fopen
	movq %rax, FILE_P(%rbp)

	movq FILE_P(%rbp), %rdi
	movq $writeoutput, %rsi
	movq NUM_P(%rbp), %rdx
	movq $0, %rax
	call fprintf

	movq FILE_P(%rbp), %rdi
	call fclose

	leave
	ret

.error_open:
	movq $1, %rax
	leave
	ret

.error_read:
	movq $2, %rax
	leave
	ret

