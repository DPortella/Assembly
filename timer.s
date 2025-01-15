.globl _start
.section .text
_start:
	movq $5, %rcx
	movq $0, %rbx
	cmpq $0, %rcx
	je end

loop:
	incq %rbx
	loopq loop

end:
	movq %rcx, %rdi
	movq $60, %rax
	syscall
