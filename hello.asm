; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�
    include \masm32\include\masm32rt.inc
; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

    .data
      var4   db  "Jonas",13,10,0

    .code

start:
   
; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

    call main
    inkey
    exit

; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

main proc

    mov esi, offset var4 + 0
    mov edi, offset var4 + 4
    mov ebx, offset var4


    mov al, [esi]
    mov bl, [edi]
    mov [edi], al
    mov [esi], bl
    inc esi
    dec edi
    mov al, [esi]
    mov bl, [edi]
    mov [edi], al
    mov [esi], bl
    inc esi
    dec edi
    mov al, [esi]
    mov bl, [edi]
    mov [edi], al
    mov [esi], bl
	
	
    print ebx

    ret

main endp

; いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい�

end start
