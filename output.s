.globl _start
.section .data
string:
	.ascii "Hello there!\n"
end:
	.equ lenght, end -string

.section .text
_start:
	# numero da chamada de sistema
	movq $1, %rax

	# file descriptor, 0 input de teclado, 1 saida na tela, 2 mensagem de erro
	movq $1, %rdi

	# pointer parao quesera exibido
	movq $string, %rsi

	# tamanho do dado
	movq $lenght, %rdx
	syscall

	# Saida
	movq $60, %rax
	movq $0, %rdi
	syscall
