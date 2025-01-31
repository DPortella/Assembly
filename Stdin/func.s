.globl evenodd
.type evenodd, @function

.section .text

evenodd:
	pushq %rbp
	movq %rbp, %rsp
	subq $16, %rsp

	bsfq %rsi, %rax
	leave
	ret
