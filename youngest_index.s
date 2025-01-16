# Usar com persondata.s

.globl _start
.section .text
_start:
	leaq people, %rbx
	movq numpeople, %rcx
	movq $256, %rdi
	cmpq $0, %rcx
	je finish

mainloop:
	movq AGE_OFFSET(%rbx), %rax
	cmpq %rdi, %rax
	jae endloop
	movq %rax, %rdi
	movq %rcx, %rdx

endloop:
	addq $PERSON_RECORD_SIZE, %rbx
	loopq mainloop

finish:
	movq %rdx, %rdi
	movq $60, %rax
	syscall
