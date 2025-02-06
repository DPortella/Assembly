.globl powerfunction
.type powerfunction, @function

powerfunction:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $2, %rcx
	movq %rbx, %rax

loop:
	mulq %rbx
	decq %rcx
	jnz loop

finish:
	leave
	ret
