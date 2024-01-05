;------------------------;
;  Simple hello world    ;
;      program for       ;
;    assembly x86_64     ;
;------------------------;

section .data
  string db "Hello world" ; message to be printed 
  msglen dq 11            ; length of message

;-------- SYSTEM ---------;
  EXIT_SUCCESS equ 0x00   ; code to exit system 0
  STDOUT equ 0x01         ; code for standard output
;-------------------------;
  SYS_WRITE equ 0x01      ; code for system write
  SYS_EXIT equ 60         ; code for system exit
;-------------------------;

section .text
global _start             ; telling linker start is _start

_start:
  mov rax, SYS_WRITE      ; saying are calling system write
  mov rdi, STDOUT         ; saying we are using standard output
  mov rsi, string         ; address to string
  mov rdx, qword [msglen] ; length of string
  syscall

last:
  mov rax, SYS_EXIT       ; saying we are calling system exit
  mov rdi, EXIT_SUCCESS   ; saying our exit code is 0
  syscall
