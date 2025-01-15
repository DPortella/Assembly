.global _start
.section .data

num:
  .quad 5

.section .text

_start:
  movq num, %rax
  movq num, %rcx
  decq %rcx
  cmpq $0, %rcx
  je end

loop:
  mulq %rcx
  loopq loop

end:
  movq %rax, %rdi
  movq $60, %rax
  syscall

  
