# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabois <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 20:12:45 by mabois            #+#    #+#              #
#    Updated: 2019/11/10 20:12:46 by mabois           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64
default rel

section .text
	global _ft_strlen
_ft_strlen:
;===================== << save stack
	push rbp
	mov rbp, rsp
;===================== << body
	mov rcx, 0x00			; init counter value
	mov r8, 0x00			; init		'\0' (for cmp)
	and r8, 0xFF			; clear		'\0' (for cmp)
	; cmp rdi, 0x00			; if string is NULL  ATTENTION > tooSace ?
	; je skip					; skip body
	
retry:
	mov r9, [rdi + rcx]		; select the char with counter
	and r9, 0xFF			; clear r9
	add rcx, 0x01			; increment char
	cmp r8, r9				; if is not the end of string
	jne retry				; jump up to retry
;===================== << prepare return value
	sub rcx, 0x01			; decrement counter by one by one
; skip:
	mov rax, rcx			; put conter in return register
;===================== << reload stack
	mov rsp, rbp
	pop rbp
	ret
