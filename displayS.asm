data segment
    str1 db 10,13,"First operand =$"
    str2 db 10,13,"Second operand =$"
    str3 db 10,13,"Output is : $"
    a db 32h
    b db 22h
    diff db 00h
    tempa db ?
data ends

strdis macro temp
lea dx,temp
mov ah,09h
int 21h
endm

code segment
    assume cs:code,ds:data
displayd proc near 
mov ch,02h
up:mov al,tempa
mov cl,04h
rol al,cl
mov tempa,al
AND al,0Fh
cmp al,0Ah
jc dis
add al,07h
dis:
add al,30h
mov dl,al
mov ah,02h
int 21h
dec ch
jnz up
ret
displayd endp

start:mov ax,data
mov ds,ax
mov al,a
mov bl,b
sub al,bl
mov diff,al
strdis str1
mov al,a
mov tempa ,al
call displayd
strdis str2
mov bl,b
mov tempa,bl
call displayd
strdis str3
mov al,diff
mov tempa,al
call displayd
mov ah,4ch
int 21h
code ends
end start
   