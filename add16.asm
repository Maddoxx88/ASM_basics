data segment
    str1 db 10,13,"First operand =$"
    str2 db 10,13,"Second operand =$"
    str3 db 10,13,"Output is : $"
    a dw 1234h
    b dw 5678h
    sum dw 00h
    tempa dw ?
data ends

strdis macro temp
lea dx,temp
mov ah,09h
int 21h
endm

code segment
    assume cs:code,ds:data
displayd proc near 
mov ch,04h
up:mov ax,tempa
mov cl,04h
rol ax,cl
mov tempa,ax
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

strdis str1
mov ax,a
mov tempa ,ax
call displayd

strdis str2
mov bx,b
mov tempa,bx
call displayd

strdis str3
mov ax,a
mov bx,b
add ax,bx
mov tempa,ax
call displayd
mov ah,4ch
int 21h
code ends
end start
   