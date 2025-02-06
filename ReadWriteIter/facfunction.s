.globl facfunction
.type facfunction, @function

.section .text

facfunction:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq %rbx, %rax
	decq %rbx
	cmpq $0, %rbx
	je finish

loop:
	mulq %rbx
	decq %rbx
	jnz loop

finish:
	leave
	ret
