.globl _start
.section .text

_start:
	movq $8, %rcx
	movb $255, %al
	movb $0b00000001, %bl

and:
	testb %bl, %al
	jnz wasset
	rolb $1, %bl
	decq %rcx
	jnz and
	jmp finish

wasset:
	incq %rdx
	rolb $1, %bl
	decq %rcx
	jnz and

finish:
	movq %rdx, %rdi
	movq $60, %rax
	syscall
