.globl facfunction
.type facfunction, @function

.section .text

facfunction:
	movq %rdi, %rax
	decq %rdi
	cmpq $0, %rdi
	je finish

loop:
	mulq %rdi
	decq %rdi
	jnz loop

finish:
	leave
	ret
