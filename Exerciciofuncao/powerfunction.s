.globl powerfunction
.type powerfunction, @function

powerfunction:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $2, %rcx
	movq %rdi, %rax

loop:
	mulq %rdi
	decq %rcx
	jnz loop

finish:
	leave
	ret
