# Usar com persondata.s

.globl _start
.section .text
_start:
	leaq people, %rbx
	movq numpeople, %rcx
	movq $0, %rdi
	cmpq $0, %rcx
	je finish

brown:
	cmpq $2, HAIR_OFFSET(%rbx)
	jne blonde
	incq %rdi

blonde:
	cmpq $5, HAIR_OFFSET(%rbx)
	jne endloop
	incq %rdi

endloop:
	addq $PERSON_RECORD_SIZE, %rbx
	loopq brown

finish:
	movq $60, %rax
	syscall
