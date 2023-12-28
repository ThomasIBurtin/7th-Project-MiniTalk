CC = gcc
CFLAGS = -Werror -Wall -Wextra

SRC1 = client/client.c client/ft_atoi.c
OBJ1 = $(SRC1:.c=.o)

SRC2 = server/server.c
OBJ2 = $(SRC2:.c=.o)

NAME1 = client_exe
NAME2 = server_exe

all: fonc_printf $(NAME1)

$(NAME1): $(OBJ1) $(NAME2)
	$(CC) -o $(NAME1) $(OBJ1) printf/*.o 

$(NAME2): $(OBJ2)
	$(CC) -o $(NAME2) $(OBJ2) printf/*.o

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

fonc_printf:
	$(MAKE) -C printf

clean:
	rm -f $(OBJ1) $(OBJ2)
	$(MAKE) clean -C printf

fclean: clean
	rm -f $(NAME1) $(NAME2)
	$(MAKE) fclean -C printf

re: fclean all