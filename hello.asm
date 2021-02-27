 .386                   
.model flat, stdcall
.stack 4096                   
option casemap :none                    

;Dependencias
include \masm32\include\windows.inc     
include \masm32\macros\macros.asm       
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data ;Variaveis
    pal       db      "Jonas", 0 ;Palavra que sera invertida
    lenPal    dd      4          ;Length da palavra - 1 -> posicao

.code ;Codigo
main:
    mov eax, offset pal  ;eax recebe a localizacao da palavra
    mov ebx, 0           ;ebx recebe 0
    mov ecx, lenPal      ;ecx recebe a length da palavra

inversao: ;Inverte ate chegar na metade da palavra
    mov dh, byte ptr[eax + ebx] ;dh recebe a letra eax + ebx
    mov dl, byte ptr[eax + ecx] ;dl recebe a letra eax + ecx

    mov byte ptr[eax + ebx], dl ;Subsitui a letra eax + ebx por dl
    mov byte ptr[eax + ecx], dh ;Subsitui a letra eax + ecx por dh

    inc ebx ;ebx = ebx + 1
    dec ecx ;ecx = ecx - 1
    cmp ebx, 3 ;Se ebx < metade
    jne inversao ;Menor -> recomeca, senao prossegue
    
    print eax ;Printa eax, a palavra
    
    end main ;Fim da main