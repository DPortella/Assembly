.globl evenodd
.type evenodd, @function
.section .data
par:
        .ascii "O numero e par!\n\0 "

impar:
        .ascii "O numero e impar!\n\0 "


.section .text

evenodd:
	push %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	andq $1,  %rdi
	jnz odd

even:
        movq stdout, %rdi
        movq $par, %rsi
        movq %rax, %rdx
        movq $0, %rax
        call fprintf
	jmp finish


odd:
        movq stdout, %rdi
        movq $impar, %rsi
        movq %rax, %rdx
        movq $0, %rax
        call fprintf


finish:
	leave
	ret
