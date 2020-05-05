# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabois <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 20:12:29 by mabois            #+#    #+#              #
#    Updated: 2019/11/10 20:12:30 by mabois           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64
default rel

section .text
	global _ft_strcmp
_ft_strcmp:
;===================== << save stack
	push rbp
	mov rbp, rsp
;===================== << body
		mov rax, 0x00			; init return value
		mov rcx, 0x00			; init counter value
		mov rdx, 0x00			; init '\0' (for cmp)
	retry:
		mov r9, [rdi + rcx]		; select the char with counter for cmp
		and r9, 0xFF			; clear	string one (for cmp)
		mov r8, [rsi + rcx]		; select the char with counter for cmp
		and r8, 0xFF			; clear	string two (for cmp)
		add rcx, 0x01			; increment counter

		cmp r8, r9				; compare chars
		jne update_ret			; if chars diff > exit retry
		cmp r8, rdx				; check if string one is not finish
		jne retry				; if chars are equeal > retry on next char
		jmp end
	update_ret:					;		jump here if string are differents
		mov rax, r9				;		update return value
		sub rax, r8				;		update return value
	end:						;		jump here if string are equals
;===================== << reload stack
	mov rsp, rbp
	pop rbp
	ret
