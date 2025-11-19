# Compiler
CC = gcc
LEX = lex
YACC = yacc

# Source Files
LEX_SRC = CS315_S25_Team17.l
YACC_SRC = CS315_S25_Team17.y

# Generated Files
LEX_OUT = lex.yy.c
YACC_OUT_C = y.tab.c
YACC_OUT_H = y.tab.h

# Output Binary
TARGET = parser

all: $(TARGET)

$(TARGET): $(YACC_OUT_C) $(LEX_OUT)
	$(CC) -o $(TARGET) $(YACC_OUT_C)

$(YACC_OUT_C) $(YACC_OUT_H): $(YACC_SRC)
	$(YACC) -d $(YACC_SRC)

$(LEX_OUT): $(LEX_SRC)
	$(LEX) $(LEX_SRC)

clean:
	rm -f $(TARGET) $(YACC_OUT_C) $(YACC_OUT_H) $(LEX_OUT)
