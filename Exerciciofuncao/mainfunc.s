.globl mainfunc
.type mainfunc, @function

.section .text

mainfunc:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	bsfq %rdi, %rbx
	cmpq $0, %rbx
	je odd

even:
	call facfunction
	jmp finish

odd:
	call powerfunction


finish:
	leave
	ret
