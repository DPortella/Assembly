.globl mainfunc
.type mainfunc, @function

.section .text

mainfunc:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq %rax, %rbx
	andq $1, %rax
	jnz odd

even:
	call facfunction
	jmp finish

odd:
	call powerfunction

finish:
	leave
	ret
