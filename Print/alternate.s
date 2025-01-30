.globl _start
.section .data
string1:
	.ascii "Hello World!\n"
string1end:
	.equ string1lenght, string1end - string1

string2:
	.ascii "Hello there!\n"
string2end:
	.equ string2lenght, string2end - string2

.section .text
_start:
	movq $1, %rbx

loopcontrol:
	bsfq %rbx, %rcx
	cmpq $0, %rcx
	je stringworld

stringthere:
	movq $1, %rax
	movq $1, %rdi
	movq $string2, %rsi
	movq $string2lenght, %rdx
	syscall
	incq %rbx
	cmpq $10, %rbx
	jne loopcontrol
	jmp finish


stringworld:
	movq $1, %rax
	movq $1, %rdi
	movq $string1, %rsi
	movq $string1lenght, %rdx
	syscall
	incq %rbx
	cmpq $10, %rbx
	jne loopcontrol

finish:
	movq $60, %rax
	movq $0, %rdi
	syscall
