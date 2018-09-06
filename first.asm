data segment
    org 3000h
    opr1 db 22h
    opr2 db 32h
    sum db 00h
data ends
code segment
    assume cs:code,ds:data
    start:mov ax,data
    mov ds,ax
    mov al,opr1
    mov bl,opr2
    add al,bl
    mov sum,al
    mov ah,4ch
    int 21h
code ends
end start