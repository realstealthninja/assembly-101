

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

;---------------------;

c               db  0x06  ; 6
d               db  0x02  ; 2
div_result      db  0x00  ; 0



section .text

global _start

_start:
  

  ;------------ Addition -----------------------;
  mov al, byte [some_number] ; al has value 15
  add al, byte [other_number] ; al = al + 10 | al = 25
  mov byte [resultant_number], al ; result = al = 25


  ;----------- Substraction -------------------;
  mov al, byte [some_number]  ; al has value 15
  sub al, byte [other_number] ; al = al - 10 | al = 5 
  mov byte [sub_result], al   ; sub_result = al = 5

  ;----------- Multiplication -------------------;
  mov  ax, word [a]           ; ax has value 15
  imul ax, word [b]           ; ax = ax * b = 150
  mov  word [mul_result], ax  ; mul_resutl = ax = 150 or 0x0096


  ;----------- division -------------------;

  mov al, byte [c]  ; al has value 6
  mov ah, 0x00      ; ax = 0x0006
  mov bl, byte [d]  ; bl has value 2 
  div bl ; al = ax / bl
  mov byte [div_result], al ; al = ax / bl = 3

  ;---------- using words -----------------;
  mov ax, 0x0006    ; this is just the above code shortened
  mov bl, 0x02      ; 
  div bl            ;
  mov byte [div_result], al 


last: 
  mov rax, EXIT_TO_SYS
  mov rdi, EXIT_SUCCESS
  syscall
