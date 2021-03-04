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
    pal       db      "     " ;Onde o numero sera escrito

.code ;Codigo
main:
    
    declaracao:
        mov eax, 170
        mov ebx, 10
        lea ecx, pal
        jmp divisao
       
    divisao:
        xor edx, edx
        div ebx

        add edx, 48
        push edx

        cmp eax, 0
        jne divisao

        mov ebx, 0
        mov edx, " "
        
        jmp escrever

    escrever:
        pop eax
        mov dword ptr[ecx + ebx], eax
        mov eax, 0

        inc ebx

        mov dword ptr[ecx + ebx], edx

        inc ebx

        cmp ebx, 6
        jne escrever

        print ecx
    
end main ;Fim da main