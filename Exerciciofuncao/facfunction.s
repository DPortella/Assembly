.globl facfunction
.type facfunction, @function

.section .text

facfunction:
	pushq %rbp
 	movq %rbp, %rsp
  	subq $16, %rsp
   
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
