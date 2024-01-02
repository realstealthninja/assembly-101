

section .data
;----------SYS--------;
EXIT_TO_SYS    equ 60
EXIT_SUCCESS   equ 0
;---------------------;

some_number      db  0x0F ; 15
other_number     db  0x0A ; 10
resultant_number db  0x00 ; 0
sub_result       db  0x00 ; 0

;---------------------;

a               dw  0x000F ; 15
b               dw  0x000A ; 10
mul_result      dw  0x0000 ; 0


section .text

global _start

_start:
  

  mov al, byte [some_number] ; al has value 15
  add al, byte [other_number] ; al = al + 10 | al = 25
  mov byte [resultant_number], al ; result = al


  mov al, byte [some_number]  ; al has value 15
  sub al, byte [other_number] ; al = al - 10 | al = 5 
  mov byte [sub_result], al   ; sub_result = al = 5

  mov  ax, word [a]           ; ax has value 15
  imul ax, word [b]           ; ax = ax * b = 150
  mov  word [mul_result], ax  ; mul_resutl = ax = 150 or 0x0096


last: 
  mov rax, EXIT_TO_SYS
  mov rdi, EXIT_SUCCESS
  syscall
