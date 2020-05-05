# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabois <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 20:12:24 by mabois            #+#    #+#              #
#    Updated: 2019/11/10 20:12:25 by mabois           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64
default rel

section .text
	global _ft_read
_ft_read:
;===================== << save stack
	push rbp
	mov rbp, rsp
;===================== << body
	mov rax, 0x02000003		; prepare syscall for read
	syscall					; read
	cmp rdx, 0				; check read return
	je end					; if write return error > jump to end
	mov rax, 0xFFFFFFFF		; set return value to -1
;===================== << reload stack
end:
	mov rsp, rbp
	pop rbp
	ret
