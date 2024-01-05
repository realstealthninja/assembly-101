; we define variables and use them.
;
;  consider a register rax
;     this entire thing is rax
;  <--------------rax--------------->
;                   <-----eax-------> 
;                              <-ax-> 
;                              <----> ax is divided into ah and al respectively 
;  [00000000000000000000000000000000] this is in hex containing 64 bytes
;
;  remember one hex digit is 2 bytes
;
;  data section contains initialized variables and constants

section .data


;----------- system ---------------;
EXIT_SUCCESS equ 0 ; here equ says that exit success is a constant of value 0
EXIT_TO_SYS equ 60 ; the code to terminate the program
;---------- general ---------------;
PI equ 3.14
;----------------------------------;

; Following snake_case instead of hUngarianCase defined in the document


;       \/---- datatype of  byte
a       db   40
b       db   10
result  db   0    


;            \/---- datatype of word [ 2 bytes ]
c            dw   4000
d            dw   1000
result_word  dw   0

;                  \/---- datatype of double word [ 4 bytes ]
e                  dd  40000
f                  dd  10000
result_double_word dd  0

g                  dq  400000
h                  dq  100000 ; 
result_quad_word   dq  0      ; 0x00

; section which defines the code
section .text

global _start

_start: 
    ; perform a simple addition operation

    mov   al, byte [a]      ; move a to al
    add   al, byte [b]      ; add variable b to al
    mov   byte [result], al ; move al to variable result


    ; perform a simple addition operation on words

    mov  ax, word [c]
    add  ax, word [d]
    mov  word [result_word], ax 

    ; perform a simple addition operation on double words

    mov eax, dword [e]
    add eax, dword [f]
    mov dword [result_double_word], eax

    ; perform addition on quad words

    mov rax, qword [g]
    add rax, qword [h]
    mov qword [result_quad_word], rax


last:
  mov rax, EXIT_TO_SYS  ; move call code for exit to rax
  mov rdi, EXIT_SUCCESS ; move exit status to rdi
  syscall               ; tell kernel to call the function
