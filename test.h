#ifndef _TEST_H
# define _TEST_H

# include <stdio.h>
# include <fcntl.h>
# include <stdlib.h>
# include <unistd.h>
# include <string.h>

extern ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
extern int		ft_strcmp(const char *s1, const char *s2);
extern char		*ft_strcpy(char * dst, const char * src);
extern char		*ft_strdup(const char *s1);
extern size_t	ft_strlen(const char *s);
extern ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);

#endif
