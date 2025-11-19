# NO_SCRIPT — Custom Programming Language  
CS315 – Programming Language Design  
Team 17 – Spring 2025

## 📌 Overview
**NO_SCRIPT** is a minimal programming language created for Bilkent University’s CS315 course.  
This project includes:

- A **Lexical Analyzer** (Project 1) built using **Lex/Flex**
- A **Parser & Grammar** (Project 2) built using **Yacc/Bison**
- Full language specification: statements, expressions, functions, arrays, loops, I/O, precedence rules, and comments

The language syntax and rules are documented in detail in the included PDF reports.

---

## 🚀 Features
### ✔ Data Types
- `int`, `float`, `bool`
- Arrays: `int[]`, `float[]`, `bool[]`
- `null` literal for uninitialized arrays

### ✔ Control Flow
- `if`, `else if`, `else`
- `while`
- `for (init; condition; update)`

### ✔ Functions
- Return types: `int`, `float`, `bool`, `void`, array-return
- Pass-by-reference parameters
- Return type validation

### ✔ Expressions & Operators
- Arithmetic: `+ - * / % ^`
- Comparison: `< > <= >= == !=`
- Logic: `&& || !`
- Unary +/-
- Full operator precedence hierarchy

### ✔ I/O
- `display(expression)`
- `read()` or `read(identifier)`

### ✔ Comments
- Single-line: `// comment`
- Block: `/* comment */`

---
```text
## 📂 Project Structure
ROOT/
├── CS315Team17Project1/                     # Project 1 — Lexical Analyzer
│   ├── CS315Project1ReportTeam17.pdf        # Report
│   ├── Makefile
│   ├── noscript.l                           # Lex/Flex spec
│   ├── test1
│   ├── test2
│   ├── test3
│   ├── pseudo1
│   ├── pseudo2
│   └── .DS_Store

├── CS315_S25_Team_17_Project_2/             # Project 2 — Parser & Grammar
│   ├── CS315_S25_Team_17_Project_2_Report.pdf
│   ├── CS315_S25_Team17.l                   # Lex spec
│   ├── CS315_S25_Team17.y                   # Yacc/Bison grammar
│   ├── CS315_S25_Team17_1
│   ├── CS315_S25_Team17_1_syntax_error
│   ├── CS315_S25_Team17_2
│   ├── CS315_S25_Team17_2_syntax_error
│   ├── CS315_S25_Team17_3
│   ├── CS315_S25_Team17_3_syntax_error
│   ├── CS315_S25_Team17_4
│   ├── CS315_S25_Team17_4_syntax_error
│   ├── CS315_S25_Team17_5
│   ├── CS315_S25_Team17_5_syntax_error
│   ├── Makefile
│   └── readme

└── README.md

