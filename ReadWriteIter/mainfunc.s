.globl mainfunc
.type mainfunc, @function
par:
	.ascii "O numero eh par!\n\0"
impar:
	.ascii "O numero eh impar!\n\0"

.section .text

mainfunc:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq %rax, %rbx
	andq $1, %rax
	jnz odd

even:
	movq stdout, %rdi
	movq $par, %rsi
	movq $0, %rax
	call fprintf

	call facfunction
	jmp finish

odd:
	movq stdout, %rdi
	movq $impar, %rsi
	movq $0, %rax
	call fprintf


	call powerfunction

finish:
	leave
	ret
