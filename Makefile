##########################################
#               Constants                #
##########################################

# Folders
APP					=	app
INC					=	${APP}/includes
SRC					=	${APP}/src
BIN					=	bin
OBJ					=	${BIN}/obj

# Compiler settings
CC					=	clang++
CFLAGS				=	-I${INC} -Wall -Wextra -Werror -std=c++98 -fsanitize=address -g3
LDFLAGS				=	${CFLAGS}
NAME				=	exec

# Files
SOURCE_FILES		= \


# Headers
HEADERS_FILES		= \



##########################################
#               Commands                 #
##########################################
EXECUTABLE_FILES		=	${NAME:%=${BIN}/%}
OBJECT_FILES			=	${SOURCE_FILES:%.cpp=${OBJ}/%.o}

all: ${EXECUTABLE_FILES}

clean:
	@rm -r -f ${OBJ}

fclean: clean
	@rm -r -f ${BIN}

re: fclean all

${EXECUTABLE_FILES}: ${OBJECT_FILES}
	@printf "                                                             \r" $@
	@printf "\033[0;32mAll objects completed!\n" $@
	@printf "\033[0;33mBuild!\r" $@

	@${CC} ${LDFLAGS} -o $@ $^

	@printf "\033[0;32mBuild completed!\n" $@
	@printf "\033[0;32mDone!\n" $@
	@echo -n "\033[0m"

${OBJECT_FILES}: ${OBJ}/%.o: %.cpp
	@printf "\033[0;33mGenerating ${NAME} objects... %-33.33s\r" $@

	@mkdir -p ${@D}
	@${CC} -c ${CFLAGS} -o $@ $<

##########################################
#                 Tests                  #
##########################################

# Folders
tst					=	tests
INC_TESTS			=	${tst}/includes
SRC_TESTS			=	${tst}/src
BIN_TESTS			=	bin_t
OBJ_TESTS			=	${BIN_TESTS}/obj

# Compiler settings
CFLAGS_TESTS		=	-I${INC_TESTS} ${CFLAGS}

# Files
SOURCE_FILES_TESTS		= \
	${SRC_TESTS}/main.cpp \
	${SRC_TESTS}/unit_tests.cpp

# Headers
HEADERS_FILES_TESTS		= \
	${INC_TESTS}/unit_tests.hpp

##########################################
#            Commands tests              #
##########################################
EXECUTABLE_FILES_TESTS	=	${NAME:%=${BIN_TESTS}/%}
OBJECT_FILES_TESTS		=	${SOURCE_FILES_TESTS:%.cpp=${OBJ_TESTS}/%.o}

tests: ${EXECUTABLE_FILES_TESTS}

tests_clean:
	@rm -r -f ${OBJ_TESTS}

tests_fclean: tests_clean
	@rm -r -f ${BIN_TESTS}

tests_re: tests_fclean tests

${EXECUTABLE_FILES_TESTS}: ${OBJECT_FILES_TESTS}
	@printf "                                                             \r" $@
	@printf "\033[0;32mAll objects completed!\n" $@
	@printf "\033[0;33mBuild!\r" $@

	@${CC} ${LDFLAGS} -o $@ $^

	@printf "\033[0;32mBuild completed!\n" $@
	@printf "\033[0;32mDone!\n" $@
	@echo -n "\033[0m"

${OBJECT_FILES_TESTS}: ${OBJ_TESTS}/%.o: %.cpp
	@printf "\033[0;33mGenerating ${NAME} objects... %-33.33s\r" $@

	@mkdir -p ${@D}
	@${CC} -c ${CFLAGS_TESTS} -o $@ $<

.PHONY: all clean fclean re tests tests_clean tests_fclean tests_re
