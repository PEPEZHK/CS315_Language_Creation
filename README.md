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

## 📂 Project Structure
