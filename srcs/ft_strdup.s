# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabois <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 20:12:38 by mabois            #+#    #+#              #
#    Updated: 2019/11/10 20:12:40 by mabois           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64
default rel

section .text
	extern _malloc
	global _ft_strdup
_ft_strdup:
;===================== << save stack
	push rbp
	mov rbp, rsp
;===================== << body
	mov rcx, 0x00			; init counter value
	mov r8, 0x00			; init		'\0' (for cmp)
	and r8, 0xFF			; clear		'\0' (for cmp) A ENLEVER
retry_1:
	mov r9, [rdi + rcx]		; select the char with counter
	and r9, 0xFF			; clear r9
	add rcx, 0x01			; increment char
	cmp r8, r9				; if is not the end of string
	jne retry_1				; jump up to retry_1
;===================== << prepare return value
; rcx is not decremented for take '\0' in consideration
	push rdi				; 		 -save-
	push rcx				; 		 -save-
	mov rdi, rcx			; give counter in argument for malloc
	call _malloc			; malloc > new pointer is now in rax
	pop rcx					; 		+reload+
	pop rdi					; 		+reload+
	cmp rax, 0x00000000		; compare new pointer with NULL
	je ret_null				; if new pointer is NULL, jump to ret_null
retry_2:
	mov dl, [rdi + rcx]  	; select the char with counter for cpy
	mov [rax + rcx], dl		; * copy
	sub rcx, 0x01			; decrement counter
	cmp rcx, 0				; if counter is not before the start of string
	jge retry_2				; jump up to retry_2
;===================== << reload stack
	mov rsp, rbp
	pop rbp
	ret
ret_null:
	mov rax, 0x00000000		; set the return pointer to NULL
;===================== << reload stack
	mov rsp, rbp
	pop rbp
	ret

;=====================================================================
;=========== line 34 :
;                       *
;                          64_rdx > 32_edx > 16_dh > 8_dl
;                               choose dl, not rdx for copy (abort)
