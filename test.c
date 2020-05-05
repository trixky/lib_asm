/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mabois <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/10 19:46:45 by mabois            #+#    #+#             */
/*   Updated: 2019/11/10 19:46:47 by mabois           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "test.h"

void			ft_cut(char *dst_1, char *dst_2, char *string, char *src)
{
	int argc;

	printf("\ntest ============================== ft_strcpy\n\n");
	string = ft_strcpy(dst_1, src);
	printf("argc unofficiel = '%s'\n", string);
	string = strcpy(dst_2, src);
	printf("argc officiel   = '%s'\n", string);
	printf("\ntest ============================== ft_strdup\n\n");
	string = ft_strdup(src);
	printf("argc unofficiel = '%s'\n", "cactus doux");
	string = strdup(src);
	printf("argc officiel   = '%s'\n", "cactus doux");
	printf("\ntest ============================== ft_strlen\n\n");
	argc = ft_strlen(src);
	printf("argc unofficiel = '%d'\n", argc);
	argc = strlen(src);
	printf("argc officiel   = '%d'\n", argc);
	printf("\ntest ============================== ft_write\n\n");
	argc = ft_write(1, "blop", 3);
	printf("\nargc unofficiel = '%d'\n", argc);
	argc = write(1, "blop", 3);
	printf("\nargc officiel   = '%d'\n", argc);
}

int				main(int argc, char **argv)
{
	char	*string;
	char	*string_malloced;
	char	*src;
	char	*dst_1;
	char	*dst_2;

	argv[0] = NULL;
	src = "|une source|";
	dst_1 = malloc(sizeof(char) * 200);
	dst_2 = malloc(sizeof(char) * 200);
	string_malloced = malloc(sizeof(char) * 200);
	printf("\ntest ============================== ft_read\n\n");
	argc = ft_read(0, string_malloced, 2);
	printf("string_malloced = '%s'\n", string_malloced);
	printf("argc = %d\n", argc);
	printf("\ntest ============================== ft_strcmp\n\n");
	argc = ft_strcmp(src, dst_1);
	printf("argc unofficiel = %d\n", argc);
	argc = strcmp(src, dst_2);
	printf("argc officiel   = %d\n", argc);
	ft_cut(dst_1, dst_2, string, src);
	return (0);
}
