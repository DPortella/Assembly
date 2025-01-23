# Usar com personname.s

.globl _start
.section .text
_start:
	leaq people, %rbx
        movq $6, %rcx
	movq $0, %rdi
	movq $0, %rdx


nameloop:
	movb NAME_OFFSET(%rbx), %al
	cmpb $0, %al
	je compare

uppercase:
	cmpb $'A', %al
	jb continue
	cmpb $'Z', %al
	ja lowercase
	incq %rdi
	jmp continue

lowercase:
	cmpb $'a', %al
	jb continue
	cmpb $'z', %al
	ja continue
	incq %rdi

continue:
	incq %rbx
	jmp nameloop


compare:
	cmpq %rdx, %rdi
	jbe anothername
	movq %rdi, %rdx

anothername:
	addq $41, %rbx
	movq $0, %rdi
	decq %rcx
	jnz nameloop

finish:
	movq %rdx, %rdi
	movq $60, %rax
	syscall
