;------ Looping in assembly -------;
;  Find the sum of the first 100   ;
;          even numbers            ;
;          using a loop            ;
;----------------------------------;


section .data
;--------LOOP CONTROLS-------------;
   loop_counter dq 0x64; 100       ;
   sum          dq 0x00; sum       ;
   increment    dq 0x02; 2         ;
;------------System----------------;
   SYS_EXIT     equ 0x32; 60       ;
   EXIT_SUCCESS equ 0x00           ;
;----------------------------------;


section .text
  global _start

_start:
    mov rcx, qword [loop_counter] ; set rcx to be the loop counter
    mov rax, qword [sum]          ; saying sum = 0

loops:
    add qword [sum], rax
    add rax, qword [increment]    ; add 2 to rax
    dec rcx                       ; loop counter --
    cmp rcx, 0                    ; check if rcx is 0
    jne loops                     ; if above was false then loop

last:
    mov rax, SYS_EXIT             ; say we're calling sys_exit
    mov rsi, EXIT_SUCCESS         ; set exit code to be 0 or success
    syscall
