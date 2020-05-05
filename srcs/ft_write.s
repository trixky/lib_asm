# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabois <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 20:12:50 by mabois            #+#    #+#              #
#    Updated: 2019/11/10 20:12:51 by mabois           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64
default rel

section .text
	global _ft_write
_ft_write:
;===================== << save stack
	push rbp
	mov rbp, rsp
;===================== << body
	push rdx				; push nbytes
	mov rax, 0x2000004		; prepare syscall for write
	syscall					; write
	pop rdx					; pop nbytes to return value
	cmp rax, rdx			; check write return
	je end					; if write return != nbytes > jump to end
	mov rax, 0xFFFFFFFF		; set return value to -1
;===================== << reload stack
end:
	mov rsp, rbp
	pop rbp
	ret
