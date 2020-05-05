# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mabois <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 20:14:46 by mabois            #+#    #+#              #
#    Updated: 2019/11/10 20:14:48 by mabois           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

BONUS = bonus

SRCS =	./srcs/ft_read.s\
		./srcs/ft_strcmp.s\
		./srcs/ft_strcpy.s\
		./srcs/ft_strdup.s\
		./srcs/ft_strlen.s\
		./srcs/ft_write.s

OBJECTS = $(SRCS:.s=.o)

NASM = nasm

FLAGS = -f macho64

all : $(NAME)

%.o:%.s
	$(NASM) $(FLAGS) $< -o $@

$(NAME) : $(OBJECTS)
	ar rc $@ $(OBJECTS)
	# ranlib $@

.PHONY : clean all fclean re bonus

clean :
	rm -f $(OBJECTS)

fclean : clean
	rm -f $(NAME)

re : fclean all
