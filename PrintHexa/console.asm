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
    
    declaracao: ;declaracao das variaveis
        mov eax, 170
        mov ebx, 10
        lea ecx, pal
        jmp divisao
       
    divisao: ;divisao dos numeros
        xor edx, edx ;zera
        div ebx

        add edx, 48 ;tabela ascii
        push edx ;coloca na pilha

        cmp eax, 0
        jne divisao ;se nao for 0 volta
	
	;preparando para escrever
        mov ebx, 0
        mov edx, " "
        
        jmp escrever

    escrever: ;monta e escreve a palavra na tela
        pop eax ;pega da pilha
        mov dword ptr[ecx + ebx], eax ;coloca o numero
        mov eax, 0

        inc ebx ;proxima posicao

        mov dword ptr[ecx + ebx], edx ;coloca o espaco

        inc ebx

        cmp ebx, 6
        jne escrever ;se nao eh 6 volta

        print ecx ;printa o resultado
    
end main ;Fim da main